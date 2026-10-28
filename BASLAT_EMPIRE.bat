@echo off
setlocal
cd /d "%~dp0"
if not exist ".env" (
  echo .env bulunamadi. Once KUR.bat calistir ve .env'yi doldur.
  pause
  exit /b 1
)
where py >nul 2>&1
if not errorlevel 1 (
  py -3 "empire\bot.py"
) else (
  python "empire\bot.py"
)
echo.
echo CSGOEmpire botu durdu. Yukaridaki mesajlari kontrol et.
pause
