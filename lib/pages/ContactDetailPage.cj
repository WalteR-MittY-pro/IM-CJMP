package ohos_app_cangjie_entry.pages

internal import ohos.base.LengthProp
internal import ohos.component.*
internal import ohos.state_manage.LocalStorage
internal import ohos.state_manage.SubscriberManager
internal import ohos.state_manage.ObservedProperty
import ohos.state_macro_manage.Component
import ohos.state_macro_manage.State

// 联系人详情页子组件
@Component
public class ContactDetailView {
    // 接收联系人数据
    @State
    var contact: ContactItem = ContactItem("", "", false, "", 0x2196F3, "")
    // 返回回调
    var onBack: () -> Unit = { => }

    // 返回上一页
    func onBackClick() {
        this.onBack()
    }

    // 点击发消息 - 提示用户进入聊天页面
    func onMessageClick() {
        // TODO: 可以添加跳转到聊天页面的逻辑
    }

    // 点击语音
    func onVoiceClick() {
        // TODO: 实现语音通话
    }

    // 点击视频
    func onVideoClick() {
        // TODO: 实现视频通话
    }

    // 点击静音
    func onMuteClick() {
        // TODO: 实现静音/取消静音
    }

    // 点击更多
    func onMoreClick() {
        // TODO: 展示更多操作菜单
    }

    // 点击编辑
    func onEditClick() {
        // TODO: 进入编辑模式
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

                // 空白区域
                Row { }
                .layoutWeight(1)

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
                    // 用户头像区域
                    Column {
                        // 圆形头像 - 72dp
                        Text(this.contact.avatarLetter)
                            .fontSize(32)
                            .fontColor(0xFFFFFF)
                            .fontWeight(FontWeight.Bold)
                    }
                    .width(72)
                    .height(72)
                    .backgroundColor(this.contact.avatarColor)
                    .borderRadius(36)
                    .justifyContent(FlexAlign.Center)
                    .alignItems(HorizontalAlign.Center)
                    .margin(bottom: 12)

                    // 用户昵称 - 红色粗体
                    Text(this.contact.name)
                        .fontSize(24)
                        .fontColor(0xF44336)
                        .fontWeight(FontWeight.Bold)
                        .margin(bottom: 8)

                    // 在线状态 - 灰色小字
                    Text(this.contact.lastSeen)
                        .fontSize(14)
                        .fontColor(0x9E9E9E)
                        .margin(bottom: 20)

                    // 快捷操作按钮栏（横向5个）
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
                        .margin(left: 16, right: 0, top: 0, bottom: 0)
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
                        .margin(left: 16, right: 0, top: 0, bottom: 0)
                        .onClick({ event => this.onVideoClick() })

                        // 静音
                        Column {
                            Text("\u{1F514}")  // 🔔
                                .fontSize(24)
                            Text("静音")
                                .fontSize(12)
                                .fontColor(0x2196F3)
                                .margin(top: 4)
                        }
                        .margin(left: 16, right: 0, top: 0, bottom: 0)
                        .onClick({ event => this.onMuteClick() })

                        // 更多
                        Column {
                            Text("\u{22EE}")  // ⋯
                                .fontSize(24)
                            Text("更多")
                                .fontSize(12)
                                .fontColor(0x2196F3)
                                .margin(top: 4)
                        }
                        .margin(left: 16, right: 0, top: 0, bottom: 0)
                        .onClick({ event => this.onMoreClick() })
                    }
                    .width(100.percent)
                    .justifyContent(FlexAlign.SpaceEvenly)
                    .margin(bottom: 20)

                    // 信息卡片（白色圆角卡片）
                    Column {
                        // Air ID 行
                        Row {
                            Column {
                                Text("Air ID")
                                    .fontSize(14)
                                    .fontColor(0x999999)
                                    .margin(bottom: 4)
                                Text(this.contact.airId.toString())
                                    .fontSize(20)
                                    .fontColor(0xF44336)
                                    .fontWeight(FontWeight.Bold)
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

                        // 等级行
                        Row {
                            // 左侧：等级信息
                            Row {
                                Text("等级")
                                    .fontSize(14)
                                    .fontColor(0x999999)
                                Text("Lv ${this.contact.level.toString()}")
                                    .fontSize(14)
                                    .fontColor(0xFF9800)
                                    .fontWeight(FontWeight.Medium)
                                    .margin(left: 8)
                                // 等级图标 - 皇冠
                                Text("\u{1F451}")  // 👑
                                    .fontSize(16)
                                    .margin(left: 4)
                            }
                            .alignItems(VerticalAlign.Center)

                            // 空白区域
                            Row { }
                            .layoutWeight(1)

                            // 右侧：徽章（如果有）
                            if (!this.contact.badge.isEmpty()) {
                                Row {
                                    Text(this.contact.badge)
                                        .fontSize(12)
                                        .fontColor(0xFFD700)
                                        .fontWeight(FontWeight.Medium)
                                }
                                .padding(left: 8, right: 8, top: 4, bottom: 4)
                                .backgroundColor(0xFFF8E1)
                                .borderRadius(4)
                                .alignItems(VerticalAlign.Center)
                            }
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
                                Text(if (this.contact.bio.isEmpty()) { "暂无简介" } else { this.contact.bio })
                                    .fontSize(14)
                                    .fontColor(0x333333)
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
