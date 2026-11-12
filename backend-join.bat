@echo off
rem ============================================================
rem  Join backend.zip.001 ~ .013 into backend.zip and verify it
rem  (Windows built-in commands only - works offline)
rem ============================================================
cd /d "%~dp0"
if exist backend.zip del backend.zip
echo Joining parts...
copy /b backend.zip.001+backend.zip.002+backend.zip.003+backend.zip.004+backend.zip.005+backend.zip.006+backend.zip.007+backend.zip.008+backend.zip.009+backend.zip.010+backend.zip.011+backend.zip.012+backend.zip.013 backend.zip >nul
if errorlevel 1 (echo [X] join failed - check that all 13 parts are here & pause & exit /b 1)
echo Verifying SHA-256...
certutil -hashfile backend.zip SHA256 | findstr /i /c:"f510c1cae8314ab6580373b7d4a99733634cf215d9f9cec0153816cb1d9f48c6" >nul
if errorlevel 1 (echo [X] HASH MISMATCH - a part is missing or corrupted. Download again. & pause & exit /b 1)
echo.
echo [OK] backend.zip is ready and verified.
echo      Extract backend.zip and frontend.zip into C:\workspace\react\mall
pause
