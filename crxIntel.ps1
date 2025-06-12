$crxId = $args[0]
$crxUri = 'https://clients2.google.com/service/update2/crx?response=redirect&prodversion=137&x=id%3D'+$crxId+'%26installsource%3Dondemand%26uc&acceptformat=crx2,crx3' 
$crxFileName = $crxId+'.crx'
$7zCli = "& 'C:\Program Files\7-Zip\7z.exe'"
Get-Content "amcLogo.txt" | Write-Host -ForegroundColor Red
Write-Host -ForegroundColor Red "`ncrxIntel: Reverse Engineering for Browser Extensions - Google Chrome`n`nTarget Extension ID:"$crxId"`n`nCreated by Gabriel H. @weekndr_sec`nhttps://github.com/ndr-repo | http://weekndr.me`n"
New-Item -ItemType Directory $crxId -Force
Set-Location $crxId 
New-Item -ItemType File $crxId"-urls.txt" -Force -InformationAction SilentlyContinue
New-Item -ItemType File $crxId"-filetypes.txt" -Force
(Invoke-WebRequest -Uri $crxUri -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36" -OutFile $crxFileName -Method Get -ErrorAction Ignore).Content
Invoke-Expression "$7zCli l $crxFileName"
Invoke-Expression "$7zCli x $crxFileName -bd"
Write-Host -ForegroundColor Red "`n[+] Extracting filetypes from"$crxId"..." 
Write-Host -ForegroundColor Red "`nExtracted Filetypes - $crxId"
Write-Host -ForegroundColor Red "---------------------------------------------------------------------------------------------------------------------------------------------------------------------`n"
Get-ChildItem -Recurse | Get-ItemProperty | Sort-Object -Property Extension -Unique | Format-Table -Property Extension -Wrap -AutoSize -HideTableHeaders | Out-String -Stream | grep '[a-zA-Z0-9]' | Out-String -Stream | Tee-Object $crxId"-filetypes.txt"
Write-Host -ForegroundColor Red "---------------------------------------------------------------------------------------------------------------------------------------------------------------------`n"
Write-Host -ForegroundColor Red "[+] Results saved to"$crxId"-filetypes.txt"
# Write-Host -ForegroundColor Red "Create HTML results? (This will open the browser)`n" -InformationAction Inquire
# Write-Host -ForegroundColor Red "Creating results page...`n"
# Get-ChildItem -File -Recurse | Get-ItemProperty | Sort-Object -Property Extension | Format-Table -GroupBy Extension -Property FullName,Extension -Wrap -AutoSize -HideTableHeaders | Out-String -Stream | ConvertFrom-String | ConvertTo-Html -Title "crxIntel - Extracted Files -"$crxId -Head "crxIntel - Extracted Files -"$crxId | Out-File $crxId"_Files.html" -Encoding utf8 
Write-Host -ForegroundColor Red "`nExtracted Files - $crxId"
Write-Host -ForegroundColor Red "---------------------------------------------------------------------------------------------------------------------------------------------------------------------`n"
Get-ChildItem -File -Recurse | Get-ItemProperty | Sort-Object -Property Extension | Format-Table -GroupBy Extension -Property FullName,Extension -Wrap -AutoSize | Out-String -Stream 
Write-Host -ForegroundColor Red "---------------------------------------------------------------------------------------------------------------------------------------------------------------------`n"
# Get-ChildItem -File -Recurse | Get-ItemProperty | Sort-Object -Property Extension | Format-Table -Property FullName,Extension -Wrap -AutoSize | Out-String -Stream | Out-GridView -Title "crxIntel - $crxId"
# Write-Host -ForegroundColor Red "`nCompleted!`n" 
Write-Host -ForegroundColor Red "`n"
Write-Host -ForegroundColor Red "`n[+] Extracting URLs from"$crxId"..." 
Write-Host -ForegroundColor Red "`nExtracted URLs - $crxId"
Write-Host -ForegroundColor Red "`---------------------------------------------------------------------------------------------------------------------------------------------------------------------`n"
Get-ChildItem -Recurse | Where-Object -Property Extension -EQ ".js" | Get-Content -Encoding utf8 -ErrorAction SilentlyContinue | Out-String -Stream | js-beautify.exe -x -i | grep -oP 'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)' | Sort-Object -Unique | Out-String -Stream | Tee-object -Append $crxId"-urls.txt"
Get-ChildItem -Recurse | Where-Object -Property Extension -EQ ".json" | Get-Content -Encoding utf8 -ErrorAction SilentlyContinue | Out-String -Stream | js-beautify.exe -x -i | grep -oP 'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)' | Sort-Object -Unique | Out-String -Stream | Tee-object -Append $crxId"-urls.txt"
Get-ChildItem -Recurse | Where-Object -Property Extension -EQ ".svg" | Get-Content -Encoding utf8 -ErrorAction SilentlyContinue | Out-String -Stream | grep -oP 'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)' | Sort-Object -Unique | Out-String -Stream | Tee-object -Append $crxId"-urls.txt"
Get-ChildItem -Recurse | Where-Object -Property Extension -EQ ".css" | Get-Content -Encoding utf8 -ErrorAction SilentlyContinue | Out-String -Stream | grep -oP 'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)' | Sort-Object -Unique | Out-String -Stream | Tee-object -Append $crxId"-urls.txt"
Get-ChildItem -Recurse | Where-Object -Property Extension -EQ ".html" | Get-Content -Encoding utf8  -ErrorAction SilentlyContinue | Out-String -Stream | grep -oP 'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)' | Sort-Object -Unique | Out-String -Stream | Tee-object -Append $crxId"-urls.txt"
Write-Host -ForegroundColor Red "---------------------------------------------------------------------------------------------------------------------------------------------------------------------`n"
Write-Host -ForegroundColor Red "[+] Results saved to"$crxId"-urls.txt`n"
# Get-Content $crxId"-urls.txt" | Out-GridView
