---
name: step-2.2-chat-list-item
overview: 在 ChatsPage.cj 中实现聊天列表项组件，包括 Mock 数据、列表渲染、头像、消息预览、时间和未读角标
todos:
  - id: add-chat-item-struct
    content: 在 ChatsPage.cj 中添加 ChatItem 数据结构体和 Mock 数据
    status: completed
  - id: implement-list-component
    content: 使用 List + ForEach 实现聊天列表渲染
    status: completed
    dependencies:
      - add-chat-item-struct
  - id: build-verify
    content: 运行 keels build ios 验证编译通过
    status: completed
    dependencies:
      - implement-list-component
---

## 产品概述

在 ChatsPage 页面实现聊天列表项组件，展示用户聊天记录列表

## 核心功能

- 显示聊天列表项，包含头像、名称、消息预览、时间
- 未读消息显示角标
- 列表项高度 80dp，头像 48x48dp 圆形
- 分割线颜色 #EEEEEE
- Mock 数据渲染 3 个聊天列表项

## 技术方案

### 实现方案

在 `ChatsPage.cj` 中添加：

1. 定义 `ChatItem` 数据结构体
2. 使用 `@State` 管理聊天列表数据
3. 使用 `List` + `ListItem` 组件渲染列表
4. 使用 `ForEach` 循环渲染列表项
5. 实现圆形头像（使用带背景色的圆形组件）
6. 实现未读角标（小圆角矩形）

### 仓颉 UI 语法要点

- `List { ForEach(...) { ListItem { } } }` 渲染动态列表
- `.borderRadius(24)` 实现圆形头像
- `.margin(top:, bottom:, left:, right:)` 使用命名参数
- 已知问题：不能在 `@Component` 类中使用返回 UI 的辅助函数

### 文件变更

```
telegram_cjmp/lib/pages/ChatsPage.cj  # [MODIFY] 添加聊天列表组件.      
```