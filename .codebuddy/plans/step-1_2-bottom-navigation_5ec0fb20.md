---
name: step-1.2-bottom-navigation
overview: 在 telegram_cjmp 工程中实现底部导航栏，包含 Contacts、Chats、Settings 三个 Tab 页签
todos:
  - id: create-pages-directory
    content: 创建 pages 目录和三个空白页面组件（ContactsPage、ChatsPage、SettingsPage）
    status: completed
  - id: modify-index-tabs
    content: 修改 index.cj 实现 Tabs 底部导航栏，集成三个页面组件
    status: completed
    dependencies:
      - create-pages-directory
  - id: build-verify
    content: 构建项目并验证编译通过
    status: completed
    dependencies:
      - modify-index-tabs
---

## 用户需求

在 telegram_cjmp 工程目录中，按照 cjmp 项目工程规则，使用正确的仓颉语法和仓颉 UI 语法，完成 Step 1.2 底部导航栏的实现。

## 产品概述

实现 Telegram 应用的底部导航栏，支持三个 Tab 页面切换：Contacts（联系人）、Chats（聊天）、Settings（设置），Chats 默认选中。

## 核心功能

- 底部导航栏显示三个 Tab 图标和文字
- 点击 Tab 可切换页面
- Chats 默认选中状态（蓝色高亮）
- 选中/未选中状态颜色区分

## Tech Stack

- 语言：仓颉
- UI 框架：Cangjie UI (ohos.component)
- 状态管理：@State 装饰器
- 平台：HarmonyOS

## Implementation Approach

使用仓颉 UI 的 Tabs 组件实现底部导航栏，通过 `BarPosition.End` 属性将导航栏放置在底部。每个 Tab 页面使用 `TabContent` 包裹，通过 `.tabBar()` 方法设置图标和文字。使用 `@State` 管理当前选中的 Tab 索引，实现选中状态的颜色切换。

关键技术决策：

1. **目录结构**：按照 CJMP 规则，在 lib 下创建 `pages` 一级目录存放页面组件
2. **状态管理**：使用 `@State` 管理当前 Tab 索引，实现响应式切换
3. **颜色方案**：选中颜色 `#2196F3`（蓝色），未选中颜色 `#999999`（灰色）
4. **图标实现**：使用 Text 组件显示 Unicode 符号作为图标

## Implementation Notes

- CJMP 规则：功能目录仅允许在 lib 目录下建立一级目录，不允许在一级目录下再建立子包
- 高度规范：底部导航栏高度 56dp
- 默认选中：Chats Tab（索引 1）
- 编译验证：确保 `keels build hap` 成功

## Architecture Design

```
lib/
├── index.cj              # [MODIFY] 主入口，包含 Tabs 组件
├── pages/                # [NEW] 页面组件目录
│   ├── ContactsPage.cj   # [NEW] 联系人页面
│   ├── ChatsPage.cj      # [NEW] 聊天页面
│   └── SettingsPage.cj   # [NEW] 设置页面
├── ability_stage.cj
├── main_ability.cj
└── ...
```

## Directory Structure

```
telegram_cjmp/lib/
├── index.cj              # [MODIFY] 主入口视图，改为 Tabs 组件结构，包含底部导航栏和三个 Tab 页面切换逻辑
├── pages/                # [NEW] 页面组件目录（一级目录）
│   ├── ContactsPage.cj   # [NEW] 联系人页面组件，显示空白页面作为占位
│   ├── ChatsPage.cj      # [NEW] 聊天页面组件，显示空白页面作为占位
│   └── SettingsPage.cj   # [NEW] 设置页面组件，显示空白页面作为占位
```

## Agent Extensions

### Skill

- **cangjie-dev**
- Purpose: 提供仓颉语言和仓颉 UI 语法指导
- Expected outcome: 确保代码符合仓颉语法规范，Tabs 组件使用正确