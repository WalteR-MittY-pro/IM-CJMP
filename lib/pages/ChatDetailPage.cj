package ohos_app_cangjie_entry.pages

internal import ohos.base.LengthProp
internal import ohos.component.*
internal import ohos.state_manage.LocalStorage
internal import ohos.state_manage.SubscriberManager
internal import ohos.state_manage.ObservedProperty
import ohos.state_macro_manage.Component
import ohos.state_macro_manage.State
import ohos.state_macro_manage.Entry
import std.collection.ArrayList

@Entry
@Component
public class ChatDetailPage {
    @State
    var chatName: String = "Chat"
    @State
    var inputText: String = ""
    @State
    var messages: ArrayList<Message> = MockData.getDefaultMessages()
    
    // 获取当前时间
    func getCurrentTime(): String {
        // 简单生成当前时间字符串
        let timestamp = 12 * 60 + 30  // 简化处理，使用固定时间格式 "12:30"
        let hour = timestamp / 60
        let minute = timestamp % 60
        let hourStr = if (hour < 10) { "0" + hour.toString() } else { hour.toString() }
        let minuteStr = if (minute < 10) { "0" + minute.toString() } else { minute.toString() }
        return hourStr + ":" + minuteStr
    }
    
    // 发送消息
    func sendMessage() {
        // 检查输入是否为空
        if (this.inputText.isEmpty()) {
            return
        }
        // 创建新消息，状态为"sending"
        let content = this.inputText
        let newMsg = Message("sent", content, "Me", this.getCurrentTime(), "sent")
        // 添加到消息列表
        this.messages = MockData.addMessage(this.messages, newMsg)
        // 清空输入框
        this.inputText = ""
    }
    
    // 设置聊天名称
    public func setChatName(name: String) {
        this.chatName = name
        this.messages = MockData.getMessages(name)
    }
    
    func build() {
        Column {
            // 导航栏
            Row {
                Text("<")
                    .fontSize(24)
                    .fontColor(0x333333)
                    .fontWeight(FontWeight.Bold)
                
                Text(this.chatName)
                    .fontSize(18)
                    .fontColor(0x333333)
                    .margin(top: 0, bottom: 0, left: 16, right: 0)
                
                Row {
                    Text("=")
                        .fontSize(20)
                        .fontColor(0x333333)
                }
                .width(100.percent)
                .justifyContent(FlexAlign.End)
            }
            .width(100.percent)
            .height(48)
            .padding(16)
            .backgroundColor(0xFFFFFF)
            
            // 消息列表
            List {
                ForEach(this.messages, { msg: Message, index: Int64 =>
                    if (msg.msgType == "received") {
                        // 接收方消息
                        ListItem {
                            Row {
                                Column {
                                    Text(msg.sender)
                                        .fontSize(16)
                                        .fontColor(0xFFFFFF)
                                        .fontWeight(FontWeight.Bold)
                                }
                                .width(32)
                                .height(32)
                                .backgroundColor(0x2196F3)
                                .borderRadius(16)
                                .justifyContent(FlexAlign.Center)
                                .alignItems(HorizontalAlign.Center)
                                
                                Column {
                                    Text(msg.content)
                                        .fontSize(14)
                                        .fontColor(0x333333)
                                        .margin(top: 0, bottom: 0, left: 8, right: 0)
                                }
                                .layoutWeight(1)
                            }
                            .width(100.percent)
                            .padding(12)
                        }
                    } else {
                        // 发送方消息
                        ListItem {
                            Row {
                                Column {
                                    Text(msg.content)
                                        .fontSize(14)
                                        .fontColor(0xFFFFFF)
                                        .margin(top: 0, bottom: 0, left: 8, right: 8)
                                }
                                .backgroundColor(0x29B6F6)
                                .borderRadius(16)
                                .padding(top: 8, bottom: 8, left: 12, right: 12)
                                .layoutWeight(1)
                                .justifyContent(FlexAlign.End)
                                .alignItems(HorizontalAlign.End)
                                
                                // 消息状态图标
                                Column {
                                    if (msg.status == "sending") {
                                        // 时钟图标 - 发送中
                                        Text("๑")
                                            .fontSize(12)
                                            .fontColor(0x999999)
                                    } else if (msg.status == "sent") {
                                        // 单勾 - 已发送
                                        Text("✓")
                                            .fontSize(12)
                                            .fontColor(0x999999)
                                    } else if (msg.status == "delivered") {
                                        // 双勾 - 已送达
                                        Text("✓✓")
                                            .fontSize(12)
                                            .fontColor(0x999999)
                                    } else if (msg.status == "read") {
                                        // 双勾蓝色 - 已读
                                        Text("✓✓")
                                            .fontSize(12)
                                            .fontColor(0x2196F3)
                                    } else if (msg.status == "failed") {
                                        // 感叹号 - 发送失败
                                        Text("!")
                                            .fontSize(12)
                                            .fontColor(0xF44336)
                                    }
                                }
                                .justifyContent(FlexAlign.End)
                                .alignItems(HorizontalAlign.End)
                                .margin(left: 4)
                            }
                            .width(100.percent)
                            .justifyContent(FlexAlign.End)
                            .padding(12)
                        }
                    }
                })
            }
            .width(100.percent)
            .layoutWeight(1)
            .backgroundColor(0xFFFFFF)
            
            // 输入区域
            Row {
                // 6个功能图标
                Row {
                    Text("\u{1F3A4}")  // 🎤 麦克风
                        .fontSize(16)
                        .fontColor(0x999999)
                    Text("\u{1F5BC}")  // 🖼️ 图片
                        .fontSize(16)
                        .fontColor(0x999999)
                        .margin(top: 0, bottom: 0, left: 12, right: 0)
                    Text("\u{1F4F7}")  // 📷 相机
                        .fontSize(16)
                        .fontColor(0x999999)
                        .margin(top: 0, bottom: 0, left: 12, right: 0)
                    Text("\u{1F4CE}")  // 📎 附件
                        .fontSize(16)
                        .fontColor(0x999999)
                        .margin(top: 0, bottom: 0, left: 12, right: 0)
                    Text("\u{1F60A}")  // 😊 表情
                        .fontSize(16)
                        .fontColor(0x999999)
                        .margin(top: 0, bottom: 0, left: 12, right: 0)
                    Text("\u{2795}")   // ➕ 添加
                        .fontSize(16)
                        .fontColor(0x999999)
                        .margin(top: 0, bottom: 0, left: 12, right: 0)
                }
                .width(180)
                .justifyContent(FlexAlign.Start)
                
                TextInput(placeholder: "Message")
                    .fontSize(14)
                    .backgroundColor(0xF5F5F5)
                    .borderRadius(20)
                    .padding(top: 8, bottom: 8, left: 12, right: 12)
                    .layoutWeight(1)
                    .margin(top: 0, bottom: 0, left: 8, right: 8)
                    .onChange({ text: String =>
                        this.inputText = text
                    })
                
                Row {
                    Text("Send")
                        .fontSize(14)
                        .fontColor(0xFFFFFF)
                }
                .width(60)
                .height(36)
                .backgroundColor(0x29B6F6)
                .borderRadius(16)
                .justifyContent(FlexAlign.Center)
                .alignItems(VerticalAlign.Center)
                .onClick({ event =>
                    this.sendMessage()
                })
            }
            .width(100.percent)
            .height(56)
            .padding(8)
            .backgroundColor(0xFFFFFF)
        }
        .width(100.percent)
        .height(100.percent)
        .backgroundColor(0xFFFFFF)
    }
}
