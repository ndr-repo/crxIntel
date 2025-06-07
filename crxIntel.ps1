$crxId = $args[0]
$crxUri = 'https://clients2.google.com/service/update2/crx?response=redirect&prodversion=137&x=id%3D'+$crxId+'%26installsource%3Dondemand%26uc&acceptformat=crx2,crx3' 
$crxFileName = $crxId+'.crx'
$7zCli = "& 'C:\Program Files\7-Zip\7z.exe'"
Write-Host -ForegroundColor Red "`ncrxIntel: Reverse Engineering for Browser Extensions - Google Chrome`n`nTarget Extension ID:"$crxId"`n`nCreated by Gabriel H. @weekndr_sec`nhttps://github.com/ndr-repo | http://weekndr.me`n"
New-Item -ItemType Directory $crxId -ErrorAction Ignore
Set-Location $crxId 
(Invoke-WebRequest -Uri $crxUri -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36" -OutFile $crxFileName -Method Get -ErrorAction Ignore).Content
Invoke-Expression "$7zCli l $crxFileName"
Invoke-Expression "$7zCli e $crxFileName -bd"
Write-Host -ForegroundColor Red "`nExtracting URLs from"$crxId"`n" 
Get-ChildItem -Recurse | Where-Object -Property Extension -EQ ".js" | Get-Content -Encoding utf8 | Out-String -Stream | grep -oP 'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)' | Sort-Object -Unique | Out-String -Stream
Get-ChildItem -Recurse | Where-Object -Property Extension -EQ ".json" | Get-Content -Encoding utf8 | Out-String -Stream | grep -oP 'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)' | Sort-Object -Unique | Out-String -Stream
Get-ChildItem -Recurse | Where-Object -Property Extension -EQ ".svg" | Get-Content -Encoding utf8 | Out-String -Stream | grep -oP 'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)' | Sort-Object -Unique | Out-String -Stream
Get-ChildItem -Recurse | Where-Object -Property Extension -EQ ".css" | Get-Content -Encoding utf8 | Out-String -Stream | grep -oP 'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)' | Sort-Object -Unique | Out-String -Stream
Get-ChildItem -Recurse | Where-Object -Property Extension -EQ ".html" | Get-Content -Encoding utf8 | Out-String -Stream | grep -oP 'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)' | Sort-Object -Unique | Out-String -Stream
Write-Host -ForegroundColor Red "`nCompleted!`n" 
