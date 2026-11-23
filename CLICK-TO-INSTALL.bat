@echo off
title Vibe Coding Skills Installer (OpenCode & Antigravity)
echo ============================================================
echo   Vibe Coding Skills Installer (OpenCode ^& Antigravity)
echo ============================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0install-skills.ps1"
echo.
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Instalasi gagal dengan kode %ERRORLEVEL%.
) else (
    echo [OK] Instalasi selesai! Restart OpenCode / Antigravity.
)
echo.
pause
