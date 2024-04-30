@echo off
title SE X8 CWM by Miner203
echo ---------------------------------------
echo      SE X8 CWM installer by Miner203 
echo.
echo !!  This script require SuperSU 2.79 !!
echo !!       SU binary on your SE X8     !!
echo ---------------------------------------
echo.
echo [*] Restarting ADB server...
Files\adb.exe kill-server >nul
Files\adb.exe start-server >nul
echo [*] ADB server restarted.
echo [*] Waiting for device...
Files\adb.exe wait-for-device >nul
echo [*] Device found.
Files\adb.exe push Files\sh /data/local/tmp/sh
Files\adb.exe push Files\charger /data/local/tmp/charger
Files\adb.exe push Files\busybox /data/local/tmp/busybox
Files\adb.exe push Files\chargemon /data/local/tmp/chargemon
Files\adb.exe push Files\recovery.tar /data/local/tmp/recovery.tar
echo [*] CWM pushed to temp dir
echo [*] Accept SU request!
Files\adb.exe shell "su -c 'mount -o remount,rw -t yaffs2 /dev/block/mtdblock0 /system'"
echo [*] /system mounted as RW
Files\adb.exe shell "su -c 'chmod 777 /data/local/tmp/sh'"
Files\adb.exe shell "su -c 'chmod 777 /data/local/tmp/charger'"
Files\adb.exe shell "su -c 'chmod 777 /data/local/tmp/busybox'"
Files\adb.exe shell "su -c 'chmod 777 /data/local/tmp/chargemon'"
Files\adb.exe shell "su -c 'chmod 777 /data/local/tmp/recovery.tar'"
Files\adb.exe shell "su -c '/data/local/tmp/busybox cp /data/local/tmp/sh /system/xbin/sh'"
Files\adb.exe shell "su -c '/data/local/tmp/busybox cp /data/local/tmp/chargemon /system/bin/chargemon'"
Files\adb.exe shell "su -c '/data/local/tmp/busybox cp /data/local/tmp/busybox /system/bin/busybox'"
Files\adb.exe shell "su -c '/data/local/tmp/busybox cp /data/local/tmp/charger /system/bin/charger'"
Files\adb.exe shell "su -c '/data/local/tmp/busybox cp /data/local/tmp/recovery.tar /system/bin/recovery.tar'"
Files\adb.exe shell rm /data/local/tmp/sh
Files\adb.exe shell rm /data/local/tmp/charger
Files\adb.exe shell rm /data/local/tmp/busybox
Files\adb.exe shell rm /data/local/tmp/chargemon
Files\adb.exe shell rm /data/local/tmp/recovery.tar
echo [*] CWM moved to /system/bin dir
Files\adb.exe shell "su -c 'mount -o remount,ro -t yaffs2 /dev/block/mtdblock0 /system'"
echo [*] /system mounted as RO.
echo [*] Stopping server...
Files\adb.exe kill-server
echo [*] Done! Press any key to exit.
pause >nul