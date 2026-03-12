@echo off
chcp 65001 >nul
title VisionBot — بناء EXE

echo.
echo  ╔══════════════════════════════════════════════╗
echo  ║    🔨 VisionBot — بناء ملف EXE              ║
echo  ╚══════════════════════════════════════════════╝
echo.

pip install pyinstaller pyautogui pillow anthropic openai google-generativeai -q

if exist build  rmdir /s /q build
if exist dist   rmdir /s /q dist
if exist VisionBot.spec del /q VisionBot.spec

echo  🔨 جاري البناء...

pyinstaller ^
    --onefile ^
    --windowed ^
    --name "VisionBot" ^
    --hidden-import "PIL._tkinter_finder" ^
    --hidden-import "anthropic" ^
    --hidden-import "openai" ^
    --collect-all "anthropic" ^
    vision_bot.py

if errorlevel 1 ( echo ❌ فشل البناء & pause & exit /b 1 )

mkdir dist\vision_logs 2>nul

echo.
echo  ✅ الملف الناتج: dist\VisionBot.exe
explorer dist
pause
