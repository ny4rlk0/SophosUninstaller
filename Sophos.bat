TITLE NYA SOPHOS REMOVER TOOL
color a
@echo off
cls
if _%1_==_payload_  goto :payload

:getadmin
    echo %~nx0: Getting Administrator permissions from operating system.
    set vbs=%temp%\getadmin.vbs
    echo Set UAC = CreateObject^("Shell.Application"^)                >> "%vbs%"
    echo UAC.ShellExecute "%~s0", "payload %~sdp0 %*", "", "runas", 1 >> "%vbs%"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
goto :eof

:payload

::TheMagic::
net stop "Sophos Anti-Virus"
net stop "Sophos AutoUpdate Service"
REG QUERY HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall /s /f SOPHOS > C:\Sophos_Uninstall_Strings32.txt
REG QUERY HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall /s /f SOPHOS > C:\Sophos_Uninstall_Strings64.txt
MsiExec.exe /X{FED1005D-CBC8-45D5-A288-FFC7BB304121} /qn REBOOT=SUPPRESS
MsiExec.exe /X{604350BF-BE9A-4F79-B0EB-B1C22D889E2D} /qn REBOOT=SUPPRESS
"C:\Program Files\Sophos\Endpoint Defense\uninstall.exe" /quiet
MsiExec.exe /X{01423865-551B-4C59-B44A-CC604BC21AF3} /qn REBOOT=SUPPRESS
MsiExec.exe /X{AFBCA1B9-496C-4AE6-98AE-3EA1CFF65C54} /qn REBOOT=SUPPRESS
"C:\program files\Sophos\Sophos Endpoint Agent\uninstallcli.exe"
MsiExec.exe /qn /X{7CD26A0C-9B59-4E84-B5EE-B386B2F7AA16} REBOOT=ReallySuppress
MsiExec.exe /qn /X{BCF53039-A7FC-4C79-A3E3-437AE28FD918} REBOOT=ReallySuppress
MsiExec.exe /qn /X{9D1B8594-5DD2-4CDC-A5BD-98E7E9D75520} REBOOT=ReallySuppress
MsiExec.exe /qn /X{AFBCA1B9-496C-4AE6-98AE-3EA1CFF65C54} REBOOT=ReallySuppress
MsiExec.exe /qn /X{E82DD0A8-0E5C-4D72-8DDE-41BB0FC06B3E} REBOOT=ReallySuppress
MsiExec.exe /qn /X{8123193C-9000-4EEB-B28A-E74E779759FA} REBOOT=ReallySuppress
MsiExec.exe /qn /X{36333618-1CE1-4EF2-8FFD-7F17394891CE} REBOOT=ReallySuppress
MsiExec.exe /qn /X{DFDA2077-95D0-4C5F-ACE7-41DA16639255} REBOOT=ReallySuppress
MsiExec.exe /qn /X{CA3CE456-B2D9-4812-8C69-17D6980432EF} REBOOT=ReallySuppress
MsiExec.exe /qn /X{3B998572-90A5-4D61-9022-00B288DD755D} REBOOT=ReallySuppress
MsiExec.exe /qn /X{72E30858-FC95-4C87-A697-670081EBF065} REBOOT=ReallySuppress
MsiExec.exe /qn /X{934BEF80-B9D1-4A86-8B42-D8A6716A8D27} REBOOT=ReallySuppress
MsiExec.exe /qn /X{1093B57D-A613-47F3-90CF-0FD5C5DCFFE6} REBOOT=ReallySuppress
MsiExec.exe /qn /X{66967E5F-43E8-4402-87A4-04685EE5C2CB} REBOOT=ReallySuppress
MsiExec.exe /qn /X{A5CCEEF1-B6A7-4EB4-A826-267996A62A9E} REBOOT=ReallySuppress
MsiExec.exe /qn /X{D5BC54B8-1DA1-44F4-AE6F-86E05CDB0B44} REBOOT=ReallySuppress
MsiExec.exe /qn /X{E44AF5E6-7D11-4BDF-BEA8-AA7AE5FE6745} REBOOT=ReallySuppress
MsiExec.exe /qn /X{4627F5A1-E85A-4394-9DB3-875DF83AF6C2} REBOOT=ReallySuppress
MsiExec.exe /qn /X{DFFA9361-3625-4219-82C2-9EF011E433B1} REBOOT=ReallySuppress
MsiExec.exe /qn /X{A1DC5EF8-DD20-45E8-ABBD-F529A24D477B} REBOOT=ReallySuppress
MsiExec.exe /qn /X{1FFD3F20-5D24-4C9A-B9F6-A207A53CF179} REBOOT=ReallySuppress
MsiExec.exe /qn /X{D875F30C-B469-4998-9A08-FE145DD5DC1A} REBOOT=ReallySuppress
MsiExec.exe /qn /X{2C14E1A2-C4EB-466E-8374-81286D723D3A} REBOOT=ReallySuppress
MsiExec.exe /qn /X{FED1005D-CBC8-45D5-A288-FFC7BB304121} REBOOT=ReallySuppress
MsiExec.exe /qn /X{D29542AE-287C-42E4-AB28-3858E13C1A3E} REBOOT=ReallySuppress
"C:\Program Files\Sophos\Clean\uninstall.exe"
"C:\Program Files\Sophos\Endpoint Defense\uninstall.exe" /quiet
"C:\Program Files (x86)\HitmanPro.Alert\hmpalert.exe" /uninstall /quiet
"C:\Program Files (x86)\HitmanPro.Alert\uninstall.exe" /uninstall /quiet
"C:\Program Files\HitmanPro\HitmanPro.exe" /uninstall /quiet
cls
echo "Sophos yazılımı bilgisayarınızdan kaldırılmış olması lazım. Sistem Yeniden başlatılıyor... (30 saniye)"
shutdown -r -t 30
pause
::EndofTheMagic::