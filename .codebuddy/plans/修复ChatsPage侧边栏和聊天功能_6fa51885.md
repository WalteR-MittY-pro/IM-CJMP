---
name: 修复ChatsPage侧边栏和聊天功能
overview: 修复ChatsPage.cj的3个bug：恢复20个带头像的聊天列表、添加点击打开聊天详情功能、修复侧边栏从左侧开始显示
todos:
  - id: extend-chat-item-struct
    content: 扩展ChatItem结构体，添加avatarColor和avatarLetter字段
    status: completed
  - id: add-chat-data-list
    content: 添加20个带头像的聊天数据列表
    status: completed
    dependencies:
      - extend-chat-item-struct
  - id: render-chat-list-with-avatar
    content: 使用ForEach循环渲染20个聊天列表项，每项包含头像
    status: completed
    dependencies:
      - add-chat-data-list
  - id: add-onclick-events
    content: 为每个ListItem添加onClick事件，打开聊天详情页
    status: completed
    dependencies:
      - render-chat-list-with-avatar
  - id: fix-sidebar-position
    content: 修改侧边栏alignItems为HorizontalAlign.Start，从左侧显示
    status: completed
---

## 用户需求

修复ChatsPage.cj中的3个bug：

1. 聊天页面原有逻辑改变，头像丢失，需恢复20个Mock数据头像
2. 聊天详情页打不开，需恢复打开功能（为每个聊天项添加点击事件）
3. 侧边栏需从屏幕左侧开始，占用当前宽度，而非占据屏幕中央

## 当前代码问题

- 聊天列表只有6个硬编码项（Kevin、Telegram、John、Mom、工作群、AI 人工智能），无头像显示
- 仅有"AI 人工智能"有onClick事件，其他5项无点击功能，无法打开聊天详情页
- 侧边栏使用`.alignItems(HorizontalAlign.End)`导致显示在右侧（第660行）

## 修复内容

- 在ChatItem结构体中添加avatarColor和avatarLetter字段用于显示头像
- 将聊天列表替换为20个带头像的Mock数据（参考MockData.cj中的聊天名称）
- 为每个ListItem添加onClick事件调用navigateToChat方法
- 修改侧边栏alignItems为HorizontalAlign.Start使其从左侧显示

## 技术方案

### 修改文件

- `/Users/dzy/Desktop/project/TelegramTest/telegram_cjmp/lib/pages/ChatsPage.cj`

### 实现步骤

1. **扩展ChatItem结构体**

- 在第13-25行的ChatItem结构体中添加`avatarColor: Int64`和`avatarLetter: String`字段

2. **修改聊天列表实现方式**

- 将硬编码的6个ListItem替换为使用ForEach循环渲染20个聊天数据
- 每个聊天项包含：头像（颜色块+首字母）、名称、最后消息、时间、未读数

3. **添加点击事件**

- 为每个ListItem添加`.onClick({ event => this.navigateToChat(chatName) })`

4. **修复侧边栏位置**

- 修改第660行：将`.alignItems(HorizontalAlign.End)`改为`.alignItems(HorizontalAlign.Start)`

### 20个聊天数据（参考MockData.cj）

1. 关爱少女成长协会 - #E91E63
2. PSA-安全公告专栏 - #9C27B0
3. 非正常人类研究中心 - #673AB7
4. Telegram Developers - #3F51B5
5. 妈妈 - #FF9800
6. 李明 - #4CAF50
7. 编程技术分享 - #00BCD4
8. 每日新闻 - #F44336
9. 游戏交流群 - #8BC34A
10. 音乐分享 - #FFEB3B
11. 考研学习交流 - #009688
12. 健身打卡 - #795548
13. 旅行爱好者 - #607D8B
14. 美食分享 - #E91E63
15. 电影推荐 - #673AB7
16. 二手交易 - #4CAF50
17. 宠物交流 - #FF5722
18. 前端开发 - #2196F3
19. 产品经理交流 - #9C27B0
20. AI 人工智能 - #3F51B5