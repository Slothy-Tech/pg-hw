@echo off
echo Collecting Hardware IDs...
echo Please wait...

:: Set output file name with current date and time
set "datetime=%date:~10,4%%date:~4,2%%date:~7,2%_%time:~0,2%%time:~3,2%%time:~6,2%"
set "filename=HWID_Info_%datetime%.txt"

:: Create or clear the output file
echo Hardware ID Information > "%filename%"
echo Generated on: %date% %time% >> "%filename%"
echo. >> "%filename%"

:: Get System Information
echo === System Information === >> "%filename%"
wmic csproduct get IdentifyingNumber,Name,UUID >> "%filename%"
echo. >> "%filename%"

:: Get CPU Information
echo === CPU Information === >> "%filename%"
wmic cpu get ProcessorId >> "%filename%"
echo. >> "%filename%"

:: Get BIOS Information
echo === BIOS Information === >> "%filename%"
wmic bios get SerialNumber >> "%filename%"
echo. >> "%filename%"

:: Get Disk Drive Information
echo === Disk Drive Information === >> "%filename%"
wmic diskdrive get SerialNumber >> "%filename%"
echo. >> "%filename%"

:: Get Baseboard (Motherboard) Information
echo === Motherboard Information === >> "%filename%"
wmic baseboard get SerialNumber >> "%filename%"
echo. >> "%filename%"

echo Hardware ID collection complete!
echo Results saved to: %filename%
pause
