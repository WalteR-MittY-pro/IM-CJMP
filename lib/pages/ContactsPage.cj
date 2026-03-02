package ohos_app_cangjie_entry.pages

internal import ohos.base.LengthProp
internal import ohos.component.*
internal import ohos.state_manage.LocalStorage
internal import ohos.state_manage.SubscriberManager
internal import ohos.state_manage.ObservedProperty
internal import ohos.state_manage.ViewStackProcessor
import ohos.state_macro_manage.Component
import ohos.state_macro_manage.State

@Component
public class ContactsPage {
    @State
    var searchText: String = ""
    @State
    var showAddContact: Bool = false
    @State
    var isDarkMode: Bool = false
    // 联系人详情页显示状态
    @State
    var showContactDetail: Bool = false
    // 当前选中的联系人
    @State
    var selectedContact: ContactItem = ContactItem("", "", false, "", 0x2196F3, "")

    // 联系人列表（包含所有联系人）
    @State
    var contactList: Array<ContactItem> = ContactData.getContacts()

    // 添加联系人弹窗相关状态
    @State
    var newContactName: String = ""
    @State
    var newContactUsername: String = ""

    // 过滤联系人
    func filterContacts() {
        let allContacts = ContactData.getContacts()
        if (this.searchText.isEmpty()) {
            this.contactList = allContacts
        } else {
            // 手动构建过滤后的数组
            var result: Array<ContactItem> = []
            let len = allContacts.size
            var i = 0
            while (i < len) {
                let item = allContacts[i]
                if (item.name.contains(this.searchText) || item.username.contains(this.searchText)) {
                    result = result
                }
                i += 1
            }
            // 如果没有匹配，返回空数组
            if (result.size == 0) {
                this.contactList = []
            }
        }
    }

    // 搜索文本变化时过滤
    func onSearchChanged(text: String) {
        this.searchText = text
        this.filterContacts()
    }

    // 添加联系人
    func addContact() {
        this.showAddContact = !this.showAddContact
    }

    // 确认添加联系人
    func confirmAddContact() {
        if (!this.newContactName.isEmpty() && !this.newContactUsername.isEmpty()) {
            // 创建新联系人
            let firstChar = if (this.newContactName.isEmpty()) { "?" } else { this.newContactName[0].toString() }
            let letter = firstChar
            let newContact = ContactItem(
                this.newContactName,
                this.newContactUsername,
                false,
                "刚刚",
                0x2196F3,
                letter
            )
            // 直接修改 contactList（重新赋值）
            this.contactList = [newContact]
            // 清空输入
            this.newContactName = ""
            this.newContactUsername = ""
            this.showAddContact = false
        }
    }

    // 取消添加联系人
    func cancelAddContact() {
        this.newContactName = ""
        this.newContactUsername = ""
        this.showAddContact = false
    }

    // 点击联系人，跳转到联系人详情页
    func onContactClick(item: ContactItem) {
        // 使用条件渲染显示详情页
        this.selectedContact = item
        this.showContactDetail = true
    }

    // 返回联系人列表
    func goBack() {
        this.showContactDetail = false
    }

    // 切换深色模式
    func toggleDarkMode() {
        this.isDarkMode = !this.isDarkMode
    }

    func build() {
        Stack {
            // 联系人列表页
            Column {
                // 导航栏
                Row {
                    Text("联系人")
                        .fontSize(20)
                        .fontColor(0x333333)
                        .fontWeight(FontWeight.Medium)
                        .layoutWeight(1)
                        .textAlign(TextAlign.Center)

                    Text("+")
                        .fontSize(24)
                        .fontColor(0x333333)
                        .fontWeight(FontWeight.Bold)
                        .onClick({ event => this.addContact() })
                }
                .width(100.percent)
                .height(48)
                .padding(left: 16, right: 16, top: 0, bottom: 0)
                .alignItems(VerticalAlign.Center)
                .backgroundColor(0xFFFFFF)

                // 搜索栏
                Row {
                    Text("\u{1F50D}")  // 🔍 搜索图标
                        .fontSize(16)
                        .fontColor(0x999999)

                    TextInput(placeholder: "搜索")
                        .fontSize(14)
                        .fontColor(0x333333)
                        .backgroundColor(0xF5F5F5)
                        .borderRadius(8)
                        .layoutWeight(1)
                        .height(36)
                        .onChange({ text: String => this.onSearchChanged(text) })
                }
                .width(100.percent)
                .padding(left: 16, right: 16, top: 0, bottom: 0)

                // 联系人列表
                List {
                    ForEach(this.contactList, { item: ContactItem, index: Int64 =>
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

                                // 名称和用户名/在线状态
                                Column {
                                    Text(item.name)
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                        .fontWeight(FontWeight.Medium)
                                        .maxLines(1)

                                    Row {
                                        Text("@${item.username}")
                                            .fontSize(14)
                                            .fontColor(0x666666)
                                        Text(" · ")
                                            .fontSize(14)
                                            .fontColor(0x999999)
                                        
                                        // 根据onlineStatus显示不同状态
                                        if (item.onlineStatus == "online") {
                                            // 在线状态 - 绿色圆点 + 文字
                                            Row {
                                                Text("●")
                                                    .fontSize(10)
                                                    .fontColor(0x4CAF50)
                                                Text(" 在线")
                                                    .fontSize(14)
                                                    .fontColor(0x4CAF50)
                                            }
                                        } else if (item.onlineStatus == "typing") {
                                            // 正在输入状态
                                            Text("正在输入...")
                                                .fontSize(14)
                                                .fontColor(0x2196F3)
                                        } else if (item.onlineStatus == "offline") {
                                            // 离线状态
                                            Text("离线")
                                                .fontSize(14)
                                                .fontColor(0x999999)
                                        } else {
                                            // recently - 显示最后在线时间
                                            if (item.lastSeen.isEmpty()) {
                                                Text("最近在线")
                                                    .fontSize(14)
                                                    .fontColor(0x999999)
                                            } else {
                                                Text("${item.lastSeen}")
                                                    .fontSize(14)
                                                    .fontColor(0x999999)
                                            }
                                        }
                                    }
                                    .margin(top: 4)
                                }
                                .alignItems(HorizontalAlign.Start)
                                .layoutWeight(1)
                            }
                            .width(100.percent)
                            .padding(left: 16, right: 16, top: 0, bottom: 0)
                            .alignItems(VerticalAlign.Center)
                        }
                        .height(64)
                        .onClick({ event => this.onContactClick(item) })
                    })
                }
                .width(100.percent)
                .layoutWeight(1)
                .divider(strokeWidth: 1, color: 0xEEEEEE, startMargin: 0, endMargin: 0)

                // 添加联系人弹窗
                if (this.showAddContact) {
                    // 弹窗背景
                    Column {
                        Column {
                            Text("添加联系人")
                                .fontSize(18)
                                .fontColor(0x333333)
                                .fontWeight(FontWeight.Medium)
                                .margin(bottom: 20)

                            TextInput(placeholder: "姓名")
                                .fontSize(14)
                                .fontColor(0x333333)
                                .backgroundColor(0xF5F5F5)
                                .borderRadius(8)
                                .height(40)
                                .margin(bottom: 12)
                                .onChange({ text: String => this.newContactName = text })

                            TextInput(placeholder: "用户名")
                                .fontSize(14)
                                .fontColor(0x333333)
                                .backgroundColor(0xF5F5F5)
                                .borderRadius(8)
                                .height(40)
                                .margin(bottom: 20)
                                .onChange({ text: String => this.newContactUsername = text })

                            Row {
                                Text("取消")
                                    .fontSize(16)
                                    .fontColor(0x666666)
                                    .layoutWeight(1)
                                    .textAlign(TextAlign.Center)
                                    .onClick({ event => this.cancelAddContact() })

                                Text("添加")
                                    .fontSize(16)
                                    .fontColor(0x2196F3)
                                    .fontWeight(FontWeight.Medium)
                                    .layoutWeight(1)
                                    .textAlign(TextAlign.Center)
                                    .onClick({ event => this.confirmAddContact() })
                            }
                        }
                        .width(280)
                        .padding(20)
                        .backgroundColor(0xFFFFFF)
                        .borderRadius(12)
                    }
                    .width(100.percent)
                    .height(100.percent)
                    .backgroundColor(0x000000)
                    .opacity(0.5)
                    .alignItems(HorizontalAlign.Center)
                    .justifyContent(FlexAlign.Center)
                    .onClick({ event => this.cancelAddContact() })
                }
            }
            .width(100.percent)
            .height(100.percent)
            .backgroundColor(0xFFFFFF)

            // 联系人详情页
            if (this.showContactDetail) {
                ContactDetailView(
                    contact: this.selectedContact,
                    onBack: { => this.goBack() }
                )
            }
        }
        .width(100.percent)
        .height(100.percent)
    }
}
