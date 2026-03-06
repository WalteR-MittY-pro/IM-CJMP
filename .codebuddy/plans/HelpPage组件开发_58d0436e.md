---
name: HelpPage组件开发
overview: 按照DEVELOPMENT_PLAN.md的7.1-7.4需求，创建帮助页面组件，包括：顶部导航栏、功能列表（常见问题、提问问题、报告问题、使用条款、隐私政策、关于）
design:
  styleKeywords:
    - Minimalism
    - Clean
    - Consistent
  fontSystem:
    fontFamily: 默认字体
    heading:
      size: 18px
      weight: 500
    subheading:
      size: 16px
      weight: 400
    body:
      size: 14px
      weight: 400
  colorSystem:
    primary:
      - "#333333"
    background:
      - "#FFFFFF"
      - "#F5F5F5"
    text:
      - "#333333"
      - "#999999"
    functional:
      - "#EEEEEE"
todos:
  - id: create-help-page
    content: 创建HelpPage.cj帮助页面组件文件，实现顶部导航栏和功能列表
    status: completed
  - id: add-help-import
    content: 在SettingsPage.cj中添加HelpPage的import语句
    status: completed
    dependencies:
      - create-help-page
  - id: add-help-onclick
    content: 在SettingsPage.cj的帮助列表项添加onClick事件，跳转到DETAIL_HELP
    status: completed
    dependencies:
      - add-help-import
  - id: add-help-render
    content: 在SettingsPage.cj中添加HelpPage组件的渲染逻辑
    status: completed
    dependencies:
      - add-help-onclick
---

## Product Overview

帮助页面是设置模块的子页面，用于展示帮助和支持相关信息

## Core Features

- 7.1 顶部导航栏：返回按钮（左上角"<"），标题居中"帮助"
- 7.2 功能列表：常见问题、提问问题、报告问题、使用条款、隐私政策、关于
- 7.3 布局结构：分组显示，每组包含相关功能项
- 7.4 组件规范：列表项高度56dp，分隔线1dp #EEEEEE

## Tech Stack

- 框架：Cangjie UI (CJMP)
- 语言：Cangjie
- 项目结构：参考现有ThemePage和ChatSettingsPage的组件模式

## Implementation Approach

基于现有项目模式创建HelpPage组件，参考ThemePage的顶部导航栏结构和ChatSettingsPage的列表布局。页面采用Stack布局叠加在设置页面上，通过currentDetail状态控制显示。

## Architecture Design

采用与现有详情页相同的架构模式：

- 独立组件文件 HelpPage.cj
- 通过 @Component 装饰器定义
- 接收 onBack 回调函数实现返回功能
- 使用 List 组件实现功能列表，分组显示

## Directory Structure

```
telegram_cjmp/lib/pages/
├── HelpPage.cj          # [NEW] 帮助页面组件
├── SettingsPage.cj      # [MODIFY] 添加帮助项点击事件和页面渲染
```

采用与ThemePage和ChatSettingsPage一致的UI设计风格：顶部48dp导航栏，白色背景，标题居中；内容区域使用浅灰色背景(0xF5F5F5)，功能列表使用白色背景卡片样式，分组标题使用灰色文字(0x999999)，分隔线使用0xEEEEEE颜色