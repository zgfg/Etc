am kill all com.google.android.gms

/data/user/0/sksa.aa.tweaker/sqlite3 -batch /data/data/com.google.android.gms/databases/phenotype.db 'DELETE FROM Flags WHERE name="AppValidation__blocked_packages_by_installer_list";
		DROP TRIGGER IF EXISTS aa_block3rdapp_hack;'

/data/user/0/sksa.aa.tweaker/sqlite3 -batch /data/data/com.google.android.gms/databases/phenotype.db 'DROP TRIGGER IF EXISTS aa_block3rdapp_hack;
    DELETE FROM FlagOverrides WHERE name="AppValidation__blocked_packages_by_installer";
    DELETE FROM Flags WHERE name="AppValidation__blocked_packages_by_installer";'
   
/data/user/0/sksa.aa.tweaker/sqlite3 -batch /data/data/com.google.android.gms/databases/phenotype.db 'CREATE TRIGGER aa_block3rdapp_hack AFTER DELETE
		ON FlagOverrides
		BEGIN
		DELETE FROM FlagOverrides WHERE name="AppValidation__blocked_packages_by_installer";
    DELETE FROM Flags WHERE name="AppValidation__blocked_packages_by_installer";
		END;'
		