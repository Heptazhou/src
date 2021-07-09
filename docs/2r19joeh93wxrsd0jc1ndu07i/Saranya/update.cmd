@echo off
pause&cls
echo STAND BY
echo.
call :woff2 saranya-mono-sc-regular
call :woff2 saranya-mono-sc-regular-italic
call :woff2 saranya-mono-sc-bold
call :woff2 saranya-mono-sc-bold-italic
echo.
pause
goto :EOF

:woff2
echo %~1 . . .
cmd /c woff2_compress.js.cmd ttf\%~1.ttf %~1.woff2
copy %~1.woff2 %~1.woff2.bak 1>nul
goto :EOF
