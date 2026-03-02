package ohos_app_cangjie_entry.pages

internal import ohos.base.LengthProp
internal import ohos.component.*
internal import ohos.state_manage.LocalStorage
internal import ohos.state_manage.SubscriberManager
internal import ohos.state_manage.ObservedProperty
import ohos.state_macro_manage.Component
import ohos.state_macro_manage.State
import ohos.router.Router
import std.collection.ArrayList

// 聊天项数据结构
public struct ChatItem {
    public let name: String
    public let lastMsg: String
    public let time: String
    public let unread: String
    public let avatarColor: Int64
    public let avatarLetter: String
    
    public init(name: String, lastMsg: String, time: String, unread: String, avatarColor: Int64, avatarLetter: String) {
        this.name = name
        this.lastMsg = lastMsg
        this.time = time
        this.unread = unread
        this.avatarColor = avatarColor
        this.avatarLetter = avatarLetter
    }
}

@Component
public class ChatsPage {
    @State
    var searchText: String = ""
    @State
    var showChatDetail: Bool = false
    @State
    var selectedChatName: String = "Chat"
    @State
    var showSideBar: Bool = false
    @State
    var isDarkMode: Bool = false
    @State
    var currentMessages: ArrayList<Message> = ArrayList<Message>([])

    // 20个聊天数据列表
    let chatList: Array<ChatItem> = [
        ChatItem("关爱少女成长协会", "小明: 活动结束后一起吃饭吧", "10:00", "3", 0xE91E63, "爱"),
        ChatItem("PSA-安全公告专栏", "【安全提醒】请勿点击不明链接", "11:00", "5", 0x9C27B0, "安"),
        ChatItem("非正常人类研究中心", "思无涯: 下周有个讲座", "13:35", "2", 0x673AB7, "研"),
        ChatItem("Telegram Developers", "Next meeting is Friday", "12:45", "1", 0x3F51B5, "T"),
        ChatItem("妈妈", "记得带伞，今天有雨", "18:05", "0", 0xFF9800, "妈"),
        ChatItem("李明", "好的，到时候见", "10:35", "0", 0x4CAF50, "李"),
        ChatItem("编程技术分享", "下周讲Go的新特性", "11:40", "8", 0x00BCD4, "编"),
        ChatItem("每日新闻", "天气预报：明日降温", "12:05", "10", 0xF44336, "新"),
        ChatItem("游戏交流群", "记得准时啊", "18:32", "4", 0x8BC34A, "游"),
        ChatItem("音乐分享", "记得关注哦", "10:40", "2", 0xFFEB3B, "音"),
        ChatItem("考研学习交流", "下次分享会讨论这个", "10:10", "6", 0x009688, "考"),
        ChatItem("健身打卡", "继续保持！", "12:10", "3", 0x795548, "健"),
        ChatItem("旅行爱好者", "好的，谢谢分享！", "09:30", "1", 0x607D8B, "旅"),
        ChatItem("美食分享", "地址我发群里", "18:15", "2", 0xE91E63, "美"),
        ChatItem("电影推荐", "期待！", "20:35", "0", 0x673AB7, "影"),
        ChatItem("二手交易", "没问题", "15:25", "1", 0x4CAF50, "二"),
        ChatItem("宠物交流", "没问题！", "11:28", "0", 0xFF5722, "宠"),
        ChatItem("前端开发", "会议室链接已发", "10:35", "7", 0x2196F3, "前"),
        ChatItem("产品经理交流", "报名参加！", "14:35", "4", 0x9C27B0, "产"),
        ChatItem("AI 人工智能", "准时参加！", "09:45", "2", 0x3F51B5, "AI")
    ]

    // 跳转到聊天详情页
    func navigateToChat(chatName: String) {
        this.selectedChatName = chatName
        this.currentMessages = MockData.getMessages(chatName)
        this.showChatDetail = true
    }

    // 返回聊天列表
    func goBack() {
        this.showChatDetail = false
    }

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

                if (this.showChatDetail) {
                    // 聊天详情页
                    Column {
                        // 导航栏
                        Row {
                            Text("<")
                                .fontSize(24)
                                .fontColor(0x333333)
                                .fontWeight(FontWeight.Bold)
                                .onClick({ event => this.goBack() })

                            Text(this.selectedChatName)
                                .fontSize(18)
                                .fontColor(0x333333)
                                .fontWeight(FontWeight.Medium)
                                .margin(top: 0, bottom: 0, left: 16, right: 0)
                                .layoutWeight(1)

                            Text("≡")
                                .fontSize(24)
                                .fontColor(0x333333)
                                .fontWeight(FontWeight.Bold)
                                .onClick({ event => this.toggleSideBar() })
                        }
                        .width(100.percent)
                        .height(48)
                        .padding(left: 16, right: 16, top: 0, bottom: 0)
                        .justifyContent(FlexAlign.Start)
                        .alignItems(VerticalAlign.Center)
                        .backgroundColor(0xFFFFFF)

                        // 消息列表
                        List {
                            ForEach(this.currentMessages, { msg: Message, index: Int64 =>
                                if (msg.msgType == "received") {
                                    ListItem {
                                        Column {
                                            // 名字在消息框上方
                                            Text(msg.sender)
                                                .fontSize(12)
                                                .fontColor(0x666666)
                                                .fontWeight(FontWeight.Medium)
                                                .margin(left: 12, bottom: 4)

                                            // 消息框和时间在同一行
                                            Row {
                                                // 消息内容
                                                Text(msg.content)
                                                    .fontSize(14)
                                                    .fontColor(0x333333)
                                                    .backgroundColor(0xFFFFFF)
                                                    .borderRadius(16)
                                                    .borderWidth(1)
                                                    .borderColor(0xDDDDDD)
                                                    .padding(left: 12, right: 12, top: 8, bottom: 8)

                                                // 时间在消息右侧
                                                Text(msg.time)
                                                    .fontSize(10)
                                                    .fontColor(0x999999)
                                                    .margin(left: 8)
                                            }
                                            .width(100.percent)
                                            .padding(left: 12, right: 12, top: 0, bottom: 0)
                                        }
                                        .width(100.percent)
                                        .alignItems(HorizontalAlign.Start)
                                        .padding(top: 8, bottom: 8)
                                    }
                                } else {
                                    ListItem {
                                        Column {
                                            // 消息框和时间在同一行
                                            Row {
                                                // 时间在消息左侧
                                                Text(msg.time)
                                                    .fontSize(10)
                                                    .fontColor(0x999999)
                                                    .margin(right: 8)

                                                // 消息内容
                                                Text(msg.content)
                                                    .fontSize(14)
                                                    .fontColor(0xFFFFFF)
                                                    .backgroundColor(0x2196F3)
                                                    .borderRadius(16)
                                                    .padding(left: 12, right: 12, top: 8, bottom: 8)
                                            }
                                            .width(100.percent)
                                            .justifyContent(FlexAlign.End)
                                            .padding(left: 12, right: 12, top: 0, bottom: 0)
                                        }
                                        .width(100.percent)
                                        .alignItems(HorizontalAlign.End)
                                        .padding(top: 8, bottom: 8)
                                    }
                                }
                            })
                        }
                        .width(100.percent)
                        .layoutWeight(1)
                        .backgroundColor(0xF5F5F5)

                        // 输入框
                        Row {
                            TextInput(placeholder: "Message...")
                                .fontSize(14)
                                .fontColor(0x333333)
                                .backgroundColor(0xFFFFFF)
                                .borderRadius(20)
                                .layoutWeight(1)
                                .height(40)

                            Text("Send")
                                .fontSize(14)
                                .fontColor(0x2196F3)
                                .margin(top: 0, bottom: 0, left: 12, right: 0)
                        }
                        .width(100.percent)
                        .padding(12)
                        .backgroundColor(0xFFFFFF)
                    }
                    .width(100.percent)
                    .height(100.percent)
                } else {
                    // 聊天列表页
                    Column {
                        // 导航栏
                        Row {
                            Text("≡")
                                .fontSize(24)
                                .fontColor(0x333333)
                                .fontWeight(FontWeight.Bold)
                                .onClick({ event => this.toggleSideBar() })

                            Text("聊天")
                                .fontSize(20)
                                .fontColor(0x333333)
                                .fontWeight(FontWeight.Medium)
                                .layoutWeight(1)
                                .textAlign(TextAlign.Center)

                            Text("...")
                                .fontSize(20)
                                .fontColor(0x333333)
                                .onClick({ event =>
                                    // TODO: 点击更多选项
                                })
                        }
                        .width(100.percent)
                        .height(48)
                        .padding(left: 16, right: 16, top: 0, bottom: 0)
                        
                        // 搜索栏
                        Row {
                            Text("\u{1F50D}")  // 🔍 搜索图标
                                .fontSize(16)
                                .fontColor(0x999999)
                            
                            TextInput(placeholder: "Search")
                                .fontSize(14)
                                .fontColor(0x333333)
                                .backgroundColor(0xF5F5F5)
                                .borderRadius(8)
                                .layoutWeight(1)
                                .height(36)
                        }
                        .width(100.percent)
                        .padding(left: 16, right: 16, top: 0, bottom: 0)

                        // 聊天列表
                        List {
                            ForEach(this.chatList, { item: ChatItem, index: Int64 =>
                                ListItem {
                                    Row {
                                        // 头像
                                        Column {
                                            Text(item.avatarLetter)
                                                .fontSize(18)
                                                .fontColor(0xFFFFFF)
                                                .fontWeight(FontWeight.Bold)
                                        }
                                        .width(48)
                                        .height(48)
                                        .backgroundColor(item.avatarColor)
                                        .borderRadius(24)
                                        .justifyContent(FlexAlign.Center)
                                        .alignItems(HorizontalAlign.Center)
                                        .margin(right: 12)

                                        // 名称和消息
                                        Column {
                                            Text(item.name)
                                                .fontSize(16)
                                                .fontColor(0x333333)
                                                .fontWeight(FontWeight.Medium)
                                            Text(item.lastMsg)
                                                .fontSize(14)
                                                .fontColor(0x666666)
                                                .margin(top: 4)
                                                .maxLines(1)
                                        }
                                        .alignItems(HorizontalAlign.Start)
                                        .layoutWeight(1)

                                        // 时间和未读数
                                        Column {
                                            Text(item.time)
                                                .fontSize(12)
                                                .fontColor(0x999999)
                                            if (item.unread != "0") {
                                                Text(item.unread)
                                                    .fontSize(12)
                                                    .fontColor(0xFFFFFF)
                                                    .backgroundColor(0x2196F3)
                                                    .borderRadius(10)
                                                    .padding(top: 2, bottom: 2, left: 6, right: 6)
                                                    .margin(top: 4)
                                            }
                                        }
                                        .alignItems(HorizontalAlign.End)
                                    }
                                    .width(100.percent)
                                    .padding(left: 16, right: 16, top: 0, bottom: 0)
                                    .alignItems(VerticalAlign.Center)
                                    .onClick({ event => this.navigateToChat(item.name) })
                                }
                                .height(72)
                            })
                        }
                        .width(100.percent)
                        .layoutWeight(1)
                        .divider(strokeWidth: 1, color: 0xEEEEEE, startMargin: 0, endMargin: 0)
                    }
                    .width(100.percent)
                    .height(100.percent)
                    .backgroundColor(0xFFFFFF)
                }
            }
            .width(100.percent)
            .height(100.percent)

            // 侧边栏（上层）- 当showSideBar为true时显示在右侧
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
                                Text("👥")
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
                                Text("👤")
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
        }
        .width(100.percent)
        .height(100.percent)
    }
}
