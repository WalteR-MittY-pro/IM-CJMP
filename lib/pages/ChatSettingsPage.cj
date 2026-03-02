package ohos_app_cangjie_entry.pages

internal import ohos.base.LengthProp
internal import ohos.component.*
internal import ohos.state_manage.LocalStorage
internal import ohos.state_manage.SubscriberManager
internal import ohos.state_manage.ObservedProperty
import ohos.state_macro_manage.Component
import ohos.state_macro_manage.State

// 聊天设置数据模型
public class ChatSettings {
    // 自动下载
    public var autoDownloadMobile: Bool
    public var autoDownloadWifi: Bool
    public var autoDownloadRoaming: Bool
    // 存储
    public var storageUsage: String
    public var autoDeleteMedia: String
    // 聊天设置
    public var sendTyping: Bool
    public var sendReadReceipt: Bool
    public var emojiAnimation: Bool
    public var chatBackground: String
    public var stickers: Bool

    public init(autoDownloadMobile: Bool, autoDownloadWifi: Bool, autoDownloadRoaming: Bool,
                storageUsage: String, autoDeleteMedia: String,
                sendTyping: Bool, sendReadReceipt: Bool, emojiAnimation: Bool,
                chatBackground: String, stickers: Bool) {
        this.autoDownloadMobile = autoDownloadMobile
        this.autoDownloadWifi = autoDownloadWifi
        this.autoDownloadRoaming = autoDownloadRoaming
        this.storageUsage = storageUsage
        this.autoDeleteMedia = autoDeleteMedia
        this.sendTyping = sendTyping
        this.sendReadReceipt = sendReadReceipt
        this.emojiAnimation = emojiAnimation
        this.chatBackground = chatBackground
        this.stickers = stickers
    }

    public static func getDefault(): ChatSettings {
        return ChatSettings(true, true, false, "256MB", "从不", true, true, true, "默认", true)
    }
}

// 聊天设置详情页
@Component
public class ChatSettingsPage {
    // 返回回调
    var onBack: () -> Unit = { => }

    // 聊天设置数据
    @State
    var chatSettings: ChatSettings = ChatSettings.getDefault()

    // 返回上一页
    func onBackClick() {
        this.onBack()
    }

    // 切换移动网络自动下载
    func onMobileAutoDownloadToggle(isOn: Bool) {
        this.chatSettings.autoDownloadMobile = isOn
    }

    // 切换WiFi自动下载
    func onWifiAutoDownloadToggle(isOn: Bool) {
        this.chatSettings.autoDownloadWifi = isOn
    }

    // 切换漫游自动下载
    func onRoamingAutoDownloadToggle(isOn: Bool) {
        this.chatSettings.autoDownloadRoaming = isOn
    }

    // 点击存储使用情况
    func onStorageUsageClick() {
        // TODO: 跳转到存储使用情况详情
    }

    // 点击自动删除到期媒体
    func onAutoDeleteMediaClick() {
        // TODO: 跳转到自动删除设置
    }

    // 切换发送正在输入
    func onSendTypingToggle(isOn: Bool) {
        this.chatSettings.sendTyping = isOn
    }

    // 切换发送读写状态
    func onSendReadReceiptToggle(isOn: Bool) {
        this.chatSettings.sendReadReceipt = isOn
    }

    // 切换表情符号
    func onEmojiAnimationToggle(isOn: Bool) {
        this.chatSettings.emojiAnimation = isOn
    }

    // 点击聊天背景
    func onChatBackgroundClick() {
        // TODO: 跳转到聊天背景设置
    }

    // 切换贴纸
    func onStickersToggle(isOn: Bool) {
        this.chatSettings.stickers = isOn
    }

    func build() {
        Column {
            // 顶部导航栏
            Row {
                // 返回按钮
                Row {
                    Text("<")
                        .fontSize(20)
                        .fontColor(0x333333)
                        .fontWeight(FontWeight.Bold)
                    Text("返回")
                        .fontSize(16)
                        .fontColor(0x333333)
                        .margin(left: 4)
                }
                .onClick({ event => this.onBackClick() })
                .alignItems(VerticalAlign.Center)

                // 标题
                Text("聊天")
                    .fontSize(18)
                    .fontColor(0x333333)
                    .fontWeight(FontWeight.Medium)
                    .layoutWeight(1)
                    .textAlign(TextAlign.Center)
            }
            .width(100.percent)
            .height(48)
            .padding(left: 16, right: 16, top: 0, bottom: 0)
            .backgroundColor(0xFFFFFF)
            .alignItems(VerticalAlign.Center)

            // 滚动内容区域
            Scroll {
                Column {
                    // ========== 自动下载分组 ==========
                    // 分组标题
                    Text("自动下载")
                        .fontSize(14)
                        .fontColor(0x999999)
                        .width(100.percent)
                        .padding(left: 16, right: 16, top: 16, bottom: 8)

                    // 自动下载分组内容
                    List {
                        // 使用移动网络时
                        ListItem {
                            Row {
                                Text("\u{1F4F7}")  // 📷
                                    .fontSize(20)
                                Column {
                                    Text("使用移动网络时")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("自动下载图片")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 12)
                                .alignItems(HorizontalAlign.Start)
                                Blank()
                                    .layoutWeight(1)
                                Checkbox()
                                    .select(this.chatSettings.autoDownloadMobile)
                                    .onChange({ isChecked: Bool => this.onMobileAutoDownloadToggle(isChecked) })
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 12, bottom: 12)
                            .alignItems(VerticalAlign.Center)
                        }
                        .height(56)

                        // 使用WiFi时
                        ListItem {
                            Row {
                                Text("\u{1F3AC}")  // 🎬
                                    .fontSize(20)
                                Column {
                                    Text("使用WiFi时")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("自动下载视频")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 12)
                                .alignItems(HorizontalAlign.Start)
                                Blank()
                                    .layoutWeight(1)
                                Checkbox()
                                    .select(this.chatSettings.autoDownloadWifi)
                                    .onChange({ isChecked: Bool => this.onWifiAutoDownloadToggle(isChecked) })
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 12, bottom: 12)
                            .alignItems(VerticalAlign.Center)
                        }
                        .height(56)

                        // 漫游时
                        ListItem {
                            Row {
                                Text("\u{1F310}")  // 🌐
                                    .fontSize(20)
                                Column {
                                    Text("漫游时")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("自动下载文件")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 12)
                                .alignItems(HorizontalAlign.Start)
                                Blank()
                                    .layoutWeight(1)
                                Checkbox()
                                    .select(this.chatSettings.autoDownloadRoaming)
                                    .onChange({ isChecked: Bool => this.onRoamingAutoDownloadToggle(isChecked) })
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 12, bottom: 12)
                            .alignItems(VerticalAlign.Center)
                        }
                        .height(56)
                    }
                    .width(100.percent)
                    .divider(strokeWidth: 1, color: 0xEEEEEE, startMargin: 16, endMargin: 0)
                    .backgroundColor(0xFFFFFF)
                    .margin(bottom: 16)

                    // ========== 存储分组 ==========
                    // 分组标题
                    Text("存储")
                        .fontSize(14)
                        .fontColor(0x999999)
                        .width(100.percent)
                        .padding(left: 16, right: 16, top: 8, bottom: 8)

                    // 存储分组内容
                    List {
                        // 存储使用情况
                        ListItem {
                            Row {
                                Text("\u{1F4BE}")  // 💾
                                    .fontSize(20)
                                Column {
                                    Text("存储使用情况")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("缓存大小")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 12)
                                .alignItems(HorizontalAlign.Start)
                                Blank()
                                    .layoutWeight(1)
                                Text(this.chatSettings.storageUsage)
                                    .fontSize(14)
                                    .fontColor(0x999999)
                                Text(" >")
                                    .fontSize(16)
                                    .fontColor(0x999999)
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 12, bottom: 12)
                            .alignItems(VerticalAlign.Center)
                        }
                        .height(56)
                        .onClick({ event => this.onStorageUsageClick() })

                        // 自动删除到期媒体
                        ListItem {
                            Row {
                                Text("\u{1F5D1}")  // 🗑
                                    .fontSize(20)
                                Column {
                                    Text("自动删除到期媒体")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("清理策略")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 12)
                                .alignItems(HorizontalAlign.Start)
                                Blank()
                                    .layoutWeight(1)
                                Text(this.chatSettings.autoDeleteMedia)
                                    .fontSize(14)
                                    .fontColor(0x999999)
                                Text(" >")
                                    .fontSize(16)
                                    .fontColor(0x999999)
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 12, bottom: 12)
                            .alignItems(VerticalAlign.Center)
                        }
                        .height(56)
                        .onClick({ event => this.onAutoDeleteMediaClick() })
                    }
                    .width(100.percent)
                    .divider(strokeWidth: 1, color: 0xEEEEEE, startMargin: 16, endMargin: 0)
                    .backgroundColor(0xFFFFFF)
                    .margin(bottom: 16)

                    // ========== 聊天设置分组 ==========
                    // 分组标题
                    Text("聊天设置")
                        .fontSize(14)
                        .fontColor(0x999999)
                        .width(100.percent)
                        .padding(left: 16, right: 16, top: 8, bottom: 8)

                    // 聊天设置分组内容
                    List {
                        // 发送正在输入
                        ListItem {
                            Row {
                                Text("\u{270D}")  // ✍
                                    .fontSize(20)
                                Column {
                                    Text("发送正在输入")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("显示正在输入状态")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 12)
                                .alignItems(HorizontalAlign.Start)
                                Blank()
                                    .layoutWeight(1)
                                Checkbox()
                                    .select(this.chatSettings.sendTyping)
                                    .onChange({ isChecked: Bool => this.onSendTypingToggle(isChecked) })
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 12, bottom: 12)
                            .alignItems(VerticalAlign.Center)
                        }
                        .height(56)

                        // 发送读写状态
                        ListItem {
                            Row {
                                Text("\u{1F441}")  // 👁
                                    .fontSize(20)
                                Column {
                                    Text("发送读写状态")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("已读回执")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 12)
                                .alignItems(HorizontalAlign.Start)
                                Blank()
                                    .layoutWeight(1)
                                Checkbox()
                                    .select(this.chatSettings.sendReadReceipt)
                                    .onChange({ isChecked: Bool => this.onSendReadReceiptToggle(isChecked) })
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 12, bottom: 12)
                            .alignItems(VerticalAlign.Center)
                        }
                        .height(56)

                        // 表情符号
                        ListItem {
                            Row {
                                Text("\u{1F60A}")  // 😊
                                    .fontSize(20)
                                Column {
                                    Text("表情符号")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("动态表情包")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 12)
                                .alignItems(HorizontalAlign.Start)
                                Blank()
                                    .layoutWeight(1)
                                Checkbox()
                                    .select(this.chatSettings.emojiAnimation)
                                    .onChange({ isChecked: Bool => this.onEmojiAnimationToggle(isChecked) })
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 12, bottom: 12)
                            .alignItems(VerticalAlign.Center)
                        }
                        .height(56)

                        // 聊天背景
                        ListItem {
                            Row {
                                Text("\u{1F5BC}")  // 🖼
                                    .fontSize(20)
                                Column {
                                    Text("聊天背景")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("背景图片")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 12)
                                .alignItems(HorizontalAlign.Start)
                                Blank()
                                    .layoutWeight(1)
                                // 预览图
                                Column {
                                    Text("图")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .width(40)
                                .height(30)
                                .backgroundColor(0xEEEEEE)
                                .borderRadius(4)
                                .justifyContent(FlexAlign.Center)
                                .alignItems(HorizontalAlign.Center)
                                .margin(right: 8)
                                Text(" >")
                                    .fontSize(16)
                                    .fontColor(0x999999)
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 12, bottom: 12)
                            .alignItems(VerticalAlign.Center)
                        }
                        .height(56)
                        .onClick({ event => this.onChatBackgroundClick() })

                        // 贴纸
                        ListItem {
                            Row {
                                Text("\u{1F4CC}")  // 📌
                                    .fontSize(20)
                                Column {
                                    Text("贴纸")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("发送贴纸")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 12)
                                .alignItems(HorizontalAlign.Start)
                                Blank()
                                    .layoutWeight(1)
                                Checkbox()
                                    .select(this.chatSettings.stickers)
                                    .onChange({ isChecked: Bool => this.onStickersToggle(isChecked) })
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 12, bottom: 12)
                            .alignItems(VerticalAlign.Center)
                        }
                        .height(56)
                    }
                    .width(100.percent)
                    .divider(strokeWidth: 1, color: 0xEEEEEE, startMargin: 16, endMargin: 0)
                    .backgroundColor(0xFFFFFF)
                }
                .width(100.percent)
            }
            .width(100.percent)
            .layoutWeight(1)
            .backgroundColor(0xF5F5F5)
        }
        .width(100.percent)
        .height(100.percent)
        .backgroundColor(0xF5F5F5)
    }
}
