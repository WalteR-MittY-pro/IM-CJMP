---
name: telegram_cjmp_sidebar
overview: 在telegram_cjmp项目中实现4.1侧边栏布局组件，包括蓝色头部和9个菜单项
todos:
  - id: create-sidebar-page
    content: 创建SideBarPage.cj侧边栏组件文件
    status: completed
  - id: integrate-sidebar
    content: 修改ChatsPage.cj集成侧边栏显示/隐藏逻辑
    status: completed
    dependencies:
      - create-sidebar-page
  - id: verify-build
    content: 执行编译验证代码通过
    status: completed
    dependencies:
      - integrate-sidebar
---

## 用户需求

按照DEVELOPMENT_PLAN.md进行4.1侧边栏布局组件开发

## 需求详情

### 用户头部（蓝色 #5BA0D0）

- 右上角图标：月亮、搜索图标
- 头像尺寸：72x72
- 用户名、手机号显示

### 菜单项（9个）

- 主页、Wallet、新建群组、联系人、通话呼叫、收藏夹、设置、邀请朋友、锦囊妙计

### 组件规范

- 头部高度：140dp
- 背景色：#5BA0D0
- 菜单项高度：56dp

### 验证方法

- 点击导航栏≡图标滑出侧边栏
- 显示蓝色头部+用户信息+9个菜单项

## 技术栈

- 框架：Cangjie（仓颉）UI框架
- 项目结构：单页应用，通过状态变量控制侧边栏显示/隐藏

## 实现方案

采用覆盖层方式实现侧边栏滑出效果：

1. **SideBarPage.cj** - 独立的侧边栏组件，包含用户头部和9个菜单项
2. **ChatsPage.cj修改** - 添加侧边栏状态变量和显示/隐藏逻辑，通过Stack布局实现覆盖层效果

## 实现细节

- 侧边栏宽度：约280dp（屏幕宽度的75%左右）
- 头部区域：140dp高度，蓝色背景#5BA0D0
- 菜单项：垂直List布局，每项56dp高度
- 覆盖层：点击空白区域或菜单项后关闭侧边栏

## 代码模式参考

- 现有ChatsPage.cj使用@Component装饰器
- 使用@State管理状态
- 使用Stack/Column/Row进行布局
- 使用.onClick处理点击事件