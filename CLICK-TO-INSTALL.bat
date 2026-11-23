@echo off
chcp 65001 >nul
title Install Agents Skills (One-Click)

echo ==================================================
echo   One-Click Installer: Agents Skills + Symlinks
echo ==================================================
echo.

powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0install-skills.ps1"
set EXIT_CODE=%ERRORLEVEL%

echo.
if %EXIT_CODE% NEQ 0 (
    echo [GAGAL] Terjadi error saat instalasi (Exit Code: %EXIT_CODE%^).
) else (
    echo [SUKSES] Semua skill dan symlink berhasil dipasang!
)
echo.
pause
exit /b %EXIT_CODE%
