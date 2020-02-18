Title Disable UAC, M$ store and Welcome screen & Color 0A
cd %systemroot%\system32
call :IsAdmin

:: Disable new user welcome dialogue
reg.exe ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v EnableFirstLogonAnimation /t REG_DWORD /d 0 /f

:: Turn off UAC
reg.exe ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f

:: Administratively disable Microsoft Store
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\safer\codeidentifiers" /v "authenticodeenabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\safer\codeidentifiers" /v "DefaultLevel" /t REG_DWORD /d "262144" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\safer\codeidentifiers" /v "TransparentEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\safer\codeidentifiers" /v "PolicyScope" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\safer\codeidentifiers" /v "ExecutableTypes" /t REG_MULTI_SZ /d "ADE\0ADP\0BAS\0BAT\0CHM\0CMD\0COM\0CPL\0CRT\0EXE\0HLP\0HTA\0INF\0INS\0ISP\0LNK\0MDB\0MDE\0MSC\0MSI\0MSP\0MST\0OCX\0PCD\0PIF\0REG\0SCR\0SHS\0URL\0VB\0WSC" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\safer\codeidentifiers\0\Paths\{92507ec3-973e-4aeb-b9d6-f37aaa9913cf}" /v "Description" /t REG_SZ /d "disable MS store" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\safer\codeidentifiers\0\Paths\{92507ec3-973e-4aeb-b9d6-f37aaa9913cf}" /v "SaferFlags" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\safer\codeidentifiers\0\Paths\{92507ec3-973e-4aeb-b9d6-f37aaa9913cf}" /v "ItemData" /t REG_EXPAND_SZ /d "%%programfiles%%\WindowsApps\Microsoft.WindowsStore*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\safer\codeidentifiers\262144\Paths\{191cd7fa-f240-4a17-8986-94d480a6c8ca}" /v "Description" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\safer\codeidentifiers\262144\Paths\{191cd7fa-f240-4a17-8986-94d480a6c8ca}" /v "SaferFlags" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\safer\codeidentifiers\262144\Paths\{191cd7fa-f240-4a17-8986-94d480a6c8ca}" /v "ItemData" /t REG_EXPAND_SZ /d "%%HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRoot%%" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\safer\codeidentifiers\262144\Paths\{d2c34ab2-529a-46b2-b293-fc853fce72ea}" /v "Description" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\safer\codeidentifiers\262144\Paths\{d2c34ab2-529a-46b2-b293-fc853fce72ea}" /v "SaferFlags" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\safer\codeidentifiers\262144\Paths\{d2c34ab2-529a-46b2-b293-fc853fce72ea}" /v "ItemData" /t REG_EXPAND_SZ /d "%%HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ProgramFilesDir%%" /f
pause

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
