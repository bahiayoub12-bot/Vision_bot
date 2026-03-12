@echo off
chcp 65001 >nul
title VisionBot — وكيل الذكاء الاصطناعي

echo.
echo  ╔══════════════════════════════════════════════════╗
echo  ║   🤖 VisionBot — وكيل ذكاء اصطناعي للشاشة      ║
echo  ╚══════════════════════════════════════════════════╝
echo.

python --version >nul 2>&1
if errorlevel 1 (
    echo  ❌ Python غير مثبت — https://python.org
    pause & exit /b 1
)

echo  📦 تثبيت المكتبات...
pip install pyautogui pillow anthropic -q

echo  ✅ تشغيل VisionBot...
python vision_bot.py
if errorlevel 1 ( echo. & echo  ❌ خطأ — راجع vision_logs & pause )
