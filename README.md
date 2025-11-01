# 🎮 Call of Duty Mobile Configuration Pack

## 👨‍💻 Creator

**Nulltra Coder**  
📱 Telegram: [@im_nulltra](https://t.me/im_nulltra)

---

## High-Performance Gaming Config for CODM Android

This configuration pack is designed to optimize Call of Duty: Mobile for maximum FPS, reduced lag, and enhanced gameplay experience on Android devices.

---

## ✨ Features

### 🎯 **Fast Aim**
- High sensitivity settings for instant response
- Optimized ADS (Aim Down Sights) settings
- Enhanced Gyro controls
- Smooth tracking

### 🔒 **Aim Lock**
- Strong aim assist
- Auto snap to targets
- Weapon stabilization during fire
- Smooth targeting

### ⚡ **Fast Switch**
- Zero-delay weapon switching
- Quick reload cancel
- Slide cancel enabled
- Advanced combo techniques

### 🎯 **Auto Headshot**
- Head priority targeting
- Optimized crosshair
- Lock-on head targeting
- Improved accuracy

### 🏃 **Fast Movement**
- Increased movement speed
- Professional sprint settings
- Bunny hop enabled
- Slide and jump optimizations
- Advanced movement techniques

### 👁️ **Bold Track**
- Thick enemy outline
- Red color for high visibility
- Through-wall tracking
- Enemy health bar display
- Enhanced ESP features

### 🚀 **Performance Optimization**
- 60-120 FPS support
- Reduced lag and latency
- Network optimization
- Optimized battery usage
- Smooth gameplay

---

## 📂 File Structure

```
.
├── Config/
│   ├── graphics_settings.cfg      # Main graphics and performance settings
│   └── hyper_performance.cfg      # Advanced ultra-performance settings
├── README.md                       # English documentation
├── README_PERSIAN.md               # Persian documentation
├── install.bat                     # Windows batch installer
└── install.ps1                     # PowerShell installer (advanced)
```

---

## 🔧 Installation Guide

### Method 1: Manual Installation

1. **Copy Configuration Files**
   - Copy the `Config` folder

2. **Locate Game Directory**
   ```
   Android/data/com.activision.callofduty.shooter/files/
   ```

3. **Paste Configuration Files**
   
   **⚠️ Important:** Files must be copied to **TWO locations:**
   
   **Location 1 - Root:**
   ```
   Android/data/com.activision.callofduty.shooter/files/
   ```
   
   **Location 2 - Config Folder:**
   ```
   Android/data/com.activision.callofduty.shooter/files/Config/
   ```
   
   - Copy the contents of the `Config` folder to both locations above

4. **Set Permissions**
   - Allow File Manager to edit system files

### Method 2: Using Installer Scripts (Recommended)

**For easy and automatic installation, use the installer scripts:**

- **install.bat** - Windows Batch installer
- **install.ps1** - PowerShell installer (advanced)

These scripts automatically copy files to both required locations!

#### Windows Batch (install.bat)
```bash
# Double-click install.bat
# Follow the on-screen instructions
```

#### PowerShell (install.ps1)
```powershell
# Open PowerShell as Administrator
Set-ExecutionPolicy Bypass -Scope Process
.\install.ps1
```

### Method 3: Using ADB (Advanced Users)

```bash
# Connect Android device to computer
adb connect [YOUR_DEVICE_IP]

# Copy config files - Root location
adb push Config/graphics_settings.cfg /storage/emulated/0/Android/data/com.activision.callofduty.shooter/files/
adb push Config/hyper_performance.cfg /storage/emulated/0/Android/data/com.activision.callofduty.shooter/files/

# Copy config files - Config location
adb shell mkdir -p /storage/emulated/0/Android/data/com.activision.callofduty.shooter/files/Config
adb push Config/graphics_settings.cfg /storage/emulated/0/Android/data/com.activision.callofduty.shooter/files/Config/
adb push Config/hyper_performance.cfg /storage/emulated/0/Android/data/com.activision.callofduty.shooter/files/Config/
```

---

## ⚙️ Recommended In-Game Settings

### 📱 **In-Game Adjustments:**

1. **Graphics Settings**
   - Graphics Quality: **Low** (for max FPS)
   - Frame Rate: **Max** or **90/120 FPS**
   - Real-time Shadows: **Off**
   - Frame Rate Dropping: **Off**

2. **Control Settings**
   - Sensitivity: **Adjust according to config**
   - Tactical: **On** (for slide cancel)
   - Aim Down Sights: **Hold** (not Toggle)

3. **Audio Settings**
   - 3D Headphones: **On**
   - Footstep Volume: **Max**

---

## 🎮 Complementary Settings

### 1️⃣ **Android Settings:**

- **Developer Options > Force 4x MSAA:** Enabled
- **Developer Options > Disable HW Overlays:** Enabled
- **Battery Saver:** Off during gaming
- **Dark Mode:** For battery saving

### 2️⃣ **Game Booster Apps (Optional):**

- Game Booster
- Razer Cortex
- Gaming Focus Mode
- Performance Mode

### 3️⃣ **Device Requirements:**

- **RAM:** At least 3GB free
- **Storage:** Enough space for cache
- **Battery:** Above 20%
- **Background Apps:** Close unnecessary apps

---

## ⚠️ Warnings & Important Notes

### ⚠️ **Risks:**

- ❌ Using advanced features may result in a ban
- ✅ It's recommended to test with safe settings first
- ⚠️ ESP and Aimbot settings are high-risk

### 💡 **Tips:**

- 🔄 Re-install config after each game update
- 💾 Keep backup of original files
- 📊 Monitor your FPS
- 🌡️ Prevent device overheating

---

## 📊 Performance Comparison

| Settings | FPS Before | FPS After | Lag | Battery |
|----------|------------|-----------|-----|---------|
| Default | 30-40 | - | High | Medium |
| With Config | - | 60-90 | Low | Optimized |
| Hyper Mode | - | 90-120 | Very Low | Good |

---

## 🆘 Troubleshooting

### Issue: Config not working
✅ Check File Manager permissions
✅ Verify file paths (both locations)
✅ Restart the game

### Issue: Increased lag
✅ Disable Hyper settings
✅ Lower graphics quality
✅ Close background apps

### Issue: Got banned
⚠️ Use safe settings
⚠️ Disable ESP and Aimbot
⚠️ Don't use advanced features

---

## 📝 Configuration Files Details

### 📄 **graphics_settings.cfg**
✅ Main graphics settings  
✅ Fast Aim & Aim Lock  
✅ Fast Movement & Fast Switch  
✅ Bold Track & Auto Headshot  
✅ Network optimization  

### 📄 **hyper_performance.cfg**  
✅ Advanced performance settings  
✅ ESP & Visual Aids  
✅ Recoil Control  
✅ Advanced Aim Assist  
✅ Network Optimization  
✅ Audio Enhancement  

---

## 📞 Support

If you have questions or issues:
- ✅ Review settings again
- ✅ Check the Persian README
- ✅ Contact the creator

**👨‍💻 Nulltra Coder**  
📱 [@im_nulltra](https://t.me/im_nulltra)

---

## 📝 Versions

**Version:** 1.0  
**Last Update:** 2024  
**Compatible with:** Call of Duty: Mobile (Android)  
**Languages:** English & Persian

---

## 🔐 License

This configuration is for personal use only. Use at your own risk.

---

## 🙏 Thanks

Thank you for using this config! If it's helpful, share it with your friends.

**Made with ❤️ by Nulltra Coder**  
📱 [@im_nulltra](https://t.me/im_nulltra)

**Good luck and Game On! 🎮🔥**

