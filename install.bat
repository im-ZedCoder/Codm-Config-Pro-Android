@echo off
chcp 65001 >nul
cls
color 0A

echo.
echo ╔═══════════════════════════════════════════════════════════════╗
echo ║      🎮 نصب کننده کانفیگ کالاف دیوتی موبایل                 ║
echo ║      Call of Duty Mobile Config Installer                     ║
echo ║                                                               ║
echo ║      Created by: Nulltra Coder                                ║
echo ║      Telegram: @im_nulltra                                    ║
echo ╚═══════════════════════════════════════════════════════════════╝
echo.

echo [1/4] بررسی فایل‌های کانفیگ...
if not exist "Config\graphics_settings.cfg" (
    echo ❌ فایل graphics_settings.cfg پیدا نشد!
    pause
    exit /b 1
)
if not exist "Config\hyper_performance.cfg" (
    echo ❌ فایل hyper_performance.cfg پیدا نشد!
    pause
    exit /b 1
)
echo ✅ همه فایل‌ها پیدا شدند
echo.

echo [2/4] مسیر نصب را انتخاب کنید:
echo.
echo    1) مسیر پیش‌فرض اندروید: Android\data\com.activision.callofduty.shooter\files\
echo    2) مسیر دستی
echo    3) خروج
echo.
set /p choice="انتخاب کنید (1-3): "

if "%choice%"=="3" exit /b 0

if "%choice%"=="1" (
    set "TARGET_PATH=Android\data\com.activision.callofduty.shooter\files"
    goto :install
)

if "%choice%"=="2" (
    set /p "TARGET_PATH=مسیر کامل را وارد کنید: "
    goto :install
)

echo ❌ انتخاب نامعتبر!
pause
exit /b 1

:install
echo.
echo [3/4] در حال کپی فایل‌ها...
if not exist "%TARGET_PATH%" (
    mkdir "%TARGET_PATH%"
    echo ✅ پوشه نصب ایجاد شد
)

copy /Y "Config\graphics_settings.cfg" "%TARGET_PATH%\"
if errorlevel 1 (
    echo ❌ خطا در کپی graphics_settings.cfg
    pause
    exit /b 1
)
echo ✅ graphics_settings.cfg کپی شد

copy /Y "Config\hyper_performance.cfg" "%TARGET_PATH%\"
if errorlevel 1 (
    echo ❌ خطا در کپی hyper_performance.cfg
    pause
    exit /b 1
)
echo ✅ hyper_performance.cfg کپی شد
echo.

echo [4/4] نصب کامل شد!
echo.
echo ╔═══════════════════════════════════════════════════════════════╗
echo ║                    ✅ نصب موفقیت‌آمیز بود                     ║
echo ╚═══════════════════════════════════════════════════════════════╝
echo.
echo 📝 نکات مهم:
echo    • بازی را Restart کنید
echo    • تنظیمات را در منوی بازی بررسی کنید
echo    • از فایل README_PERSIAN.md راهنمایی بگیرید
echo.
echo 👨‍💻 ساخته شده توسط Nulltra Coder
echo 📱 Telegram: @im_nulltra
echo.
echo لطفاً بازی را Restart کنید تا تغییرات اعمال شوند!
echo.
pause

