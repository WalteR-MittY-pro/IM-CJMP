package ohos_app_cangjie_entry.pages

internal import ohos.base.LengthProp
internal import ohos.component.*
internal import ohos.state_manage.LocalStorage
internal import ohos.state_manage.SubscriberManager
internal import ohos.state_manage.ObservedProperty
import ohos.state_macro_manage.Component
import ohos.state_macro_manage.State

// 设置页面类型常量
public let DETAIL_NONE: Int64 = 0
public let DETAIL_PROFILE: Int64 = 1
public let DETAIL_PRIVACY: Int64 = 2
public let DETAIL_NOTIFICATIONS: Int64 = 3
public let DETAIL_CHAT: Int64 = 4
public let DETAIL_THEME: Int64 = 5
public let DETAIL_DEVICES: Int64 = 6
public let DETAIL_HELP: Int64 = 7

@Component
public class SettingsPage {
    @State
    var showSideBar: Bool = false
    @State
    var isDarkMode: Bool = false
    @State
    var currentDetail: Int64 = DETAIL_NONE

    // 切换侧边栏显示
    func toggleSideBar() {
        this.showSideBar = !this.showSideBar
    }

    // 关闭侧边栏
    func closeSideBar() {
        this.showSideBar = false
    }

    // 切换深色模式
    func toggleDarkMode() {
        this.isDarkMode = !this.isDarkMode
    }

    // 处理侧边栏菜单项点击
    func handleMenuClick(menuItem: String) {
        this.showSideBar = false
    }

    // 跳转到详情页
    func navigateToDetail(detailType: Int64) {
        this.currentDetail = detailType
    }

    // 返回设置页
    func goBack() {
        this.currentDetail = DETAIL_NONE
    }

    func build() {
        Stack {
            // 主内容区
            Column {
                // 侧边栏覆盖层（点击关闭侧边栏）
                if (this.showSideBar) {
                    Blank()
                        .width(100.percent)
                        .height(100.percent)
                        .backgroundColor(0x000000)
                        .opacity(0.3)
                        .onClick({ event => this.closeSideBar() })
                }

                // 设置页面主体
                Column {
                    // 头部
                    Row {
                        Text("≡")
                            .fontSize(24)
                            .fontColor(0x333333)
                            .fontWeight(FontWeight.Bold)
                            .onClick({ event => this.toggleSideBar() })

                        Text("设置")
                            .fontSize(20)
                            .fontColor(0x333333)
                            .fontWeight(FontWeight.Medium)
                            .layoutWeight(1)
                            .textAlign(TextAlign.Center)
                    }
                    .width(100.percent)
                    .height(48)
                    .padding(left: 16, right: 16)
                    .alignItems(VerticalAlign.Center)
                    .backgroundColor(0xFFFFFF)

                    // 设置列表 - 紧贴导航栏
                    List {
                        ListItem {
                            Row {
                                Text("👤")
                                    .fontSize(20)
                                Text("个人资料")
                                    .fontSize(16)
                                    .fontColor(0x333333)
                                    .margin(top: 0, bottom: 0, left: 16, right: 0)
                                Blank()
                                    .layoutWeight(1)
                                Text(">")
                                    .fontSize(16)
                                    .fontColor(0x999999)
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 0, bottom: 0)
                            .height(56)
                            .alignItems(VerticalAlign.Center)
                            .onClick({ event => this.navigateToDetail(DETAIL_PROFILE) })
                        }
                        .height(56)

                        ListItem {
                            Row {
                                Text("🔒")
                                    .fontSize(20)
                                Text("隐私与安全")
                                    .fontSize(16)
                                    .fontColor(0x333333)
                                    .margin(top: 0, bottom: 0, left: 16, right: 0)
                                Blank()
                                    .layoutWeight(1)
                                Text(">")
                                    .fontSize(16)
                                    .fontColor(0x999999)
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 0, bottom: 0)
                            .height(56)
                            .alignItems(VerticalAlign.Center)
                            .onClick({ event => this.navigateToDetail(DETAIL_PRIVACY) })
                        }
                        .height(56)

                        ListItem {
                            Row {
                                Text("🔔")
                                    .fontSize(20)
                                Text("通知")
                                    .fontSize(16)
                                    .fontColor(0x333333)
                                    .margin(top: 0, bottom: 0, left: 16, right: 0)
                                Blank()
                                    .layoutWeight(1)
                                Text(">")
                                    .fontSize(16)
                                    .fontColor(0x999999)
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 0, bottom: 0)
                            .height(56)
                            .alignItems(VerticalAlign.Center)
                            .onClick({ event => this.navigateToDetail(DETAIL_NOTIFICATIONS) })
                        }
                        .height(56)

                        ListItem {
                            Row {
                                Text("💬")
                                    .fontSize(20)
                                Text("聊天")
                                    .fontSize(16)
                                    .fontColor(0x333333)
                                    .margin(top: 0, bottom: 0, left: 16, right: 0)
                                Blank()
                                    .layoutWeight(1)
                                Text(">")
                                    .fontSize(16)
                                    .fontColor(0x999999)
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 0, bottom: 0)
                            .height(56)
                            .alignItems(VerticalAlign.Center)
                            .onClick({ event => this.navigateToDetail(DETAIL_CHAT) })
                        }
                        .height(56)

                        ListItem {
                            Row {
                                Text("🎨")
                                    .fontSize(20)
                                Text("主题")
                                    .fontSize(16)
                                    .fontColor(0x333333)
                                    .margin(top: 0, bottom: 0, left: 16, right: 0)
                                Blank()
                                    .layoutWeight(1)
                                Text(">")
                                    .fontSize(16)
                                    .fontColor(0x999999)
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 0, bottom: 0)
                            .height(56)
                            .alignItems(VerticalAlign.Center)
                            .onClick({ event => this.navigateToDetail(DETAIL_THEME) })
                        }
                        .height(56)

                        ListItem {
                            Row {
                                Text("📱")
                                    .fontSize(20)
                                Text("设备")
                                    .fontSize(16)
                                    .fontColor(0x333333)
                                    .margin(top: 0, bottom: 0, left: 16, right: 0)
                                Blank()
                                    .layoutWeight(1)
                                Text(">")
                                    .fontSize(16)
                                    .fontColor(0x999999)
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 0, bottom: 0)
                            .height(56)
                            .alignItems(VerticalAlign.Center)
                            .onClick({ event => this.navigateToDetail(DETAIL_DEVICES) })
                        }
                        .height(56)

                        ListItem {
                            Row {
                                Text("📚")
                                    .fontSize(20)
                                Text("帮助")
                                    .fontSize(16)
                                    .fontColor(0x333333)
                                    .margin(top: 0, bottom: 0, left: 16, right: 0)
                                Blank()
                                    .layoutWeight(1)
                                Text(">")
                                    .fontSize(16)
                                    .fontColor(0x999999)
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 0, bottom: 0)
                            .height(56)
                            .alignItems(VerticalAlign.Center)
                            .onClick({ event => this.navigateToDetail(DETAIL_HELP) })
                        }
                        .height(56)
                    }
                    .width(100.percent)
                    .layoutWeight(1)
                    .divider(strokeWidth: 1, color: 0xEEEEEE, startMargin: 0, endMargin: 0)
                }
                .width(100.percent)
                .height(100.percent)
                .backgroundColor(0xFFFFFF)
            }
            .width(100.percent)
            .height(100.percent)

            // 侧边栏（上层）- 当showSideBar为true时从左侧显示
            if (this.showSideBar) {
                Column {
                    // 头部区域 - 蓝色背景 #5BA0D0
                    Column {
                        // 右上角图标
                        Row {
                            if (this.isDarkMode) {
                                Text("☀️")
                                    .fontSize(20)
                                    .onClick({ event => this.toggleDarkMode() })
                            } else {
                                Text("🌙")
                                    .fontSize(20)
                                    .onClick({ event => this.toggleDarkMode() })
                            }
                            Text("🔍")
                                .fontSize(20)
                                .margin(top: 0, bottom: 0, left: 16, right: 0)
                        }
                        .width(100.percent)
                        .justifyContent(FlexAlign.End)
                        .padding(right: 16)

                        // 头像 72x72 - 华为头像
                        Column {
                            Text("华")
                                .fontSize(32)
                                .fontColor(0xFFFFFF)
                                .fontWeight(FontWeight.Bold)
                        }
                        .width(72)
                        .height(72)
                        .backgroundColor(0xFF0000)
                        .borderRadius(36)
                        .justifyContent(FlexAlign.Center)
                        .alignItems(HorizontalAlign.Center)
                        .margin(top: 30)

                        // 用户名
                        Text("CJMP")
                            .fontSize(18)
                            .fontColor(0xFFFFFF)
                            .fontWeight(FontWeight.Medium)
                            .margin(top: 12)

                        // 手机号
                        Text("+86 138 0000 0000")
                            .fontSize(14)
                            .fontColor(0xFFFFFF)
                            .opacity(0.8)
                            .margin(top: 4)
                    }
                    .width(100.percent)
                    .height(180)
                    .backgroundColor(0x5BA0D0)
                    .alignItems(HorizontalAlign.Center)

                    // 菜单项列表
                    List {
                        ListItem {
                            Row {
                                Text("👤")
                                    .fontSize(20)
                                Text("主页")
                                    .fontSize(16)
                                    .fontColor(0x333333)
                                    .margin(top: 0, bottom: 0, left: 16, right: 0)
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 0, bottom: 0)
                            .height(56)
                            .alignItems(VerticalAlign.Center)
                            .onClick({ event => this.handleMenuClick("主页") })
                        }
                        .height(56)

                        ListItem {
                            Row {
                                Text("💰")
                                    .fontSize(20)
                                Text("Wallet")
                                    .fontSize(16)
                                    .fontColor(0x333333)
                                    .margin(top: 0, bottom: 0, left: 16, right: 0)
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 0, bottom: 0)
                            .height(56)
                            .alignItems(VerticalAlign.Center)
                            .onClick({ event => this.handleMenuClick("Wallet") })
                        }
                        .height(56)

                        ListItem {
                            Row {
                                Text("➕")
                                    .fontSize(20)
                                Text("新建群组")
                                    .fontSize(16)
                                    .fontColor(0x333333)
                                    .margin(top: 0, bottom: 0, left: 16, right: 0)
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 0, bottom: 0)
                            .height(56)
                            .alignItems(VerticalAlign.Center)
                            .onClick({ event => this.handleMenuClick("新建群组") })
                        }
                        .height(56)

                        ListItem {
                            Row {
                                Text("📒")
                                    .fontSize(20)
                                Text("联系人")
                                    .fontSize(16)
                                    .fontColor(0x333333)
                                    .margin(top: 0, bottom: 0, left: 16, right: 0)
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 0, bottom: 0)
                            .height(56)
                            .alignItems(VerticalAlign.Center)
                            .onClick({ event => this.handleMenuClick("联系人") })
                        }
                        .height(56)

                        ListItem {
                            Row {
                                Text("📞")
                                    .fontSize(20)
                                Text("通话呼叫")
                                    .fontSize(16)
                                    .fontColor(0x333333)
                                    .margin(top: 0, bottom: 0, left: 16, right: 0)
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 0, bottom: 0)
                            .height(56)
                            .alignItems(VerticalAlign.Center)
                            .onClick({ event => this.handleMenuClick("通话呼叫") })
                        }
                        .height(56)

                        ListItem {
                            Row {
                                Text("🔖")
                                    .fontSize(20)
                                Text("收藏夹")
                                    .fontSize(16)
                                    .fontColor(0x333333)
                                    .margin(top: 0, bottom: 0, left: 16, right: 0)
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 0, bottom: 0)
                            .height(56)
                            .alignItems(VerticalAlign.Center)
                            .onClick({ event => this.handleMenuClick("收藏夹") })
                        }
                        .height(56)

                        ListItem {
                            Row {
                                Text("⚙")
                                    .fontSize(20)
                                Text("设置")
                                    .fontSize(16)
                                    .fontColor(0x333333)
                                    .margin(top: 0, bottom: 0, left: 16, right: 0)
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 0, bottom: 0)
                            .height(56)
                            .alignItems(VerticalAlign.Center)
                            .onClick({ event => this.handleMenuClick("设置") })
                        }
                        .height(56)

                        ListItem {
                            Row {
                                Text("➕")
                                    .fontSize(20)
                                Text("邀请朋友")
                                    .fontSize(16)
                                    .fontColor(0x333333)
                                    .margin(top: 0, bottom: 0, left: 16, right: 0)
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 0, bottom: 0)
                            .height(56)
                            .alignItems(VerticalAlign.Center)
                            .onClick({ event => this.handleMenuClick("邀请朋友") })
                        }
                        .height(56)

                        ListItem {
                            Row {
                                Text("❓")
                                    .fontSize(20)
                                Text("锦囊妙计")
                                    .fontSize(16)
                                    .fontColor(0x333333)
                                    .margin(top: 0, bottom: 0, left: 16, right: 0)
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 0, bottom: 0)
                            .height(56)
                            .alignItems(VerticalAlign.Center)
                            .onClick({ event => this.handleMenuClick("锦囊妙计") })
                        }
                        .height(56)
                    }
                    .width(100.percent)
                    .layoutWeight(1)
                    .divider(strokeWidth: 1, color: 0xEEEEEE, startMargin: 0, endMargin: 0)
                }
                .width(280)
                .height(100.percent)
                .backgroundColor(0xFFFFFF)
                .alignItems(HorizontalAlign.Start)
            }

            // 个人资料详情页
            if (this.currentDetail == DETAIL_PROFILE) {
                ProfilePage(
                    onBack: { => this.goBack() }
                )
            }

            // 隐私与安全详情页
            if (this.currentDetail == DETAIL_PRIVACY) {
                PrivacySecurityPage(
                    onBack: { => this.goBack() }
                )
            }

            // 通知详情页
            if (this.currentDetail == DETAIL_NOTIFICATIONS) {
                NotificationsPage(
                    onBack: { => this.goBack() }
                )
            }

            // 聊天详情页
            if (this.currentDetail == DETAIL_CHAT) {
                ChatSettingsPage(
                    onBack: { => this.goBack() }
                )
            }

            // 主题详情页
            if (this.currentDetail == DETAIL_THEME) {
                Column {
                    ThemePage(onBack: { => this.goBack() })
                }
                .position(x: 0, y: 0)
                .width(100.percent)
                .height(100.percent)
            }

            // 设备详情页
            if (this.currentDetail == DETAIL_DEVICES) {
                Column {
                    DevicesPage(onBack: { => this.goBack() })
                }
                .position(x: 0, y: 0)
                .width(100.percent)
                .height(100.percent)
            }

            // 帮助详情页
            if (this.currentDetail == DETAIL_HELP) {
                Column {
                    HelpPage(onBack: { => this.goBack() })
                }
                .position(x: 0, y: 0)
                .width(100.percent)
                .height(100.percent)
            }
        }
        .width(100.percent)
        .height(100.percent)
    }
}
