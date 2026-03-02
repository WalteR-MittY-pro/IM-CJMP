package ohos_app_cangjie_entry.pages

import ohos.state_macro_manage.*
import ohos.component.*
public var image_url: String = "resources/base/media"
// 登录页面组件
@Component
public class LoginPage {
    // 登录成功回调
    var onLoginSuccess: () -> Unit = { => }

    // 输入状态
    @State
    var phoneNumber: String = ""
    @State
    var verificationCode: String = ""
    @State
    var errorMessage: String = ""
    @State
    var isButtonEnabled: Bool = false

    // 验证手机号格式 - 使用substring方法
    func validatePhone(phone: String): Bool {
        if (phone.size != 11) {
            return false
        }
        // 使用range indexing获取前两位
        let prefix = phone[0..2]
        let validPrefixes = ["13", "14", "15", "16", "17", "18", "19"]
        for (p in validPrefixes) {
            if (prefix == p) {
                return true
            }
        }
        return false
    }

    // 验证验证码格式
    func validateCode(code: String): Bool {
        return code.size == 6
    }

    // 更新按钮启用状态
    func updateButtonState() {
        this.isButtonEnabled = validatePhone(this.phoneNumber) && validateCode(this.verificationCode)
    }

    // 处理手机号输入
    func onPhoneInput(text: String) {
        this.phoneNumber = text
        this.errorMessage = ""
        updateButtonState()
    }

    // 处理验证码输入
    func onCodeInput(text: String) {
        this.verificationCode = text
        this.errorMessage = ""
        updateButtonState()
    }

    // 处理登录按钮点击
    func onLoginClick() {
        // 验证手机号
        if (this.phoneNumber.size == 0) {
            this.errorMessage = "请输入手机号"
            return
        }
        if (!validatePhone(this.phoneNumber)) {
            this.errorMessage = "请输入正确的手机号"
            return
        }

        // 验证验证码
        if (this.verificationCode.size == 0) {
            this.errorMessage = "请输入验证码"
            return
        }
        if (this.verificationCode.size < 6) {
            this.errorMessage = "验证码为6位数字"
            return
        }

        // 调用Mock验证
        let isValid = MockData.validateLogin(this.phoneNumber, this.verificationCode)
        if (isValid) {
            // 登录成功
            this.onLoginSuccess()
        } else {
            this.errorMessage = "验证码错误，请重新输入"
        }
    }

    func build() {
        Column {
            // App Logo - 居中偏上
        Flex(FlexParams(direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceAround)){
                Image("resources/base/media/icon.png").height(120).width(120).margin(top: 100)
            }
            // Logo文字
            Text("")
                .fontSize(72)

            Blank()
                .height(80)

            // 手机号输入框
            Row {
                Text("+86")
                    .fontSize(16)
                    .fontColor(0x333333)
                    .margin(right: 8)
                TextInput(placeholder: "请输入手机号")
                    .width(100.percent)
                    .height(48)
                    .backgroundColor(0xFFFFFF)
                    .placeholderColor(0x999999)
                    .fontColor(0x333333)
                    .onChange({ text: String => this.onPhoneInput(text) })
            }
            .width(80.percent)
            .height(48)
            .padding(left: 16, right: 16)
            .backgroundColor(0xFFFFFF)
            .border(width: 1, color: 0xE0E0E0, radius: 8)

            Blank()
                .height(16)

            // 验证码输入框
            TextInput(placeholder: "请输入验证码")
                .width(80.percent)
                .height(48)
                .backgroundColor(0xFFFFFF)
                .placeholderColor(0x999999)
                .fontColor(0x333333)
                .onChange({ text: String => this.onCodeInput(text) })

            Blank()
                .height(24)

            // 错误提示
            if (this.errorMessage.size > 0) {
                Text(this.errorMessage)
                    .fontSize(14)
                    .fontColor(0xF44336)
                    .margin(bottom: 8)
            }

            // 登录按钮
            Button("登录")
                .width(80.percent)
                .height(48)
                .backgroundColor(if (this.isButtonEnabled) { 0x2196F3 } else { 0xCCCCCC })
                .fontColor(0xFFFFFF)
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
                .borderRadius(24)
                .enabled(this.isButtonEnabled)
                .onClick({ event: ClickEvent => this.onLoginClick() })

            Blank()
                .height(16)

            // 提示文字
            Text("未注册的手机号将自动创建账号")
                .fontSize(12)
                .fontColor(0x999999)
        }
        .width(100.percent)
        .height(100.percent)
        .backgroundColor(0xF5F5F5)
        .alignItems(HorizontalAlign.Center)
    }
}

@Component
class images{
    func build() {
        Flex(){Image("../../images/icon.png").height(50).width(50).margin(top: 20)
        }
    }
}