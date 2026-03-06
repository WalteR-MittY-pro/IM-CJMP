---
name: ThemePage主题页面开发
overview: 在telegram_cjmp工程中创建主题(Theme)设置页面，实现5.1-5.3组件开发，包括顶部导航栏、功能列表和布局结构
todos:
  - id: create-theme-page
    content: 创建ThemePage.cj主题设置页面组件，实现顶部导航栏和全部10个功能设置项
    status: completed
  - id: update-settings-page
    content: 更新SettingsPage.cj，添加"主题"项点击事件和DETAIL_THEME页面显示逻辑
    status: completed
    dependencies:
      - create-theme-page
  - id: verify-build
    content: 运行keels build apk验证编译通过
    status: completed
    dependencies:
      - update-settings-page
---

## 产品需求

在telegram_cjmp工程中实现主题设置页面（ThemePage），作为设置页面的子页面

## 核心功能

1. 顶部导航栏：返回按钮（"<"箭头）+ 标题（居中"主题"）
2. 主题模式设置：浅色/深色/系统三选项，右侧显示当前选项和">"箭头
3. 深色模式开关：Toggle开关控制
4. 定时深色模式开关：根据时间自动切换深色模式
5. 深色开始时间设置：显示"22:00 >"
6. 深色结束时间设置：显示"08:00 >"
7. 强调色选择：6个颜色方块（蓝#2196F3、红#F44336、绿#4CAF50、黄#FFEB3B、橙#FF9800、紫#9C27B0）+ ">"箭头
8. 聊天背景：缩略图 + ">"箭头
9. 表情主题：缩略图 + ">"箭头
10. 字体大小：滑块控制

## 布局结构

完整的布局结构见DEVELOPMENT_PLAN.md第916-952行，使用分组列表形式展示各项设置

## 技术方案

- 框架：Cangjie + CJMP（鸿蒙应用）
- 参考现有PrivacySecurityPage.cj的实现模式
- 使用Stack组件实现页面叠加（与SettingsPage一致）
- 使用Scroll + List组件实现功能列表
- 使用Checkbox组件实现Toggle开关
- 使用onBack回调实现返回功能

## 实现细节

1. 创建ThemePage.cj：完整的详情页组件，包含所有主题设置项
2. 更新SettingsPage.cj：

- 为"主题"ListItem添加onClick事件，调用navigateToDetail(DETAIL_THEME)
- 在Stack中添加DETAIL_THEME条件分支，显示ThemePage

3. 使用与PrivacySecurityPage一致的顶部导航栏结构（Row + 返回按钮 + 标题）
4. 使用分组List展示功能项，遵循现有代码风格