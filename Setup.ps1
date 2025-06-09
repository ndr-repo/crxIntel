Get-Content "amcLogo.txt"
Write-Host -ForegroundColor Red "`ncrxIntel: Reverse Engineering for Browser Extensions - Google Chrome - Setup Tools (Windows)`nCreated by Gabriel H. @weekndr_sec`nhttps://github.com/ndr-repo | http://weekndr.me`n"
Write-Host -ForegroundColor Red "`nInstalling jsbeautifier...`n"
Invoke-Expression "& python -m pip install jsbeautifier -I --progress-bar on"
Write-Host -ForegroundColor Red "`nInstalling GnuWin32 Dependancies...`n"
Invoke-Expression "cmd /C curl -L -X GET https://gnuwin32.sourceforge.net/downlinks/grep.php -o grep.exe"
.\grep.exe
