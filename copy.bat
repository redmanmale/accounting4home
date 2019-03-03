@echo off

REM Rename old sms database file if it exists
if exist sms.db ren sms.db sms-%date:~-4%-%date:~3,2%-%date:~0,2%.db

REM Copy sms database file from system to user-accessed space
adb shell "su -c 'cat /data/data/com.android.providers.telephony/databases/mmssms.db > /mnt/sdcard/sms.db'"

REM Copy sms database file from phone to PC
adb pull /mnt/sdcard/sms.db .

REM Delete _copy_ of sms database file from user-accessed space on the phone
REM We don't touch system here!
adb shell "rm /mnt/sdcard/sms.db"
