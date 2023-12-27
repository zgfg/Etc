#!/bin/sh

DIR_DEPTH="4"           # Increase for crawling deeper than to sub-sub-sub-sub-folders 
SPIC_Y_COORD="1000"     # Try with lower y if script fails to automatically kick "Make Play Integrity test" button in SPIC
SPIC_WAIT_VERDICT="12"  # Play Integrity verdict usually returns in 5-6 seconds, but if you decrease and verdict arrives later, script will miss to read

TEST_YASNAC="1"          # Set undefined or empty to skip testing SN with YASNAC, or else script will first test SN with YASNAC (to speed-up filtering of JSON files)
YASNAC_Y_COORD="1250"    # Try with lower y if it fails to automatically kick "Run SafetyNet Check" button in YASNAC
YASNAC_WAIT_VERDICT="8"  # SafetyNet verdict usually returns in 3-4seconds, but if you decrease and verdict arrives later, script will miss to read

PIF_JSON="/data/adb/pif.json"                                 # For Chiteroman PI Fix module
CUSTOM_JSON="/data/adb/modules/playintegrityfix/custom.pif.json"  # For Osm0sis PI Fork module

# Re-program the code beyond this line on your own risk
path="$1"; [ -z "$path" ] && path=${0%/*}

list="$path/pif.txt"; rm -f "$list"
log="$path/pif.log"
yasnac_xml="$path/yasnac_xml"; spic_xml="$path/spic_xml"

spic="com.henrikherzig.playintegritychecker"
yasnac="rikka.safetynetchecker"
gms="com.google.android.gms.unstable"

integrities="NO_INTEGRITY MEETS_VIRTUAL_INTEGRITY MEETS_BASIC_INTEGRITY MEETS_DEVICE_INTEGRITY MEETS_STRONG_INTEGRITY"

pif_bak="$path/pif.bak"
rm -f "$pif_bak"; cp $PIF_JSON "$pif_bak" >/dev/null 2>&1
custom_bak="$path/custom.bak"
rm -f "$custom_bak"; cp $CUSTOM_JSON "$custom_bak" >/dev/null 2>&1

orient=$(settings get system user_rotation)
auto_rot=$(settings get system accelerometer_rotation)
settings put system user_rotation 0
settings put system accelerometer_rotation 0

function test_yasnac()
{
  local json="$1"
  cp "$json" $PIF_JSON; cp "$json" $CUSTOM_JSON
  rm -f "$log"; rm -f "$yasnac_xml"

  am start -n $yasnac/$yasnac.main.MainActivity >/dev/null 2>&1
  sleep 2

  logcat -c
  killall $gms >/dev/null 2>&1
  input tap 250 $YASNAC_Y_COORD

  sleep $YASNAC_WAIT_VERDICT
  uiautomator dump "$yasnac_xml" >/dev/null 2>&1
  killall $yasnac >/dev/null 2>&1
  logcat -d | grep PIF/ >> "$log"

  (( pass = 0 )); found=$(cat "$yasnac_xml" | grep "Pass")
  [ -n "$found" ] && (( pass = 1 ))

  (( fail = 0 )); found=$(cat "$yasnac_xml" | grep "Fail")
  [ -n "$found" ] && (( fail = 1 ))

  (( basic = 0 )); found=$(cat "$yasnac_xml" | grep "BASIC")
  [ -n "$found" ] && (( basic = 1 ))

  (( hw = 0 )); found=$(cat "$yasnac_xml" | grep "HARDWARE_BACKED")
  [ -n "$found" ] && (( hw = 1 ))

  echo "Pass:$pass Fail:$fail BASIC:$basic HW:$hw" | tee -a "$list"
  ((( basic + hw != 1 )) || (( pass + fail < 1 ))) && return 0

  (( pass == 0 )) && return 1
  (( fail > 0 )) && return 2
  (( hw == 0 )) && return 3
  return 4
}

function test_spic()
{
  local json="$1"
  cp "$json" $PIF_JSON; cp "$json" $CUSTOM_JSON
  rm -f "$log"; rm -f "$yasnac_xml"

  am start -n $spic/$spic.MainActivity >/dev/null 2>&1
  sleep 2

  logcat -c
  killall $gms >/dev/null 2>&1
  input tap 250 $SPIC_Y_COORD

  sleep $SPIC_WAIT_VERDICT
  uiautomator dump "$spic_xml" >/dev/null 2>&1
  killall $spic >/dev/null 2>&1
  logcat -d | grep PIF/ >> "$log"

  (( i = 0 )); (( val = i++ ))
  for meets in $integrities
  do
    found=$(cat "$spic_xml" | grep $meets)
    [ -n "$found" ] && echo $meets | tee -a "$list" && (( val = i ))
    (( i++ ))
  done
  return $val
}

function test_modified_json()
{
  local json="$1"

  # Missing a check if FIRST_API_LEVEL was already 25 or lower
  if [ -n "$2" ]; then
    sed -i 's/"FIRST_API_LEVEL"[^,}]*/"FIRST_API_LEVEL": "25"/' "$json"
    sed -i 's/"DEVICE_INITIAL_SDK_INT"[^,}]*/"DEVICE_INITIAL_SDK_INT": "25"/' "$json"
  fi

  test_spic "$json"; (( val = $? ))
  return $val
}

function update_json()
{
  local json="$1"
  
  build_id=$(cat "$json" | grep "\"BUILD_ID\"")
  id=$(cat "$json" | grep "\"ID\"")
  [ -n "$build_id" ] && [ -z "$id" ] && sed -i 's/"BUILD_ID"\([^,}]*\)/"BUILD_ID"\1, "ID"\1/' "$json"
  [ -n "$id" ] && [ -z "$build_id" ] && sed -i 's/"ID"\([^,}]*\)/"ID" \1, "BUILD_ID" \1/' "$json"
  
  api=$(cat "$json" | grep "\"FIRST_API_LEVEL\"")
  sdk=$(cat "$json" | grep "\"DEVICE_INITIAL_SDK_INT\"")
  [ -n "$api" ] && [ -z "$sdk" ] && sed -i 's/"FIRST_API_LEVEL"\([^,}]*\)/"FIRST_API_LEVEL" \1, "DEVICE_INITIAL_SDK_INT" \1/' "$json"
  [ -n "$sdk" ] && [ -z "$api" ] && sed -i 's/"DEVICE_INITIAL_SDK_INT"\([^,}]*\)/"DEVICE_INITIAL_SDK_INT" \1, "FIRST_API_LEVEL" \1/' "$json"
}

function test_dir()
{
  local dir="$1"
  ls "$dir"/*.json 2>/dev/null | while read json
  do
    ([ -z "$json" ] || [ ! -f "$json" ] || [ ! -r "$json" ]) && continue

    echo "$json" | tee -a "$list"
	   update_json "$json"
    (( val = 0 )); low=""

    if [ -n "$TEST_YASNAC" ]; then
      test_yasnac "$json"; (( val = $? ))
      (( val == 2 )) && low="1"
    fi

#    (( val < 4 )) &&
    (( val != 1 )) && test_modified_json "$json" "$low" && (( val = $? ))
    [ -z "$low" ] && (( val > 1 )) && (( val < 4 )) && test_modified_json "$json" "1" && (( val = $? ))

    (( val > 0 )) && (( val < 4 )) && echo "Deleted" | tee -a "$list" && rm -f "$json"
    (( val == 0 )) && echo "Inconclusive" | tee -a "$list"

    echo "" | tee -a "$list"
  done
}

find "$path" -maxdepth $DIR_DEPTH -type d 2>/dev/null | while read dir
do
  ([ -z "$dir" ] || [ ! -e "$dir" ]) && continue
  test_dir "$dir"
done

rm -f "$PIF_JSON"; mv "$pif_bak" $PIF_JSON >/dev/null 2>&1
rm -f "$CUSTOM_JSON"; mv "$custom_bak" $CUSTOM_JSON >/dev/null 2>&1
killall $gms >/dev/null 2>&1

killall $spic >/dev/null 2>&1; killall $yasnac >/dev/null 2>&1
rm -f "$yasnac_xml"; rm -f "$spic_xml"

settings put system user_rotation "$orient"
settings put system accelerometer_rotation "$auto_rot"
