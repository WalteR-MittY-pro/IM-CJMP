package ohos_app_cangjie_entry.pages

internal import ohos.base.LengthProp
internal import ohos.component.*
internal import ohos.state_manage.LocalStorage
internal import ohos.state_manage.SubscriberManager
internal import ohos.state_manage.ObservedProperty
import ohos.state_macro_manage.Component
import ohos.state_macro_manage.State

// 隐私设置数据模型
public class PrivacySettings {
    public var twoStepVerification: Bool
    public var activeDevices: Int64
    public var blockedUsers: Int64
    public var lastSeenVisibility: String
    public var avatarVisibility: String
    public var callPermission: String
    public var forwardPermission: String
    public var autoDelete: String
    public var paymentMethods: String

    public init(twoStepVerification: Bool, activeDevices: Int64, blockedUsers: Int64,
                lastSeenVisibility: String, avatarVisibility: String, callPermission: String,
                forwardPermission: String, autoDelete: String, paymentMethods: String) {
        this.twoStepVerification = twoStepVerification
        this.activeDevices = activeDevices
        this.blockedUsers = blockedUsers
        this.lastSeenVisibility = lastSeenVisibility
        this.avatarVisibility = avatarVisibility
        this.callPermission = callPermission
        this.forwardPermission = forwardPermission
        this.autoDelete = autoDelete
        this.paymentMethods = paymentMethods
    }

    public static func getDefault(): PrivacySettings {
        return PrivacySettings(false, 1, 0, "所有人", "联系人", "所有人", "所有人", "关闭", ">")
    }
}

// 隐私与安全详情页
@Component
public class PrivacySecurityPage {
    // 返回回调
    var onBack: () -> Unit = { => }

    // 隐私设置数据
    @State
    var privacySettings: PrivacySettings = PrivacySettings.getDefault()

    // 两步验证开关状态
    @State
    var isTwoStepEnabled: Bool = false

    // 返回上一页
    func onBackClick() {
        this.onBack()
    }

    // 切换两步验证
    func onTwoStepToggle(isOn: Bool) {
        this.isTwoStepEnabled = isOn
        this.privacySettings.twoStepVerification = isOn
    }

    // 点击最后上线时间
    func onLastSeenClick() {
        // TODO: 跳转到最后上线时间设置
    }

    // 点击头像可见性
    func onAvatarVisibilityClick() {
        // TODO: 跳转到头像可见性设置
    }

    // 点击来电许可
    func onCallPermissionClick() {
        // TODO: 跳转到来电许可设置
    }

    // 点击转发消息
    func onForwardClick() {
        // TODO: 跳转到转发消息设置
    }

    // 点击自动删除
    func onAutoDeleteClick() {
        // TODO: 跳转到自动删除设置
    }

    // 点击已保存的付款方式
    func onPaymentMethodsClick() {
        // TODO: 跳转到付款方式设置
    }

    // 点击活跃设备
    func onActiveDevicesClick() {
        // TODO: 跳转到活跃设备列表
    }

    // 点击黑名单
    func onBlockedUsersClick() {
        // TODO: 跳转到黑名单管理
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
                Text("隐私与安全")
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
                    // ========== 安全分组 ==========
                    // 分组标题
                    Text("安全")
                        .fontSize(14)
                        .fontColor(0x999999)
                        .width(100.percent)
                        .padding(left: 16, right: 16, top: 16, bottom: 8)

                    // 安全分组内容 - 使用List包裹ListItem
                    List {
                        // 密码 - 两步验证
                        ListItem {
                            Row {
                                // 左侧图标和文字
                                Row {
                                    Text("\u{1F510}")  // 🔐
                                        .fontSize(20)
                                    Column {
                                        Text("密码")
                                            .fontSize(16)
                                            .fontColor(0x333333)
                                        Text("启用两步验证")
                                            .fontSize(12)
                                            .fontColor(0x999999)
                                    }
                                    .margin(left: 12)
                                    .alignItems(HorizontalAlign.Start)
                                }
                                .alignItems(VerticalAlign.Center)

                                // 右侧Toggle开关
                                Blank()
                                    .layoutWeight(1)
                                Checkbox()
                                    .select(this.isTwoStepEnabled)
                                    .onChange({ isChecked: Bool => this.onTwoStepToggle(isChecked) })
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 12, bottom: 12)
                            .alignItems(VerticalAlign.Center)
                        }
                        .height(56)

                        // 活跃设备
                        ListItem {
                            Row {
                                Text("\u{1F4F1}")  // 📱
                                    .fontSize(20)
                                Text("活跃设备")
                                    .fontSize(16)
                                    .fontColor(0x333333)
                                    .margin(left: 12)
                                Blank()
                                    .layoutWeight(1)
                                Text("Mac (本设备)")
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
                        .onClick({ event => this.onActiveDevicesClick() })

                        // 黑名单
                        ListItem {
                            Row {
                                Text("\u{1F6AB}")  // 🚫
                                    .fontSize(20)
                                Column {
                                    Text("黑名单")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("已封锁的用户")
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
                        .onClick({ event => this.onBlockedUsersClick() })
                    }
                    .width(100.percent)
                    .divider(strokeWidth: 1, color: 0xEEEEEE, startMargin: 16, endMargin: 0)
                    .backgroundColor(0xFFFFFF)
                    .margin(bottom: 16)

                    // ========== 隐私设置分组 ==========
                    // 分组标题
                    Text("隐私设置")
                        .fontSize(14)
                        .fontColor(0x999999)
                        .width(100.percent)
                        .padding(left: 16, right: 16, top: 8, bottom: 8)

                    // 隐私设置分组内容
                    List {
                        // 最后上线时间
                        ListItem {
                            Row {
                                Text("\u{1F441}")  // 👁
                                    .fontSize(20)
                                Column {
                                    Text("最后上线时间")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("谁可以看到")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 12)
                                .alignItems(HorizontalAlign.Start)
                                Blank()
                                    .layoutWeight(1)
                                Text(this.privacySettings.lastSeenVisibility)
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
                        .onClick({ event => this.onLastSeenClick() })

                        // 头像可见性
                        ListItem {
                            Row {
                                Text("\u{1F5BC}")  // 🖼
                                    .fontSize(20)
                                Column {
                                    Text("头像可见性")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("谁可以看到")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 12)
                                .alignItems(HorizontalAlign.Start)
                                Blank()
                                    .layoutWeight(1)
                                Text(this.privacySettings.avatarVisibility)
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
                        .onClick({ event => this.onAvatarVisibilityClick() })

                        // 来电许可
                        ListItem {
                            Row {
                                Text("\u{1F4DE}")  // 📞
                                    .fontSize(20)
                                Column {
                                    Text("来电许可")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("谁可以来电")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 12)
                                .alignItems(HorizontalAlign.Start)
                                Blank()
                                    .layoutWeight(1)
                                Text(this.privacySettings.callPermission)
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
                        .onClick({ event => this.onCallPermissionClick() })

                        // 转发消息
                        ListItem {
                            Row {
                                Text("\u{2197}")  // ↗
                                    .fontSize(20)
                                Column {
                                    Text("转发消息")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("谁可以引用")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 12)
                                .alignItems(HorizontalAlign.Start)
                                Blank()
                                    .layoutWeight(1)
                                Text(this.privacySettings.forwardPermission)
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
                        .onClick({ event => this.onForwardClick() })
                    }
                    .width(100.percent)
                    .divider(strokeWidth: 1, color: 0xEEEEEE, startMargin: 16, endMargin: 0)
                    .backgroundColor(0xFFFFFF)
                    .margin(bottom: 16)

                    // ========== 数据设置分组 ==========
                    // 分组标题
                    Text("数据与账号")
                        .fontSize(14)
                        .fontColor(0x999999)
                        .width(100.percent)
                        .padding(left: 16, right: 16, top: 8, bottom: 8)

                    // 数据设置分组内容
                    List {
                        // 自动删除
                        ListItem {
                            Row {
                                Text("\u{1F5D1}")  // 🗑
                                    .fontSize(20)
                                Column {
                                    Text("自动删除")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("自动删除消息")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 12)
                                .alignItems(HorizontalAlign.Start)
                                Blank()
                                    .layoutWeight(1)
                                Text(this.privacySettings.autoDelete)
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
                        .onClick({ event => this.onAutoDeleteClick() })

                        // 已保存的付款方式
                        ListItem {
                            Row {
                                Text("\u{1F4B3}")  // 💳
                                    .fontSize(20)
                                Column {
                                    Text("已保存的付款方式")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("付款信息")
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
                        .onClick({ event => this.onPaymentMethodsClick() })
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
