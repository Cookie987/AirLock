@echo off
chcp 65001
rem @file:AirLock.cmd
rem @author:Cookie987
rem @date:2022.10.6


rem 在此设置WiFi包含的名称
set wifi_name=987

set log_file=AirLock.log
cls

rem 如果存在AirLock.conf则从里面读取
if exist AirLock.conf set /P wifi_name=<AirLock.conf

rem 日志
echo [%date% %time%] Program started. TargetWifi:%wifi_name% >>%log_file%

:mainProgram
	cls
	(netsh WLAN show interfaces | findStr %wifi_name% >nul && ( 
		echo 解锁成功
		echo [%date% %time%] Successful unlock. >>%log_file%
		exit
	)) || (
		echo 请插入认证件 / 打开认证服务器
		echo [%date% %time%] Unlock failed. >>%log_file%
        logoff
	)