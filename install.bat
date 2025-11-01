@echo off
cls
color 0A

echo.
echo ================================================================
echo      Call of Duty Mobile Config Installer
echo      Created by: Nulltra Coder
echo      Telegram: @im_nulltra
echo ================================================================
echo.

echo [1/4] Checking configuration files...
if not exist "Config\graphics_settings.cfg" (
    echo [ERROR] graphics_settings.cfg not found!
    pause
    exit /b 1
)
if not exist "Config\hyper_performance.cfg" (
    echo [ERROR] hyper_performance.cfg not found!
    pause
    exit /b 1
)
echo [OK] All files found
echo.

echo [2/4] Select installation path:
echo.
echo    1) Default Android path: Android\data\com.activision.callofduty.shooter\files\
echo    2) Custom path
echo    3) Exit
echo.
set /p choice="Choose (1-3): "

if "%choice%"=="3" exit /b 0

if "%choice%"=="1" (
    set "TARGET_PATH=Android\data\com.activision.callofduty.shooter\files"
    goto :install
)

if "%choice%"=="2" (
    set /p "TARGET_PATH=Enter full path: "
    goto :install
)

echo [ERROR] Invalid choice!
pause
exit /b 1

:install
echo.
echo [3/4] Copying files...
echo.
echo Location 1: Root Directory
if not exist "%TARGET_PATH%" (
    mkdir "%TARGET_PATH%"
    echo [OK] Installation folder created
)

copy /Y "Config\graphics_settings.cfg" "%TARGET_PATH\" >nul
if errorlevel 1 (
    echo [ERROR] Failed to copy graphics_settings.cfg to root directory
    pause
    exit /b 1
)
echo [OK] graphics_settings.cfg copied (Root)

copy /Y "Config\hyper_performance.cfg" "%TARGET_PATH\" >nul
if errorlevel 1 (
    echo [ERROR] Failed to copy hyper_performance.cfg to root directory
    pause
    exit /b 1
)
echo [OK] hyper_performance.cfg copied (Root)

echo.
echo Location 2: Config Directory
set "CONFIG_PATH=%TARGET_PATH%\Config"
if not exist "%CONFIG_PATH%" (
    mkdir "%CONFIG_PATH%"
    echo [OK] Config folder created
)

copy /Y "Config\graphics_settings.cfg" "%CONFIG_PATH\" >nul
if errorlevel 1 (
    echo [ERROR] Failed to copy graphics_settings.cfg to Config directory
    pause
    exit /b 1
)
echo [OK] graphics_settings.cfg copied (Config)

copy /Y "Config\hyper_performance.cfg" "%CONFIG_PATH\" >nul
if errorlevel 1 (
    echo [ERROR] Failed to copy hyper_performance.cfg to Config directory
    pause
    exit /b 1
)
echo [OK] hyper_performance.cfg copied (Config)
echo.

echo [4/4] Installation complete!
echo.
echo ================================================================
echo                  Installation Successful
echo ================================================================
echo.
echo Important notes:
echo    - Restart the game
echo    - Check settings in game menu
echo    - Read README_PERSIAN.md for details
echo.
echo Files copied to two locations:
echo    1. %TARGET_PATH%\
echo    2. %TARGET_PATH%\Config\
echo.
echo Created by: Nulltra Coder
echo Telegram: @im_nulltra
echo.
echo Please restart the game to apply changes!
echo.
pause
