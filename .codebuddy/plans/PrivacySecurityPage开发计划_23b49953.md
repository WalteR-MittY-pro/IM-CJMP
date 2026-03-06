---
name: PrivacySecurityPage开发计划
overview: 在telegram_cjmp工程中开发隐私与安全页面(2.1-2.4组件)，包括顶部导航栏和功能列表
todos:
  - id: modify-settings-privacy-item
    content: 修改SettingsPage.cj，为"隐私与安全"ListItem添加onClick跳转事件
    status: completed
  - id: create-privacy-security-page
    content: 创建PrivacySecurityPage.cj，实现顶部导航栏和三个功能分组
    status: completed
    dependencies:
      - modify-settings-privacy-item
  - id: add-privacy-page-route
    content: 在SettingsPage.cj中添加PrivacySecurityPage路由引用
    status: completed
    dependencies:
      - create-privacy-security-page
  - id: build-verify
    content: 编译验证项目构建通过
    status: completed
    dependencies:
      - add-privacy-page-route
---

## 用户需求

按照DEVELOPMENT_PLAN.md，继续进行设置页面新功能"隐私与安全"(Privacy & Security)的组件开发，即2.1-2.4部分。

## 功能概述

创建隐私与安全详情页，包含顶部导航栏和安全、隐私设置、数据与账号三个功能分组：

1. 顶部导航栏：返回按钮 + 标题"隐私与安全"
2. 安全分组：

- 密码：启用两步验证（Toggle开关）
- 活跃设备：显示设备数量
- 黑名单：已封锁用户数量

3. 隐私设置分组：

- 最后上线时间：显示"所有人" >
- 头像可见性：显示"联系人" >
- 来电许可：显示"所有人" >
- 转发消息：显示"所有人" >

4. 数据设置分组：

- 自动删除：显示"关闭" >
- 已保存的付款方式：显示">"

## 交互说明

- 点击返回按钮返回设置页
- 点击列表项可进入对应子设置页面（预留）
- 密码项显示Toggle开关

## 技术栈

- 框架：Cangjie UI (cjmp)
- 语言：Cangjie
- 构建工具：keels

## 实现方案

### 架构设计

采用与ProfilePage.cj相同的组件化架构，使用Stack布局叠加主页面和详情页。

### 模块划分

- **SettingsPage.cj**: 修改现有"隐私与安全"ListItem，添加onClick跳转到隐私与安全详情页
- **PrivacySecurityPage.cj**: 新建隐私与安全详情页组件，实现顶部导航栏和三个功能分组列表

### 关键技术决策

1. 使用Column嵌套List实现分组布局
2. 使用Toggle组件实现两步验证开关
3. 使用与现有页面一致的样式规范（颜色、字体、间距）
4. 参考ProfilePage.cj的导航栏结构实现返回功能

### 数据结构

```
// 隐私设置数据模型
class PrivacySettings {
    var twoStepVerification: Bool      // 两步验证开关
    var activeDevices: Int64            // 活跃设备数量
    var blockedUsers: Int64            // 黑名单数量
    var lastSeenVisibility: String     // 最后上线时间可见性
    var avatarVisibility: String       // 头像可见性
    var callPermission: String         // 来电许可
    var forwardPermission: String      // 转发消息权限
    var autoDelete: String             // 自动删除
}
```

## 目录结构

```
telegram_cjmp/lib/pages/
├── SettingsPage.cj          [MODIFY] 添加"隐私与安全"点击跳转
└── PrivacySecurityPage.cj   [NEW] 隐私与安全详情页
```

## 实现细节

### SettingsPage.cj修改

- 在第121-140行的"隐私与安全"ListItem添加onClick事件
- 调用navigateToDetail(DETAIL_PRIVACY)方法

### PrivacySecurityPage.cj新建

- 顶部导航栏：48dp高度，白色背景，返回箭头+标题"隐私与安全"
- 安全分组标题"安全"，包含3个功能项
- 隐私设置分组标题"隐私设置"，包含4个功能项  
- 数据设置分组标题"数据与账号"，包含2个功能项
- 列表项高度56dp，分割线颜色0xEEEEEE
- 密码项显示Toggle开关组件