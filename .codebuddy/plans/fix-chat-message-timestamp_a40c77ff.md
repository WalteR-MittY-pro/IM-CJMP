---
name: fix-chat-message-timestamp
overview: 修复聊天详情页时间戳显示逻辑：将时间戳显示在每条消息旁边，而非导航栏下方
todos:
  - id: remove-date-separator
    content: 移除导航栏下方错误的日期分隔组件
    status: completed
  - id: add-message-timestamps
    content: 为每条消息添加时间戳显示
    status: completed
    dependencies:
      - remove-date-separator
  - id: build-verify
    content: 编译验证修改结果
    status: completed
    dependencies:
      - add-message-timestamps
---

## 用户需求

修正 Step 3.1 的实现：

- 移除导航栏下方错误放置的"日期分隔"组件
- 在每条消息旁边添加时间戳显示（如 09/02 17:17）
- 时间戳格式：MM/DD HH:mm
- 时间戳颜色：#999999
- 时间戳字号：12sp

## 产品概述

聊天详情页中，每条消息都应该显示发送时间，而不是在导航栏下方集中显示一个时间。

## 核心功能

- 移除错误的日期分隔组件
- Message 数据结构添加时间戳字段
- 消息气泡下方/旁边显示时间戳
- 接收消息的时间戳显示在气泡下方左侧
- 发送消息的时间戳显示在气泡下方右侧

## 技术栈

- 语言：仓颉 (Cangjie)
- UI框架：仓颉UI组件库
- 构建目标：Android

## 实现方案

### 修改内容

1. **移除错误组件**：删除第78-87行的"日期分隔"Row组件
2. **消息结构调整**：当前消息硬编码在列表中，需要为每条消息添加时间戳数据
3. **UI布局调整**：每条消息气泡下方添加时间戳Text组件

### 修改文件

- `/Users/dzy/Desktop/project/TelegramTest/telegram_cjmp/lib/pages/ChatsPage.cj`

### 消息时间戳规范

- 接收消息（左侧）：气泡下方左对齐显示时间
- 发送消息（右侧）：气泡下方右对齐显示时间
- 格式：MM/DD HH:mm（如 09/02 17:17）
- 颜色：#999999
- 字号：12sp

## 目录结构

```
telegram_cjmp/lib/pages/
└── ChatsPage.cj  # [MODIFY] 修改聊天详情页，移除错误日期分隔，为每条消息添加时间戳显示
```