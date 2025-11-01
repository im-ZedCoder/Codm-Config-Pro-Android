# Call of Duty Mobile Config Installer
# PowerShell Script for Windows
# Created by: Nulltra Coder
# Telegram: @im_nulltra

$ErrorActionPreference = "Stop"

# Set console to UTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Colors
function Write-Header {
    Write-Host ""
    Write-Host "╔═══════════════════════════════════════════════════════════════╗" -ForegroundColor Green
    Write-Host "║      🎮 نصب کننده کانفیگ کالاف دیوتی موبایل                 ║" -ForegroundColor Green
    Write-Host "║      Call of Duty Mobile Config Installer                     ║" -ForegroundColor Green
    Write-Host "║                                                               ║" -ForegroundColor Green
    Write-Host "║      Created by: Nulltra Coder                                ║" -ForegroundColor Green
    Write-Host "║      Telegram: @im_nulltra                                    ║" -ForegroundColor Green
    Write-Host "╚═══════════════════════════════════════════════════════════════╝" -ForegroundColor Green
    Write-Host ""
}

# Header
Clear-Host
Write-Header

# Step 1: Check files
Write-Host "[1/4] بررسی فایل‌های کانفیگ..." -ForegroundColor Yellow
$configFiles = @(
    "Config\graphics_settings.cfg",
    "Config\hyper_performance.cfg"
)

foreach ($file in $configFiles) {
    if (-not (Test-Path $file)) {
        Write-Host "❌ فایل $file پیدا نشد!" -ForegroundColor Red
        Read-Host "Press Enter to exit"
        exit 1
    }
}
Write-Host "✅ همه فایل‌ها پیدا شدند" -ForegroundColor Green
Write-Host ""

# Step 2: Choose installation path
Write-Host "[2/4] مسیر نصب را انتخاب کنید:" -ForegroundColor Yellow
Write-Host ""
Write-Host "   1) مسیر پیش‌فرض اندروید (SD Card/Internal Storage)" -ForegroundColor Cyan
Write-Host "   2) مسیر دستی" -ForegroundColor Cyan
Write-Host "   3) خروج" -ForegroundColor Cyan
Write-Host ""

$choice = Read-Host "انتخاب کنید (1-3)"

$targetPath = ""

if ($choice -eq "1") {
    # Default path
    Write-Host ""
    Write-Host "لطفاً مسیر SD Card یا Internal Storage خود را وارد کنید:" -ForegroundColor Yellow
    Write-Host "مثال: E:\Android\data\com.activision.callofduty.shooter\files" -ForegroundColor Gray
    Write-Host "یا: C:\Android\data\com.activision.callofduty.shooter\files" -ForegroundColor Gray
    Write-Host ""
    $basePath = Read-Host "مسیر پایه (SD Card/Internal Storage)"
    
    if ([string]::IsNullOrWhiteSpace($basePath)) {
        Write-Host "❌ مسیر نمی‌تواند خالی باشد!" -ForegroundColor Red
        Read-Host "Press Enter to exit"
        exit 1
    }
    
    $targetPath = Join-Path $basePath "Android\data\com.activision.callofduty.shooter\files"
}
elseif ($choice -eq "2") {
    Write-Host ""
    $targetPath = Read-Host "مسیر کامل را وارد کنید"
    
    if ([string]::IsNullOrWhiteSpace($targetPath)) {
        Write-Host "❌ مسیر نمی‌تواند خالی باشد!" -ForegroundColor Red
        Read-Host "Press Enter to exit"
        exit 1
    }
}
elseif ($choice -eq "3") {
    exit 0
}
else {
    Write-Host "❌ انتخاب نامعتبر!" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

# Step 3: Copy files
Write-Host ""
Write-Host "[3/4] در حال کپی فایل‌ها..." -ForegroundColor Yellow
Write-Host ""

# Copy to Root Directory
Write-Host "📍 مسیر 1: Root Directory" -ForegroundColor Cyan
if (-not (Test-Path $targetPath)) {
    try {
        New-Item -ItemType Directory -Path $targetPath -Force | Out-Null
        Write-Host "✅ پوشه نصب ایجاد شد" -ForegroundColor Green
    }
    catch {
        Write-Host "❌ خطا در ایجاد پوشه: $_" -ForegroundColor Red
        Read-Host "Press Enter to exit"
        exit 1
    }
}

foreach ($file in $configFiles) {
    try {
        $fileName = Split-Path $file -Leaf
        Copy-Item -Path $file -Destination $targetPath -Force
        Write-Host "✅ $fileName کپی شد (Root)" -ForegroundColor Green
    }
    catch {
        Write-Host "❌ خطا در کپی $fileName به مسیر اصلی: $_" -ForegroundColor Red
        Read-Host "Press Enter to exit"
        exit 1
    }
}

# Copy to Config Directory
Write-Host ""
Write-Host "📍 مسیر 2: Config Directory" -ForegroundColor Cyan
$configDirPath = Join-Path $targetPath "Config"

if (-not (Test-Path $configDirPath)) {
    try {
        New-Item -ItemType Directory -Path $configDirPath -Force | Out-Null
        Write-Host "✅ پوشه Config ایجاد شد" -ForegroundColor Green
    }
    catch {
        Write-Host "❌ خطا در ایجاد پوشه Config: $_" -ForegroundColor Red
        Read-Host "Press Enter to exit"
        exit 1
    }
}

foreach ($file in $configFiles) {
    try {
        $fileName = Split-Path $file -Leaf
        Copy-Item -Path $file -Destination $configDirPath -Force
        Write-Host "✅ $fileName کپی شد (Config)" -ForegroundColor Green
    }
    catch {
        Write-Host "❌ خطا در کپی $fileName به مسیر Config: $_" -ForegroundColor Red
        Read-Host "Press Enter to exit"
        exit 1
    }
}
Write-Host ""

# Step 4: Success
Write-Host ""
Write-Host "[4/4] نصب کامل شد!" -ForegroundColor Green
Write-Host ""
Write-Host "╔═══════════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║                    ✅ نصب موفقیت‌آمیز بود                     ║" -ForegroundColor Green
Write-Host "╚═══════════════════════════════════════════════════════════════╝" -ForegroundColor Green
Write-Host ""
Write-Host "📝 نکات مهم:" -ForegroundColor Yellow
Write-Host "   • بازی را Restart کنید" -ForegroundColor White
Write-Host "   • تنظیمات را در منوی بازی بررسی کنید" -ForegroundColor White
Write-Host "   • از فایل README_PERSIAN.md راهنمایی بگیرید" -ForegroundColor White
Write-Host ""
Write-Host "📍 فایل‌ها در دو مسیر کپی شدند:" -ForegroundColor Cyan
Write-Host "   1. $targetPath" -ForegroundColor Gray
Write-Host "   2. $configDirPath" -ForegroundColor Gray
Write-Host ""
Write-Host "👨‍💻 ساخته شده توسط Nulltra Coder" -ForegroundColor Yellow
Write-Host "📱 Telegram: @im_nulltra" -ForegroundColor Yellow
Write-Host ""
Write-Host "لطفاً بازی را Restart کنید تا تغییرات اعمال شوند!" -ForegroundColor Green
Write-Host ""
Read-Host "Press Enter to exit"

