---
name: devices_page_development
overview: 在telegram_cjmp工程中实现设置页面的"设备(Devices)"详情页，包括创建DevicesPage.cj组件文件和修改SettingsPage.cj添加导航
todos:
  - id: create-devices-page
    content: 创建 DevicesPage.cj 设备详情页组件，实现6.1-6.4完整UI布局
    status: completed
  - id: modify-settings-page
    content: 修改 SettingsPage.cj，添加设备项的 onClick 事件和 DevicesPage 组件引用
    status: completed
    dependencies:
      - create-devices-page
  - id: build-verification
    content: 运行 keels build apk 验证编译通过
    status: completed
    dependencies:
      - modify-settings-page
---

## 用户 Requirements

在 telegram_cjmp 工程目录中，按照 cjmp 项目工程规则和正确的仓颉语法，按照 DEVELOPMENT_PLAN.md 继续进行设置页面新功能的六、设备 (Devices) 组件开发（6.1-6.4），编写成功后通过 keels build apk 保证编译通过。

## Core Features

1. **顶部导航栏**：返回按钮（左上角箭头图标+"返回"）+ 标题"设备"（居中）
2. **当前设备**：显示本设备信息，带绿色勾选标记，显示设备名称和浏览器信息
3. **已登录设备列表**：显示多个设备，每个设备显示名称、最后活跃时间、红色"终止"按钮
4. **链接设备入口**：扫描二维码登录，显示右箭头
5. **Telegram X开关**：实验性功能 Toggle 开关
6. **组件规范**：

- 当前设备：绿色勾选标记
- 终止按钮：红色文字，右侧显示
- 设备项高度：64dp
- 分组标题：14dp，#999999
- 列表项高度：56dp
- 分割线：1dp，#EEEEEE

## Tech Stack

- 仓颉语言 CJMP
- 仓颉UI组件库（ohos.component）
- 状态管理（ohos.state_manage）
- 项目目录: /Users/dzy/Desktop/project/TelegramTest/telegram_cjmp/lib/pages/

## Implementation Approach

采用与现有详情页（ChatSettingsPage.cj）相同的架构模式：

- 使用 @Component 装饰器定义页面组件
- 使用 @State 管理设备数据状态
- 使用 List 组件实现分组列表
- 遵循现有的代码风格和命名规范

## Implementation Details

### 数据结构

```
// 设备数据模型
public class DeviceInfo {
    public var name: String       // 设备名称
    public var description: String  // 设备描述（如浏览器版本）
    public var lastActive: String  // 最后活跃时间
    public var isCurrentDevice: Bool  // 是否为当前设备
    public init(name, description, lastActive, isCurrentDevice)
}

// 设备设置数据
public class DevicesSettings {
    public var currentDevice: DeviceInfo
    public var devices: ArrayList<DeviceInfo>
    public var telegramXEnabled: Bool
    public init(currentDevice, devices, telegramXEnabled)
}
```

### 布局结构

- 导航栏：48dp高度，白色背景
- Scroll 包裹内容区域
- 分组标题样式：14dp，灰色(#999999)
- 设备列表项：64dp高度
- 功能列表项：56dp高度

## Directory Structure

```
telegram_cjmp/lib/pages/
├── DevicesPage.cj        # [NEW] 设备详情页
└── SettingsPage.cj      # [MODIFY] 添加设备项点击事件和DevicesPage组件
```