package ohos_app_cangjie_entry.pages

internal import ohos.base.LengthProp
internal import ohos.component.*
internal import ohos.state_manage.LocalStorage
internal import ohos.state_manage.SubscriberManager
internal import ohos.state_manage.ObservedProperty
import ohos.state_macro_manage.Component
import ohos.state_macro_manage.State

// 设备信息数据模型
public class DeviceInfo {
    public var name: String
    public var description: String
    public var lastActive: String
    public var isCurrentDevice: Bool

    public init(name: String, description: String, lastActive: String, isCurrentDevice: Bool) {
        this.name = name
        this.description = description
        this.lastActive = lastActive
        this.isCurrentDevice = isCurrentDevice
    }
}

// 设备设置数据模型
public class DevicesSettings {
    public var currentDevice: DeviceInfo
    public var devices: Array<DeviceInfo>
    public var telegramXEnabled: Bool

    public init(currentDevice: DeviceInfo, devices: Array<DeviceInfo>, telegramXEnabled: Bool) {
        this.currentDevice = currentDevice
        this.devices = devices
        this.telegramXEnabled = telegramXEnabled
    }

    public static func getDefault(): DevicesSettings {
        let current = DeviceInfo("Mac (本设备)", "Chrome 120.0", "当前使用", true)
        let deviceList = [
            DeviceInfo("iPhone 14 Pro", "Telegram iOS", "2分钟前", false),
            DeviceInfo("Windows PC", "Telegram Desktop", "昨天", false),
            DeviceInfo("iPad Pro", "Telegram iPadOS", "3天前", false)
        ]
        return DevicesSettings(current, deviceList, false)
    }
}

// 设备详情页
@Component
public class DevicesPage {
    // 返回回调
    var onBack: () -> Unit = { => }

    // 设备设置数据
    @State
    var devicesSettings: DevicesSettings = DevicesSettings.getDefault()

    // 返回上一页
    func onBackClick() {
        this.onBack()
    }

    // 切换 Telegram X
    func onTelegramXToggle(isOn: Bool) {
        this.devicesSettings.telegramXEnabled = isOn
    }

    // 点击链接设备
    func onLinkDeviceClick() {
        // TODO: 跳转到二维码扫描页面
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
                Text("设备")
                    .fontSize(18)
                    .fontColor(0x333333)
                    .fontWeight(FontWeight.Medium)
                    .layoutWeight(1)
                    .textAlign(TextAlign.Center)
            }
            .width(100.percent)
            .height(48)
            .padding(left: 16, right: 16)
            .backgroundColor(0xFFFFFF)
            .alignItems(VerticalAlign.Center)

            // 滚动内容区域 - 紧贴导航栏
            Scroll {
                Column {
                    // ========== 当前设备分组 ==========
                    // 分组标题
                    Text("当前设备")
                        .fontSize(14)
                        .fontColor(0x999999)
                        .width(100.percent)
                        .padding(left: 16, right: 16, top: 16, bottom: 8)

                    // 当前设备内容
                    List {
                        ListItem {
                            Row {
                                // 绿色勾选标记
                                Text("✅")
                                    .fontSize(20)
                                Column {
                                    Text(this.devicesSettings.currentDevice.name)
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text(this.devicesSettings.currentDevice.description)
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 12)
                                .alignItems(HorizontalAlign.Start)
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 12, bottom: 12)
                            .alignItems(VerticalAlign.Center)
                        }
                        .height(64)
                    }
                    .width(100.percent)
                    .divider(strokeWidth: 1, color: 0xEEEEEE, startMargin: 16, endMargin: 0)
                    .backgroundColor(0xFFFFFF)
                    .margin(bottom: 16)

                    // ========== 已登录设备分组 ==========
                    // 分组标题
                    Text("已登录设备")
                        .fontSize(14)
                        .fontColor(0x999999)
                        .width(100.percent)
                        .padding(left: 16, right: 16, top: 8, bottom: 8)

                    // 已登录设备列表 - iPhone 14 Pro
                    List {
                        ListItem {
                            Row {
                                Text("📱")
                                    .fontSize(20)
                                Column {
                                    Text("iPhone 14 Pro")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("2分钟前")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 12)
                                .alignItems(HorizontalAlign.Start)
                                Blank()
                                    .layoutWeight(1)
                                Text("终止")
                                    .fontSize(14)
                                    .fontColor(0xF44336)
                                    .padding(left: 12, right: 12, top: 6, bottom: 6)
                                    .borderRadius(4)
                                    .borderWidth(1)
                                    .borderColor(0xF44336)
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 12, bottom: 12)
                            .alignItems(VerticalAlign.Center)
                        }
                        .height(64)
                    }
                    .width(100.percent)
                    .divider(strokeWidth: 1, color: 0xEEEEEE, startMargin: 16, endMargin: 0)
                    .backgroundColor(0xFFFFFF)

                    // Windows PC
                    List {
                        ListItem {
                            Row {
                                Text("💻")
                                    .fontSize(20)
                                Column {
                                    Text("Windows PC")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("昨天")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 12)
                                .alignItems(HorizontalAlign.Start)
                                Blank()
                                    .layoutWeight(1)
                                Text("终止")
                                    .fontSize(14)
                                    .fontColor(0xF44336)
                                    .padding(left: 12, right: 12, top: 6, bottom: 6)
                                    .borderRadius(4)
                                    .borderWidth(1)
                                    .borderColor(0xF44336)
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 12, bottom: 12)
                            .alignItems(VerticalAlign.Center)
                        }
                        .height(64)
                    }
                    .width(100.percent)
                    .divider(strokeWidth: 1, color: 0xEEEEEE, startMargin: 16, endMargin: 0)
                    .backgroundColor(0xFFFFFF)

                    // iPad Pro
                    List {
                        ListItem {
                            Row {
                                Text("📲")
                                    .fontSize(20)
                                Column {
                                    Text("iPad Pro")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("3天前")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 12)
                                .alignItems(HorizontalAlign.Start)
                                Blank()
                                    .layoutWeight(1)
                                Text("终止")
                                    .fontSize(14)
                                    .fontColor(0xF44336)
                                    .padding(left: 12, right: 12, top: 6, bottom: 6)
                                    .borderRadius(4)
                                    .borderWidth(1)
                                    .borderColor(0xF44336)
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 12, bottom: 12)
                            .alignItems(VerticalAlign.Center)
                        }
                        .height(64)
                    }
                    .width(100.percent)
                    .divider(strokeWidth: 1, color: 0xEEEEEE, startMargin: 16, endMargin: 0)
                    .backgroundColor(0xFFFFFF)
                    .margin(bottom: 16)

                    // ========== 链接设备 ==========
                    List {
                        ListItem {
                            Row {
                                Text("🔗")
                                    .fontSize(20)
                                Column {
                                    Text("链接设备")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("扫描二维码登录")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 12)
                                .alignItems(HorizontalAlign.Start)
                                Blank()
                                    .layoutWeight(1)
                                Text(">")
                                    .fontSize(16)
                                    .fontColor(0x999999)
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 12, bottom: 12)
                            .alignItems(VerticalAlign.Center)
                        }
                        .height(56)
                        .onClick({ event => this.onLinkDeviceClick() })
                    }
                    .width(100.percent)
                    .divider(strokeWidth: 1, color: 0xEEEEEE, startMargin: 16, endMargin: 0)
                    .backgroundColor(0xFFFFFF)
                    .margin(bottom: 16)

                    // ========== Telegram X ==========
                    List {
                        ListItem {
                            Row {
                                Text("🧪")
                                    .fontSize(20)
                                Column {
                                    Text("Telegram X")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("实验性功能")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 12)
                                .alignItems(HorizontalAlign.Start)
                                Blank()
                                    .layoutWeight(1)
                                Checkbox()
                                    .select(this.devicesSettings.telegramXEnabled)
                                    .onChange({ isChecked: Bool => this.onTelegramXToggle(isChecked) })
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
        .backgroundColor(0xFFFFFF)
    }
}
