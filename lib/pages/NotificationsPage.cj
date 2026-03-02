package ohos_app_cangjie_entry.pages

internal import ohos.base.LengthProp
internal import ohos.component.*
internal import ohos.state_manage.LocalStorage
internal import ohos.state_manage.SubscriberManager
internal import ohos.state_manage.ObservedProperty
import ohos.state_macro_manage.Component
import ohos.state_macro_manage.State

// 通知设置数据模型
public class NotificationSettings {
    public var messageNotification: Bool
    public var groupNotification: Bool
    public var privateNotification: Bool
    public var sound: String
    public var notificationSound: String
    public var vibration: String
    public var repeatPrompt: String
    public var showPreview: Bool
    public var notificationBanner: Bool
    public var exceptions: Int64

    public init(messageNotification: Bool, groupNotification: Bool, privateNotification: Bool,
                sound: String, notificationSound: String, vibration: String,
                repeatPrompt: String, showPreview: Bool, notificationBanner: Bool, exceptions: Int64) {
        this.messageNotification = messageNotification
        this.groupNotification = groupNotification
        this.privateNotification = privateNotification
        this.sound = sound
        this.notificationSound = notificationSound
        this.vibration = vibration
        this.repeatPrompt = repeatPrompt
        this.showPreview = showPreview
        this.notificationBanner = notificationBanner
        this.exceptions = exceptions
    }

    public static func getDefault(): NotificationSettings {
        return NotificationSettings(true, true, true, "默认", "默认", "默认", "1次", true, true, 0)
    }
}

// 通知详情页
@Component
public class NotificationsPage {
    // 返回回调
    var onBack: () -> Unit = { => }

    // 通知设置数据
    @State
    var notificationSettings: NotificationSettings = NotificationSettings.getDefault()

    // 返回上一页
    func onBackClick() {
        this.onBack()
    }

    // 切换消息通知
    func onMessageNotificationToggle(isOn: Bool) {
        this.notificationSettings.messageNotification = isOn
    }

    // 切换群组通知
    func onGroupNotificationToggle(isOn: Bool) {
        this.notificationSettings.groupNotification = isOn
    }

    // 切换私密通知
    func onPrivateNotificationToggle(isOn: Bool) {
        this.notificationSettings.privateNotification = isOn
    }

    // 切换显示预览
    func onShowPreviewToggle(isOn: Bool) {
        this.notificationSettings.showPreview = isOn
    }

    // 切换通知横幅
    func onNotificationBannerToggle(isOn: Bool) {
        this.notificationSettings.notificationBanner = isOn
    }

    // 点击声音
    func onSoundClick() {
        // TODO: 跳转到声音设置
    }

    // 点击通知音
    func onNotificationSoundClick() {
        // TODO: 跳转到通知音设置
    }

    // 点击振动
    func onVibrationClick() {
        // TODO: 跳转到振动设置
    }

    // 点击重复提示
    func onRepeatPromptClick() {
        // TODO: 跳转到重复提示设置
    }

    // 点击例外
    func onExceptionsClick() {
        // TODO: 跳转到例外设置
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
                Text("通知")
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
                    // ========== 通知分组 ==========
                    // 分组标题
                    Text("通知")
                        .fontSize(14)
                        .fontColor(0x999999)
                        .width(100.percent)
                        .padding(left: 16, right: 16, top: 16, bottom: 8)

                    // 通知分组内容
                    List {
                        // 消息通知
                        ListItem {
                            Row {
                                Text("\u{1F4F3}")  // 📳
                                    .fontSize(20)
                                Column {
                                    Text("消息通知")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("开启通知")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 12)
                                .alignItems(HorizontalAlign.Start)
                                Blank()
                                    .layoutWeight(1)
                                Checkbox()
                                    .select(this.notificationSettings.messageNotification)
                                    .onChange({ isChecked: Bool => this.onMessageNotificationToggle(isChecked) })
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 12, bottom: 12)
                            .alignItems(VerticalAlign.Center)
                        }
                        .height(56)

                        // 群组通知
                        ListItem {
                            Row {
                                Text("\u{1F465}")  // 👥
                                    .fontSize(20)
                                Column {
                                    Text("群组通知")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("群组消息")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 12)
                                .alignItems(HorizontalAlign.Start)
                                Blank()
                                    .layoutWeight(1)
                                Checkbox()
                                    .select(this.notificationSettings.groupNotification)
                                    .onChange({ isChecked: Bool => this.onGroupNotificationToggle(isChecked) })
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 12, bottom: 12)
                            .alignItems(VerticalAlign.Center)
                        }
                        .height(56)

                        // 私密通知
                        ListItem {
                            Row {
                                Text("\u{1F512}")  // 🔒
                                    .fontSize(20)
                                Column {
                                    Text("私密通知")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("私密聊天")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 12)
                                .alignItems(HorizontalAlign.Start)
                                Blank()
                                    .layoutWeight(1)
                                Checkbox()
                                    .select(this.notificationSettings.privateNotification)
                                    .onChange({ isChecked: Bool => this.onPrivateNotificationToggle(isChecked) })
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

                    // ========== 声音分组 ==========
                    // 分组标题
                    Text("声音")
                        .fontSize(14)
                        .fontColor(0x999999)
                        .width(100.percent)
                        .padding(left: 16, right: 16, top: 8, bottom: 8)

                    // 声音分组内容
                    List {
                        // 声音
                        ListItem {
                            Row {
                                Text("\u{1F50A}")  // 🔊
                                    .fontSize(20)
                                Column {
                                    Text("声音")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("消息声音")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 12)
                                .alignItems(HorizontalAlign.Start)
                                Blank()
                                    .layoutWeight(1)
                                Text(this.notificationSettings.sound)
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
                        .onClick({ event => this.onSoundClick() })

                        // 通知音
                        ListItem {
                            Row {
                                Text("\u{1F514}")  // 🔔
                                    .fontSize(20)
                                Column {
                                    Text("通知音")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("提示音")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 12)
                                .alignItems(HorizontalAlign.Start)
                                Blank()
                                    .layoutWeight(1)
                                Text(this.notificationSettings.notificationSound)
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
                        .onClick({ event => this.onNotificationSoundClick() })
                    }
                    .width(100.percent)
                    .divider(strokeWidth: 1, color: 0xEEEEEE, startMargin: 16, endMargin: 0)
                    .backgroundColor(0xFFFFFF)
                    .margin(bottom: 16)

                    // ========== 振动分组 ==========
                    // 分组标题
                    Text("振动")
                        .fontSize(14)
                        .fontColor(0x999999)
                        .width(100.percent)
                        .padding(left: 16, right: 16, top: 8, bottom: 8)

                    // 振动分组内容
                    List {
                        // 振动
                        ListItem {
                            Row {
                                Text("\u{1F4F3}")  // 📳
                                    .fontSize(20)
                                Column {
                                    Text("振动")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("消息振动")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 12)
                                .alignItems(HorizontalAlign.Start)
                                Blank()
                                    .layoutWeight(1)
                                Text(this.notificationSettings.vibration)
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
                        .onClick({ event => this.onVibrationClick() })

                        // 重复提示
                        ListItem {
                            Row {
                                Text("\u{1F501}")  // 🔁
                                    .fontSize(20)
                                Column {
                                    Text("重复提示")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("通知次数")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 12)
                                .alignItems(HorizontalAlign.Start)
                                Blank()
                                    .layoutWeight(1)
                                Text(this.notificationSettings.repeatPrompt)
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
                        .onClick({ event => this.onRepeatPromptClick() })
                    }
                    .width(100.percent)
                    .divider(strokeWidth: 1, color: 0xEEEEEE, startMargin: 16, endMargin: 0)
                    .backgroundColor(0xFFFFFF)
                    .margin(bottom: 16)

                    // ========== 显示分组 ==========
                    // 分组标题
                    Text("显示")
                        .fontSize(14)
                        .fontColor(0x999999)
                        .width(100.percent)
                        .padding(left: 16, right: 16, top: 8, bottom: 8)

                    // 显示分组内容
                    List {
                        // 显示预览
                        ListItem {
                            Row {
                                Text("\u{1F5C4}")  // 🖄
                                    .fontSize(20)
                                Column {
                                    Text("显示预览")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("锁屏显示内容")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 12)
                                .alignItems(HorizontalAlign.Start)
                                Blank()
                                    .layoutWeight(1)
                                Checkbox()
                                    .select(this.notificationSettings.showPreview)
                                    .onChange({ isChecked: Bool => this.onShowPreviewToggle(isChecked) })
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 12, bottom: 12)
                            .alignItems(VerticalAlign.Center)
                        }
                        .height(56)

                        // 通知横幅
                        ListItem {
                            Row {
                                Text("\u{1F4F1}")  // 📱
                                    .fontSize(20)
                                Column {
                                    Text("通知横幅")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("显示详情")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 12)
                                .alignItems(HorizontalAlign.Start)
                                Blank()
                                    .layoutWeight(1)
                                Checkbox()
                                    .select(this.notificationSettings.notificationBanner)
                                    .onChange({ isChecked: Bool => this.onNotificationBannerToggle(isChecked) })
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

                    // ========== 例外分组 ==========
                    // 分组标题
                    Text("例外")
                        .fontSize(14)
                        .fontColor(0x999999)
                        .width(100.percent)
                        .padding(left: 16, right: 16, top: 8, bottom: 8)

                    // 例外分组内容
                    List {
                        // 例外
                        ListItem {
                            Row {
                                Text("\u{26A0}")  // ⚠
                                    .fontSize(20)
                                Column {
                                    Text("例外")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("自定义通知")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 12)
                                .alignItems(HorizontalAlign.Start)
                                Blank()
                                    .layoutWeight(1)
                                if (this.notificationSettings.exceptions > 0) {
                                    Text("${this.notificationSettings.exceptions}")
                                        .fontSize(14)
                                        .fontColor(0x999999)
                                }
                                Text(" >")
                                    .fontSize(16)
                                    .fontColor(0x999999)
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 12, bottom: 12)
                            .alignItems(VerticalAlign.Center)
                        }
                        .height(56)
                        .onClick({ event => this.onExceptionsClick() })
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
