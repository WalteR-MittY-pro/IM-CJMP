---
name: cjmp本地消息发送功能
overview: 在telegram_cjmp工程中实现本地消息发送功能，UI层反映本地数据库消息状态，不涉及网络传输
todos:
  - id: create-database-module
    content: 创建lib/database目录和消息数据结构文件message_data.cj
    status: completed
  - id: create-message-store
    content: 创建消息仓库类message_store.cj，提供消息持久化和状态管理
    status: completed
    dependencies:
      - create-database-module
  - id: modify-chat-detail-page
    content: 修改ChatDetailPage.cj，集成MessageStore实现本地消息发送
    status: completed
    dependencies:
      - create-message-store
  - id: verify-build
    content: 验证项目编译通过
    status: completed
    dependencies:
      - modify-chat-detail-page
---

## 用户需求

在telegram_cjmp工程目录中，实现本地消息发送功能，UI层需要反映本地数据库中消息的状态变化，不考虑网络上消息的传递。

## 产品概述

聊天应用的本地消息管理模块，提供消息状态管理持久化存储和功能。

## 核心功能

- 本地消息持久化存储（基于内存存储模拟数据库）
- 消息状态管理（sending->sent->delivered->read）
- 消息创建、读取、状态更新功能
- UI层自动响应本地数据库状态变化

## 技术栈

- 框架：Cangjie (CJMP) for HarmonyOS
- 存储：基于内存的本地消息存储（模拟数据库行为）
- 状态管理：Cangjie @State + ObservableProperty

## 技术方案

采用分层架构设计，将数据层与UI层分离：

1. **数据层 (lib/database)**：消息存储服务，管理消息的持久化和状态
2. **UI层 (lib/pages)**：聊天页面，响应数据层状态变化

### 模块划分

- lib/database/message_store.cj：消息仓库类，提供消息CRUD和状态管理
- lib/database/message_data.cj：消息数据结构定义

### 数据流

用户发送消息 -> MessageStore.addMessage() -> 更新内存存储 -> 触发状态变更 -> UI响应渲染

### 消息状态流转

- sending：消息刚创建，提交到数据库
- sent：消息已保存到数据库
- delivered：模拟已送达状态
- read：模拟已读状态

�态