package ohos_app_cangjie_entry.pages

internal import ohos.base.LengthProp
internal import ohos.component.*
internal import ohos.state_manage.LocalStorage
internal import ohos.state_manage.SubscriberManager
internal import ohos.state_manage.ObservedProperty
import ohos.state_macro_manage.Component
import ohos.state_macro_manage.State

// 个人资料数据模型
public class ProfileData {
    public var username: String
    public var phone: String
    public var bio: String
    public var avatarLetter: String
    public var avatarColor: Int64

    public init(username: String, phone: String, bio: String, avatarLetter: String, avatarColor: Int64) {
        this.username = username
        this.phone = phone
        this.bio = bio
        this.avatarLetter = avatarLetter
        this.avatarColor = avatarColor
    }

    public static func getDefault(): ProfileData {
        return ProfileData("CJMP用户", "+86 138 0000 0000", "点击添加个人简介", "华", 0xFF0000)
    }
}

// 个人资料详情页
@Component
public class ProfilePage {
    // 返回回调
    var onBack: () -> Unit = { => }

    // 用户资料数据
    @State
    var profile: ProfileData = ProfileData.getDefault()

    // 返回上一页
    func onBackClick() {
        this.onBack()
    }

    // 点击编辑
    func onEditClick() {
        // TODO: 进入编辑模式
    }

    // 点击发消息
    func onMessageClick() {
        // TODO: 跳转到聊天页面
    }

    // 点击语音
    func onVoiceClick() {
        // TODO: 实现语音通话
    }

    // 点击视频
    func onVideoClick() {
        // TODO: 实现视频通话
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
                Text("个人资料")
                    .fontSize(18)
                    .fontColor(0x333333)
                    .fontWeight(FontWeight.Medium)
                    .layoutWeight(1)
                    .textAlign(TextAlign.Center)

                // 编辑按钮
                Text("编辑")
                    .fontSize(16)
                    .fontColor(0x2196F3)
                    .onClick({ event => this.onEditClick() })
            }
            .width(100.percent)
            .height(48)
            .padding(left: 16, right: 16, top: 0, bottom: 0)
            .backgroundColor(0xFFFFFF)
            .alignItems(VerticalAlign.Center)

            // 滚动内容区域
            Scroll {
                Column {
                    // 用户头像区域 - 72dp圆形
                    Column {
                        // 圆形头像
                        Text(this.profile.avatarLetter)
                            .fontSize(32)
                            .fontColor(0xFFFFFF)
                            .fontWeight(FontWeight.Bold)
                    }
                    .width(72)
                    .height(72)
                    .backgroundColor(this.profile.avatarColor)
                    .borderRadius(36)
                    .justifyContent(FlexAlign.Center)
                    .alignItems(HorizontalAlign.Center)
                    .margin(bottom: 12)

                    // 用户名 - 18dp黑色加粗
                    Text(this.profile.username)
                        .fontSize(18)
                        .fontColor(0x333333)
                        .fontWeight(FontWeight.Bold)
                        .margin(bottom: 8)

                    // 手机号 - 14dp灰色
                    Text(this.profile.phone)
                        .fontSize(14)
                        .fontColor(0x999999)
                        .margin(bottom: 20)

                    // 操作按钮栏（横向3个：发消息、语音、视频）
                    Row {
                        // 发消息
                        Column {
                            Text("\u{1F4AC}")  // 💬
                                .fontSize(24)
                            Text("发消息")
                                .fontSize(12)
                                .fontColor(0x2196F3)
                                .margin(top: 4)
                        }
                        .onClick({ event => this.onMessageClick() })

                        // 语音
                        Column {
                            Text("\u{1F4DE}")  // 📞
                                .fontSize(24)
                            Text("语音")
                                .fontSize(12)
                                .fontColor(0x2196F3)
                                .margin(top: 4)
                        }
                        .margin(left: 32, right: 0, top: 0, bottom: 0)
                        .onClick({ event => this.onVoiceClick() })

                        // 视频
                        Column {
                            Text("\u{1F3AC}")  // 🎬
                                .fontSize(24)
                            Text("视频")
                                .fontSize(12)
                                .fontColor(0x2196F3)
                                .margin(top: 4)
                        }
                        .margin(left: 32, right: 0, top: 0, bottom: 0)
                        .onClick({ event => this.onVideoClick() })
                    }
                    .width(100.percent)
                    .justifyContent(FlexAlign.Center)
                    .margin(bottom: 20)

                    // 信息卡片（白色圆角卡片）
                    Column {
                        // 用户名行
                        Row {
                            Column {
                                Text("用户名")
                                    .fontSize(14)
                                    .fontColor(0x999999)
                                    .margin(bottom: 4)
                                Text(this.profile.username)
                                    .fontSize(16)
                                    .fontColor(0x333333)
                            }
                            .alignItems(HorizontalAlign.Start)
                        }
                        .width(100.percent)
                        .padding(left: 16, right: 16, top: 16, bottom: 16)
                        .alignItems(VerticalAlign.Center)

                        // 分割线
                        Row { }
                        .width(100.percent)
                        .height(1)
                        .backgroundColor(0xEEEEEE)

                        // 手机号行
                        Row {
                            Column {
                                Text("手机号")
                                    .fontSize(14)
                                    .fontColor(0x999999)
                                    .margin(bottom: 4)
                                Text(this.profile.phone)
                                    .fontSize(16)
                                    .fontColor(0x333333)
                            }
                            .alignItems(HorizontalAlign.Start)
                        }
                        .width(100.percent)
                        .padding(left: 16, right: 16, top: 16, bottom: 16)
                        .alignItems(VerticalAlign.Center)

                        // 分割线
                        Row { }
                        .width(100.percent)
                        .height(1)
                        .backgroundColor(0xEEEEEE)

                        // 个人简介行
                        Row {
                            Column {
                                Text("个人简介")
                                    .fontSize(14)
                                    .fontColor(0x999999)
                                    .margin(bottom: 4)
                                Text(this.profile.bio)
                                    .fontSize(14)
                                    .fontColor(if (this.profile.bio == "点击添加个人简介") { 0x999999 } else { 0x333333 })
                            }
                            .alignItems(HorizontalAlign.Start)
                        }
                        .width(100.percent)
                        .padding(left: 16, right: 16, top: 16, bottom: 16)
                        .alignItems(VerticalAlign.Center)
                    }
                    .width(100.percent)
                    .backgroundColor(0xFFFFFF)
                    .borderRadius(12)
                    .margin(left: 16, right: 16, top: 0, bottom: 0)
                }
                .width(100.percent)
                .padding(top: 20, bottom: 20, left: 0, right: 0)
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
