@echo off

:load
if not exist ".\functions\main.ps1" goto failed
set ps=%SystemRoot%\sysnative\WindowsPowerShell\v1.0\powershell.exe

:begin
cls
title SoTap Commandline Reader
echo SoTap Commandline Reader [版本 1]
echo.

:input
set /p con=%username%^> 
if "%con%"=="exit" exit
powershell -file functions\main.ps1 %con%
goto input

:failed
echo 由于缺少必要的文件，无法启动简易命令行。
pause
exit