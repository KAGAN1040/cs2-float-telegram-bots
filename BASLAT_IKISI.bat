@echo off
cd /d "%~dp0"
if not exist ".env" (
  echo .env bulunamadi. Once KUR.bat calistir ve .env'yi doldur.
  pause
  exit /b 1
)
start "CSGOEmpire Float Bot" "%~dp0BASLAT_EMPIRE.bat"
start "BynoGame Float Bot" "%~dp0BASLAT_BYNOGAME.bat"
