package ohos_app_cangjie_entry.pages

internal import ohos.base.LengthProp
internal import ohos.component.*
internal import ohos.state_manage.LocalStorage
internal import ohos.state_manage.SubscriberManager
internal import ohos.state_manage.ObservedProperty
import ohos.state_macro_manage.Component
import ohos.state_macro_manage.State

// 主题设置数据模型
public class ThemeSettings {
    // 主题模式：0-浅色 1-深色 2-系统
    public var themeMode: Int64
    // 深色模式开关
    public var darkMode: Bool
    // 定时深色模式开关
    public var scheduledDarkMode: Bool
    // 深色开始时间
    public var darkModeStartTime: String
    // 深色结束时间
    public var darkModeEndTime: String
    // 强调色索引（0-5）
    public var accentColorIndex: Int64
    // 聊天背景
    public var chatBackground: String
    // 表情主题
    public var emojiTheme: String
    // 字体大小（0-100）
    public var fontSize: Int64

    public init(themeMode: Int64, darkMode: Bool, scheduledDarkMode: Bool,
                darkModeStartTime: String, darkModeEndTime: String,
                accentColorIndex: Int64, chatBackground: String,
                emojiTheme: String, fontSize: Int64) {
        this.themeMode = themeMode
        this.darkMode = darkMode
        this.scheduledDarkMode = scheduledDarkMode
        this.darkModeStartTime = darkModeStartTime
        this.darkModeEndTime = darkModeEndTime
        this.accentColorIndex = accentColorIndex
        this.chatBackground = chatBackground
        this.emojiTheme = emojiTheme
        this.fontSize = fontSize
    }

    public static func getDefault(): ThemeSettings {
        return ThemeSettings(0, false, false, "22:00", "08:00", 0, "默认", "默认", 50)
    }
}

// 强调色选项
public let ACCENT_COLORS: Array<Int64> = [0x2196F3, 0xF44336, 0x4CAF50, 0xFFEB3B, 0xFF9800, 0x9C27B0]
public let ACCENT_COLOR_NAMES: Array<String> = ["蓝色", "红色", "绿色", "黄色", "橙色", "紫色"]

// 主题设置详情页
@Component
public class ThemePage {
    // 返回回调
    var onBack: () -> Unit = { => }

    // 主题设置数据
    @State
    var themeSettings: ThemeSettings = ThemeSettings.getDefault()

    // 返回上一页
    func onBackClick() {
        this.onBack()
    }

    // 切换主题模式
    func onThemeModeClick() {
        this.themeSettings.themeMode = (this.themeSettings.themeMode + 1) % 3
    }

    // 切换深色模式
    func onDarkModeToggle(isOn: Bool) {
        this.themeSettings.darkMode = isOn
    }

    // 切换定时深色模式
    func onScheduledDarkModeToggle(isOn: Bool) {
        this.themeSettings.scheduledDarkMode = isOn
    }

    // 点击深色开始时间
    func onDarkModeStartTimeClick() {
        // TODO: 跳转到时间选择器
    }

    // 点击深色结束时间
    func onDarkModeEndTimeClick() {
        // TODO: 跳转到时间选择器
    }

    // 点击强调色
    func onAccentColorClick(index: Int64) {
        this.themeSettings.accentColorIndex = index
    }

    // 点击聊天背景
    func onChatBackgroundClick() {
        // TODO: 跳转到背景选择器
    }

    // 点击表情主题
    func onEmojiThemeClick() {
        // TODO: 跳转到表情主题选择器
    }

    // 调整字体大小
    func onFontSizeDecrease() {
        if (this.themeSettings.fontSize > 10) {
            this.themeSettings.fontSize -= 10
        }
    }

    func onFontSizeIncrease() {
        if (this.themeSettings.fontSize < 100) {
            this.themeSettings.fontSize += 10
        }
    }

    // 获取主题模式显示文本
    func getThemeModeText(): String {
        if (this.themeSettings.themeMode == 0) {
            return "浅色"
        } else if (this.themeSettings.themeMode == 1) {
            return "深色"
        } else if (this.themeSettings.themeMode == 2) {
            return "系统"
        }
        return "浅色"
    }

    func build() {
        Column {
            // 顶部导航栏
            Row {
                Text("<")
                    .fontSize(24)
                    .fontColor(0x333333)
                    .fontWeight(FontWeight.Bold)
                    .onClick({ event => this.onBackClick() })

                Blank()
                    .layoutWeight(1)

                Text("主题")
                    .fontSize(18)
                    .fontColor(0x333333)
                    .fontWeight(FontWeight.Medium)

                Blank()
                    .layoutWeight(1)

                Blank()
                    .width(24)
            }
            .width(100.percent)
            .height(48)
            .padding(left: 16, right: 16)
            .alignItems(VerticalAlign.Center)
            .backgroundColor(0xFFFFFF)

            // 功能列表 - 紧贴导航栏
            Scroll {
                Column {
                    // 分组：主题设置
                    List {
                        // 主题模式
                        ListItem {
                            Row {
                                Text("🎨")
                                    .fontSize(20)
                                Text("主题模式")
                                    .fontSize(16)
                                    .fontColor(0x333333)
                                    .margin(top: 0, bottom: 0, left: 16, right: 0)
                                Blank()
                                    .layoutWeight(1)
                                Text(this.getThemeModeText())
                                    .fontSize(16)
                                    .fontColor(0x999999)
                                Text(" >")
                                    .fontSize(16)
                                    .fontColor(0x999999)
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 12, bottom: 12)
                            .alignItems(VerticalAlign.Center)
                            .onClick({ event => this.onThemeModeClick() })
                        }
                        .height(56)
                    }
                    .width(100.percent)
                    .divider(strokeWidth: 1, color: 0xEEEEEE, startMargin: 56, endMargin: 0)

                    // 分组：深色模式
                    List {
                        // 深色模式开关
                        ListItem {
                            Row {
                                Text("🌙")
                                    .fontSize(20)
                                Text("深色模式")
                                    .fontSize(16)
                                    .fontColor(0x333333)
                                    .margin(top: 0, bottom: 0, left: 16, right: 0)
                                Blank()
                                    .layoutWeight(1)
                                Checkbox()
                                    .select(this.themeSettings.darkMode)
                                    .onChange({ isChecked: Bool => this.onDarkModeToggle(isChecked) })
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 12, bottom: 12)
                            .alignItems(VerticalAlign.Center)
                        }
                        .height(56)

                        // 定时深色模式开关
                        ListItem {
                            Row {
                                Text("⏰")
                                    .fontSize(20)
                                Text("定时深色模式")
                                    .fontSize(16)
                                    .fontColor(0x333333)
                                    .margin(top: 0, bottom: 0, left: 16, right: 0)
                                Blank()
                                    .layoutWeight(1)
                                Checkbox()
                                    .select(this.themeSettings.scheduledDarkMode)
                                    .onChange({ isChecked: Bool => this.onScheduledDarkModeToggle(isChecked) })
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 12, bottom: 12)
                            .alignItems(VerticalAlign.Center)
                        }
                        .height(56)

                        // 深色开始时间
                        ListItem {
                            Row {
                                Text("🕐")
                                    .fontSize(20)
                                Text("深色开始时间")
                                    .fontSize(16)
                                    .fontColor(0x333333)
                                    .margin(top: 0, bottom: 0, left: 16, right: 0)
                                Blank()
                                    .layoutWeight(1)
                                Text(this.themeSettings.darkModeStartTime)
                                    .fontSize(16)
                                    .fontColor(0x999999)
                                Text(" >")
                                    .fontSize(16)
                                    .fontColor(0x999999)
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 12, bottom: 12)
                            .alignItems(VerticalAlign.Center)
                            .onClick({ event => this.onDarkModeStartTimeClick() })
                        }
                        .height(56)

                        // 深色结束时间
                        ListItem {
                            Row {
                                Text("🕑")
                                    .fontSize(20)
                                Text("深色结束时间")
                                    .fontSize(16)
                                    .fontColor(0x333333)
                                    .margin(top: 0, bottom: 0, left: 16, right: 0)
                                Blank()
                                    .layoutWeight(1)
                                Text(this.themeSettings.darkModeEndTime)
                                    .fontSize(16)
                                    .fontColor(0x999999)
                                Text(" >")
                                    .fontSize(16)
                                    .fontColor(0x999999)
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 12, bottom: 12)
                            .alignItems(VerticalAlign.Center)
                            .onClick({ event => this.onDarkModeEndTimeClick() })
                        }
                        .height(56)
                    }
                    .width(100.percent)
                    .divider(strokeWidth: 1, color: 0xEEEEEE, startMargin: 56, endMargin: 0)

                    // 分组：外观
                    List {
                        // 强调色
                        ListItem {
                            Row {
                                Text("🔴")
                                    .fontSize(20)
                                Text("强调色")
                                    .fontSize(16)
                                    .fontColor(0x333333)
                                    .margin(top: 0, bottom: 0, left: 16, right: 0)
                                Blank()
                                    .layoutWeight(1)
                                // 强调色色块
                                Row {
                                    Blank()
                                        .width(20)
                                        .height(20)
                                        .backgroundColor(ACCENT_COLORS[0])
                                        .borderRadius(4)
                                        .margin(right: 4)
                                        .onClick({ event => this.onAccentColorClick(0) })
                                    Blank()
                                        .width(20)
                                        .height(20)
                                        .backgroundColor(ACCENT_COLORS[1])
                                        .borderRadius(4)
                                        .margin(right: 4)
                                        .onClick({ event => this.onAccentColorClick(1) })
                                    Blank()
                                        .width(20)
                                        .height(20)
                                        .backgroundColor(ACCENT_COLORS[2])
                                        .borderRadius(4)
                                        .margin(right: 4)
                                        .onClick({ event => this.onAccentColorClick(2) })
                                    Blank()
                                        .width(20)
                                        .height(20)
                                        .backgroundColor(ACCENT_COLORS[3])
                                        .borderRadius(4)
                                        .margin(right: 4)
                                        .onClick({ event => this.onAccentColorClick(3) })
                                    Blank()
                                        .width(20)
                                        .height(20)
                                        .backgroundColor(ACCENT_COLORS[4])
                                        .borderRadius(4)
                                        .margin(right: 4)
                                        .onClick({ event => this.onAccentColorClick(4) })
                                    Blank()
                                        .width(20)
                                        .height(20)
                                        .backgroundColor(ACCENT_COLORS[5])
                                        .borderRadius(4)
                                        .margin(right: 4)
                                        .onClick({ event => this.onAccentColorClick(5) })
                                }
                                Text(" >")
                                    .fontSize(16)
                                    .fontColor(0x999999)
                                    .margin(left: 8)
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 12, bottom: 12)
                            .alignItems(VerticalAlign.Center)
                        }
                        .height(56)

                        // 聊天背景
                        ListItem {
                            Row {
                                Text("🖼️")
                                    .fontSize(20)
                                Text("聊天背景")
                                    .fontSize(16)
                                    .fontColor(0x333333)
                                    .margin(top: 0, bottom: 0, left: 16, right: 0)
                                Blank()
                                    .layoutWeight(1)
                                // 背景预览缩略图
                                Blank()
                                    .width(40)
                                    .height(24)
                                    .backgroundColor(0xE0E0E0)
                                    .borderRadius(4)
                                    .margin(right: 8)
                                Text(" >")
                                    .fontSize(16)
                                    .fontColor(0x999999)
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 12, bottom: 12)
                            .alignItems(VerticalAlign.Center)
                            .onClick({ event => this.onChatBackgroundClick() })
                        }
                        .height(56)

                        // 表情主题
                        ListItem {
                            Row {
                                Text("😊")
                                    .fontSize(20)
                                Text("表情主题")
                                    .fontSize(16)
                                    .fontColor(0x333333)
                                    .margin(top: 0, bottom: 0, left: 16, right: 0)
                                Blank()
                                    .layoutWeight(1)
                                // 表情预览缩略图
                                Blank()
                                    .width(40)
                                    .height(24)
                                    .backgroundColor(0xE0E0E0)
                                    .borderRadius(4)
                                    .margin(right: 8)
                                Text(" >")
                                    .fontSize(16)
                                    .fontColor(0x999999)
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 12, bottom: 12)
                            .alignItems(VerticalAlign.Center)
                            .onClick({ event => this.onEmojiThemeClick() })
                        }
                        .height(56)
                    }
                    .width(100.percent)
                    .divider(strokeWidth: 1, color: 0xEEEEEE, startMargin: 56, endMargin: 0)

                    // 分组：显示
                    List {
                        // 字体大小
                        ListItem {
                            Column {
                                Row {
                                    Text("📏")
                                        .fontSize(20)
                                    Text("字体大小")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                        .margin(top: 0, bottom: 0, left: 16, right: 0)
                                    Blank()
                                        .layoutWeight(1)
                                }
                                .alignItems(VerticalAlign.Center)

                                // 字体大小显示
                                Row {
                                    Text("A-")
                                        .fontSize(14)
                                        .fontColor(0x333333)
                                        .onClick({ event => this.onFontSizeDecrease() })
                                    Blank()
                                        .layoutWeight(1)
                                    Text("${this.themeSettings.fontSize}")
                                        .fontSize(14)
                                        .fontColor(0x333333)
                                    Blank()
                                        .layoutWeight(1)
                                    Text("A+")
                                        .fontSize(14)
                                        .fontColor(0x333333)
                                        .onClick({ event => this.onFontSizeIncrease() })
                                }
                                .margin(top: 8)
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 12, bottom: 12)
                        }
                        .height(80)
                    }
                    .width(100.percent)
                    .divider(strokeWidth: 1, color: 0xEEEEEE, startMargin: 56, endMargin: 0)
                }
                .width(100.percent)
            }
            .width(100.percent)
            .layoutWeight(1)
            .backgroundColor(0xF5F5F5)
        }
        .width(100.percent)
        .height(100.percent)
        .backgroundColor(0xFFFFFF)
    }
}
