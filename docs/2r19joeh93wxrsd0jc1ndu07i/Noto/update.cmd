@echo off
pause&cls
echo STAND BY
cmd /c woff2_compress.js.cmd NotoSansCJKsc-Regular.otf NotoSansCJKsc-Regular.woff2
copy NotoSansCJKsc-Regular.woff2 NotoSansCJKsc-Regular.woff2.bak 1>nul
echo.
pause
