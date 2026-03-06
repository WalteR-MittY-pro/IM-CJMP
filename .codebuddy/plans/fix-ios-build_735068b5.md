---
name: fix-ios-build
overview: 修复 telegram_cjmp 工程的 iOS 构建问题，确保 keels build ios 和 keels build apk 都能成功执行
todos:
  - id: fix-ios-build-script
    content: 修复 build.sh，跳过 iOS 构建时的 update_toml.py 调用
    status: completed
  - id: fix-cjpm-toml
    content: 手动修复 cjpm.toml，添加正确的 package-configuration 配置
    status: completed
    dependencies:
      - fix-ios-build-script
  - id: verify-android-build
    content: 验证 Android 构建成功
    status: completed
  - id: verify-ios-build
    content: 尝试 iOS 构建并诊断崩溃问题
    status: completed
    dependencies:
      - fix-cjpm-toml
---

## 用户需求

修复 telegram_cjmp 工程中的 iOS 构建问题，确保 `keels build ios` 和 `keels build apk`（即 `./build.sh debug ios` 和 `./build.sh debug android`）执行成功。

## 问题分析

1. **Android 构建**：之前已成功，问题已解决
2. **iOS 构建失败原因**：

- `build.sh` 第 83-85 行对 iOS 构建调用了 `update_toml.py` 脚本
- 该脚本扫描 lib 目录下的子文件夹，并为每个子文件夹创建 `[package.package-configuration.xxx]` 配置
- 脚本错误地创建了不存在的包配置（如 `ohos_app_cangjie_entry.target`），导致 CJPM 编译失败
- 另外，cjpm 本身存在底层崩溃问题（RSA 密钥生成时的 SIGABRT 信号）

## 当前状态

- Android 构建：已成功生成 APK
- iOS 构建：CJPM 工具链崩溃（SIGABRT），需要进一步调试

## 技术方案

### 1. 问题定位

- **iOS 构建崩溃原因**：CJPM 工具链在初始化 RSA 密钥时发生原生库崩溃（`stdx.crypto.keys.generateRSA`），这是 cangjie-ios 运行时库与 macOS 环境的兼容性问题
- **配置文件问题**：`update_toml.py` 添加的配置会导致 CJPM 查找不存在的包

### 2. 解决方案

1. 跳过 iOS 构建时的 `update_toml.py` 脚本调用
2. 手动在 cjpm.toml 中添加正确的 package-configuration 配置
3. 验证 Android 构建
4. 尝试使用 iOS Simulator 构建（可能绕过真机构建的某些问题）

### 3. 关键文件

- `/Users/dzy/Desktop/project/TelegramTest/telegram_cjmp/build.sh` - 构建脚本
- `/Users/dzy/Desktop/project/TelegramTest/telegram_cjmp/lib/cjpm.toml` - CJPM 配置文件