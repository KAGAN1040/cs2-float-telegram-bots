@echo off
setlocal
cd /d "%~dp0"
where py >nul 2>&1
if not errorlevel 1 (
  set "PY_CMD=py -3"
) else (
  set "PY_CMD=python"
)
%PY_CMD% --version >nul 2>&1
if errorlevel 1 (
  echo HATA: Python bulunamadi. Python 3.10+ kurup terminali yeniden ac.
  echo https://www.python.org/downloads/
  pause
  exit /b 1
)
if not exist ".env" (
  copy /y ".env.example" ".env" >nul
  echo .env dosyasi olusturuldu. KENDI bilgilerinle doldur.
)
echo Kutuphaneler yukleniyor...
%PY_CMD% -m pip install -r requirements.txt
if errorlevel 1 (
  echo HATA: Kutuphaneler kurulurken sorun olustu.
  pause
  exit /b 1
)
echo.
echo Kurulum tamam. Simdi .env dosyasini doldur ve botu baslat.
pause
