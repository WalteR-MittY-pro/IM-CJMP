---
name: telegram_cjmp UI修复
overview: 修复telegram_cjmp工程的UI问题：去掉上边栏空白区域，将页面标题居中显示，并将"Chats"改为"聊天"
todos:
  - id: hide-tabbar-text
    content: 修改 index.cj，隐藏底部标签栏文字
    status: completed
  - id: add-chats-title
    content: 修改 ChatsPage.cj，添加顶部居中标题并改为"聊天"
    status: completed
    dependencies:
      - hide-tabbar-text
  - id: add-contacts-title
    content: 修改 ContactsPage.cj，添加顶部居中标题
    status: completed
    dependencies:
      - hide-tabbar-text
  - id: add-settings-title
    content: 修改 SettingsPage.cj，添加顶部居中标题
    status: completed
    dependencies:
      - hide-tabbar-text
---

## 用户需求

1. 应用底部标签栏显示文字（Contacts、Chats、设置），位置不美观
2. 各个页面的标题目前在页面内靠左显示
3. 隐藏底部标签栏的文字显示
4. 在每个页面的顶部居中显示页面标题
5. 将"Chats"改为中文"聊天"

## 核心功能

- 隐藏 Tabs 组件的 tabBar 文字显示
- 修改 ChatsPage、ContactsPage、SettingsPage 三个页面，在页面顶部居中添加标题栏
- 将 Chats 相关的显示文字改为"聊天"

## 技术栈

- 框架：Cangjie（鸿蒙应用开发语言）
- 组件：Tabs、TabContent、Row、Text

## 实现方案

### 修改策略

1. **隐藏底部标签栏文字**：在 index.cj 中，将 tabBar 的文字设置为空字符串或隐藏
2. **添加页面顶部标题栏**：在每个页面的 Column 内部最上方添加一个居中的 Row 标题栏
3. **中文化**：将"Chats"改为"聊天"

### 实现细节

- index.cj：修改 tabBar 调用，传入空字符串隐藏底部文字
- ChatsPage.cj：在 build() 的 Column 开头添加居中标题栏，标题改为"聊天"
- ContactsPage.cj：在 build() 的 Column 开头添加居中标题栏
- SettingsPage.cj：在 build() 的 Column 开头添加居中标题栏

## 目录结构

涉及文件：

- /Users/dzy/Desktop/project/TelegramTest/telegram_cjmp/lib/index.cj - [MODIFY] 隐藏 tabBar 文字
- /Users/dzy/Desktop/project/TelegramTest/telegram_cjmp/lib/pages/ChatsPage.cj - [MODIFY] 添加顶部居中标题，改"Chats"为"聊天"
- /Users/dzy/Desktop/project/TelegramTest/telegram_cjmp/lib/pages/ContactsPage.cj - [MODIFY] 添加顶部居中标题
- /Users/dzy/Desktop/project/TelegramTest/telegram_cjmp/lib/pages/SettingsPage.cj - [MODIFY] 添加顶部居中标题