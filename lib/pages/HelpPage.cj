package ohos_app_cangjie_entry.pages

internal import ohos.base.LengthProp
internal import ohos.component.*
internal import ohos.state_manage.LocalStorage
internal import ohos.state_manage.SubscriberManager
internal import ohos.state_manage.ObservedProperty
import ohos.state_macro_manage.Component
import ohos.state_macro_manage.State

// 帮助详情页
@Component
public class HelpPage {
    // 返回回调
    var onBack: () -> Unit = { => }

    // 版本信息
    let appVersion: String = "1.0.0"
    let copyrightYear: String = "2026"
    let copyrightHolder: String = "Telegram"

    // 返回上一页
    func onBackClick() {
        this.onBack()
    }

    // 点击帮助项
    func onHelpItemClick(index: Int64) {
        // TODO: 根据索引跳转到对应的详情页面
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

                Text("帮助")
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
                    // 帮助功能列表
                    List {
                        // 常见问题
                        ListItem {
                            Row {
                                Text("\u{2753}")
                                    .fontSize(20)
                                Column {
                                    Text("常见问题")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("使用帮助和FAQ")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 16)
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

                        // 提问问题
                        ListItem {
                            Row {
                                Text("\u{1F4AC}")
                                    .fontSize(20)
                                Column {
                                    Text("提问问题")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("联系官方支持")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 16)
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

                        // 报告问题
                        ListItem {
                            Row {
                                Text("\u{1F41B}")
                                    .fontSize(20)
                                Column {
                                    Text("报告问题")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("提交Bug反馈")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 16)
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

                        // 使用条款
                        ListItem {
                            Row {
                                Text("\u{1F4DC}")
                                    .fontSize(20)
                                Column {
                                    Text("使用条款")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("服务条款")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 16)
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

                        // 隐私政策
                        ListItem {
                            Row {
                                Text("\u{1F512}")
                                    .fontSize(20)
                                Column {
                                    Text("隐私政策")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("隐私政策")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 16)
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

                        // 关于
                        ListItem {
                            Row {
                                Text("\u{2139}")
                                    .fontSize(20)
                                Column {
                                    Text("关于")
                                        .fontSize(16)
                                        .fontColor(0x333333)
                                    Text("版本和版权信息")
                                        .fontSize(12)
                                        .fontColor(0x999999)
                                }
                                .margin(left: 16)
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
                    }
                    .width(100.percent)
                    .divider(strokeWidth: 1, color: 0xEEEEEE, startMargin: 56, endMargin: 0)
                    .backgroundColor(0xFFFFFF)

                    // 关于项（底部显示版本和版权）
                    Column {
                        Text(this.appVersion)
                            .fontSize(14)
                            .fontColor(0x999999)
                        Text("\u{00A9} ${this.copyrightYear} ${this.copyrightHolder}")
                            .fontSize(12)
                            .fontColor(0x999999)
                            .margin(top: 4)
                    }
                    .width(100.percent)
                    .padding(top: 24, bottom: 24)
                    .alignItems(HorizontalAlign.Center)
                }
                .width(100.percent)
            }
            .width(100.percent)
            .layoutWeight(1)
            .backgroundColor(0xF5F5F5)
        }
        .width(100.percent)
        .height(100.percent)
        .padding(top: 0)
        .backgroundColor(0xFFFFFF)
    }
}
