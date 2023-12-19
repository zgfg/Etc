#!/bin/sh

MAX_DEPTH=4      # Increase for crawling deeper than to sub-sub-sub-sub-folders
Y_COORD=1000     # Test with decreasing if it fails to automatically kick "Make Play Integrity test" button 
WAIT_VERDICT=12  # Verdict usually returns in 2-3 seconds, but if you decrease and verdict arrives later, script will miss to read 

#custom_json=/data/adb/pif.json   # For Chiteroman PI Fix module                   
custom_json=/data/adb/modules/playintegrityfix/custom.pif.json  # For Osm0sis PI Fork module

# Re-program the code beyond this line on your own risk
path="$1"
[ -z "$path" ] && path=${0%/*}

list="$path/pif.txt"
log="$path/pif.log"; xml="$path/pif.xml"
rm -f "$list"

spic=com.henrikherzig.playintegritychecker
gms=com.google.android.gms.unstable

integrities="NO_INTEGRITY MEETS_VIRTUAL_INTEGRITY MEETS_BASIC_INTEGRITY MEETS_DEVICE_INTEGRITY MEETS_STRONG_INTEGRITY"

bak_json="$path/pif.bak"
cp $custom_json "$bak_json"

orient=$(settings get system user_rotation)
auto_rot=$(settings get system accelerometer_rotation)
settings put system user_rotation 0
settings put system accelerometer_rotation 0

function test-json()
{
  local json="$1"
  cp "$json" $custom_json
  rm -f "$log"; rm -f "$xml"

  am start -n $spic/$spic.MainActivity >/dev/null 2>&1
  sleep 2
    
  logcat -c
  killall $gms >/dev/null 2>&1
  input tap 250 $Y_COORD

  sleep 12
  uiautomator dump "$xml" >/dev/null 2>&1
  killall $spic >/dev/null 2>&1
  logcat -d | grep PIF/ >> "$log"

  (( i=0 )); (( val=i++ ))
  for meets in $integrities
  do
    pass=$(cat $xml | grep $meets)
    [ ! -z "$pass" ] && echo $meets | tee -a "$list" && (( val=i ))
    (( i++ ))
  done
  return $val
}

function test-modified-json()
{
  local json="$1"
  if [ -n "$2" ]; then
    sed -i 's/"FIRST_API_LEVEL".*/"FIRST_API_LEVEL": "23"/' "$json"
  else
    sed -i 's/"FIRST_API_LEVEL".*/"FIRST_API_LEVEL": "25"/' "$json"
  fi

  test-json "$json"
  return $?
}

function test-dir()
{
  ls "$1"/*.json 2>/dev/null | while read json
  do
    ([ ! -n "$json" ] || [ ! -f "$json" ] || [ ! -r "$json" ]) && continue

    echo "$json" | tee -a "$list"
    test-json "$json"; val=$?

    (( val>1 )) && (( val<4 )) && test-modified-json "$json" && val=$?

#    (( val>1 )) && (( val<4 )) && test-modified-json "$json" 1 && val=$?

    (( val>0 )) && (( val<4 )) && rm -f "$json"

  echo "" | tee -a "$list"
  done
}

find "$path" -maxdepth $MAX_DEPTH -type d 2>/dev/null | while read dir
do
  ([ ! -n "$dir" ] || [ ! -e "$dir" ]) && continue
  test-dir "$dir"
done

mv "$bak_json" $custom_json
killall $gms >/dev/null 2>&1

killall $spic >/dev/null 2>&1
rm -f "$xml"

settings put system user_rotation "$orient"
settings put system accelerometer_rotation "$auto_rot"
