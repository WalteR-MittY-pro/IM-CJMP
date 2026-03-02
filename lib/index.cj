package ohos_app_cangjie_entry

internal import ohos.base.LengthProp
internal import ohos.state_manage.SubscriberManager
internal import ohos.state_manage.ObservedProperty
internal import ohos.state_manage.LocalStorage
internal import ohos.state_manage.ViewStackProcessor
import ohos.state_macro_manage.*
public import ohos.component.*
public import ohos.router.*
import ohos_app_cangjie_entry.pages.*
import ohos_app_cangjie_entry.pages.ChatSettingsPage



@Entry
@Component
class EntryView {
    var controller: TabsController = TabsController()
    @State
    var currentIndex: Int32 = 1  // Chats 默认选中
    @State
    var isLoggedIn: Bool = false  // 登录状态

    func build() {
        Column {
            if (this.isLoggedIn) {
                // 已登录，显示主界面
                Tabs(BarPosition.End, this.controller) {
                    TabContent {
                        // 联系人页面
                        ContactsPage()
                    }
                    .tabBar("👤 联系人")

                    TabContent {
                        ChatsPage()
                    }
                    .tabBar("💬 聊天")

                    TabContent {
                        SettingsPage()
                    }
                    .tabBar("⚙️ 设置")
                }
                .vertical(false)
                .scrollable(false)
                .barMode(BarMode.Fixed)
                .barWidth(100.percent)
                .barHeight(56)
                .animationDuration(200)
                .width(100.percent)
                .height(100.percent)
                .backgroundColor(0xFFFFFF)
                .onChange({index: Int32 => this.currentIndex = index})
            } else {
                // 未登录，显示登录页面
                LoginPage(onLoginSuccess: { => this.isLoggedIn = true })
            }
        }
        .width(100.percent)
        .height(100.percent)
    }
}
