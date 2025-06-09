# crxIntel - Reverse Engineering for Chrome Browser Extensions
![image](https://github.com/user-attachments/assets/90b43fb5-6b22-4211-b1f8-652f7f30ce66)

Currently, crxIntel will:
  - Download .crx extension files
  - Extract all files from .crx files
  - Parse URLs from extracted files
  - Write URLs to log file

### Setup
```
git clone https://github.com/ndr-repo/crxIntel.git
cd crxIntel
powershell -noexit -ExecutionPolicy Bypass -File Setup.ps1 
```

### Dependancies

- 7-Zip CLI (Windows) - [Download](https://github.com/ip7z/7zip/releases/download/24.09/7z2409-x64.exe)
- GnuWin32 - [Installer - grep,sed,gawk](https://github.com/ndr-repo/gnuwin32_Scan-Download/releases/download/v1.0.0/gnuwin32_Scan_Download.exe)

### Usage
```
powershell -noexit -ExecutionPolicy Bypass -File crxIntel.ps1 <chrome-extension-id>
```
### Screenshots - Usage
![image](https://github.com/user-attachments/assets/f9c95934-e9a2-4730-bba6-60d73dc156bd)

### Screenshots - Setup
![crxIntelSetup](https://github.com/user-attachments/assets/507cf51f-2770-47ea-8b78-a3468b21f8fb)

