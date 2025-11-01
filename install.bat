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

echo [2/4] Select installation method:
echo.
echo    1) Via File Manager (Local)
echo    2) Via ADB (Android Device)
echo    3) Exit
echo.
set /p method_choice="Choose method (1-3): "

if "%method_choice%"=="3" exit /b 0

if "%method_choice%"=="1" goto :local_install
if "%method_choice%"=="2" goto :adb_install

echo [ERROR] Invalid choice!
pause
exit /b 1

:local_install
echo.
echo [2/4] Select installation path:
echo.
echo    1) Default Android path: Android\data\com.activision.callofduty.shooter\files\
echo    2) Custom path
echo    3) Exit
echo.
set /p path_choice="Choose (1-3): "

if "%path_choice%"=="3" exit /b 0

if "%path_choice%"=="1" (
    set "TARGET_PATH=Android\data\com.activision.callofduty.shooter\files"
    goto :install_files
)

if "%path_choice%"=="2" (
    set /p "TARGET_PATH=Enter full path: "
    goto :install_files
)

echo [ERROR] Invalid choice!
pause
exit /b 1

:install_files
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
goto :success

:adb_install
echo.
echo [2/4] Checking ADB connection...
where adb >nul 2>&1
if errorlevel 1 (
    echo [ERROR] ADB not found in PATH!
    echo Please install Android SDK Platform Tools or add ADB to PATH
    pause
    exit /b 1
)
echo [OK] ADB found

echo.
echo Connecting to device...
adb devices >nul 2>&1
adb wait-for-device >nul 2>&1
if errorlevel 1 (
    echo [ERROR] No Android device connected!
    echo Please connect your device via USB and enable USB Debugging
    pause
    exit /b 1
)
echo [OK] Device connected

echo.
echo [3/4] Pushing files to device...
echo.

echo Location 1: Root Directory
adb shell "mkdir -p /storage/emulated/0/Android/data/com.activision.callofduty.shooter/files" 2>nul

adb push "Config\graphics_settings.cfg" /storage/emulated/0/Android/data/com.activision.callofduty.shooter/files/ 2>nul
if errorlevel 1 (
    echo [WARNING] Failed to push graphics_settings.cfg to root (may need root access)
) else (
    echo [OK] graphics_settings.cfg pushed (Root)
)

adb push "Config\hyper_performance.cfg" /storage/emulated/0/Android/data/com.activision.callofduty.shooter/files/ 2>nul
if errorlevel 1 (
    echo [WARNING] Failed to push hyper_performance.cfg to root (may need root access)
) else (
    echo [OK] hyper_performance.cfg pushed (Root)
)

echo.
echo Location 2: Config Directory
adb shell "mkdir -p /storage/emulated/0/Android/data/com.activision.callofduty.shooter/files/Config" 2>nul

adb push "Config\graphics_settings.cfg" /storage/emulated/0/Android/data/com.activision.callofduty.shooter/files/Config/ 2>nul
if errorlevel 1 (
    echo [WARNING] Failed to push graphics_settings.cfg to Config (may need root access)
) else (
    echo [OK] graphics_settings.cfg pushed (Config)
)

adb push "Config\hyper_performance.cfg" /storage/emulated/0/Android/data/com.activision.callofduty.shooter/files/Config/ 2>nul
if errorlevel 1 (
    echo [WARNING] Failed to push hyper_performance.cfg to Config (may need root access)
) else (
    echo [OK] hyper_performance.cfg pushed (Config)
)

echo.
echo [INFO] If files were not pushed, you may need:
echo        - USB Debugging enabled on device
echo        - Root access on device
echo        - Or use File Manager method instead
echo.

echo [4/4] Installation complete!
goto :success

:success
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
if "%method_choice%"=="1" (
    echo Files copied to two locations:
    echo    1. %TARGET_PATH%\
    echo    2. %TARGET_PATH%\Config\
)
if "%method_choice%"=="2" (
    echo Files pushed to device:
    echo    /storage/emulated/0/Android/data/com.activision.callofduty.shooter/files/
    echo    /storage/emulated/0/Android/data/com.activision.callofduty.shooter/files/Config/
)
echo.
echo Created by: Nulltra Coder
echo Telegram: @im_nulltra
echo.
echo Please restart the game to apply changes!
echo.
pause
