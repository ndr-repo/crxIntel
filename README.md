# crxIntel
Reverse Engineering for Chrome Browser Extensions

Currently, crxIntel will:
  - Download .crx extension files
  - Extract all files from .crx files
  - Parse URLs from extracted files

### Setup
```
git clone https://github.com/ndr-repo/crxIntel.git
```

### Dependancies

- 7-Zip CLI (Windows) - [Download](https://github.com/ip7z/7zip/releases/download/24.09/7z2409-x64.exe)
- GnuWin32 - [Installer - grep,sed,gawk](https://github.com/ndr-repo/gnuwin32_Scan-Download/releases/download/v1.0.0/gnuwin32_Scan_Download.exe)

### Usage
```
powershell -noexit -ExecutionPolicy Bypass -File crxIntel.ps1 <chrome-extension-id>
```
### Screenshots
![image](https://github.com/user-attachments/assets/f9c95934-e9a2-4730-bba6-60d73dc156bd)
