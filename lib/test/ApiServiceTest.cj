package ohos_app_cangjie_entry.test

// 导入被测试的模块
import ohos_app_cangjie_entry.pages.{ChatsResponse, MessagesResponse, ContactsResponse, ApiService}
import ohos_app_cangjie_entry.pages.{ChatApiItem, MessageApiItem, ContactApiItem}
import ohos_app_cangjie_entry.pages.{MockData, ContactData, Message}
import std.collection.ArrayList

// 测试入口函数
// 运行命令: cjpm run

main(): Int64 {
    println("========================================")
    println("开始运行 telegram_cjmp 单元测试")
    println("========================================")

    var passed = 0
    var failed = 0

    // ==================== ApiService Tests ====================
    println("\n========== ApiService Tests ==========")

    // 测试 ApiService.getChats - 返回成功响应
    let response1 = ApiService.getChats()
    if (response1.isSuccess()) {
        println("[PASS] ApiService.getChats: returns success response")
        passed++
    } else {
        println("[FAIL] ApiService.getChats: returns success response")
        failed++
    }

    // 测试返回非空数据
    if (response1.data.size > 0) {
        println("[PASS] ApiService.getChats: returns non-empty data, size=${response1.data.size}")
        passed++
    } else {
        println("[FAIL] ApiService.getChats: returns non-empty data")
        failed++
    }

    // 验证包含特定聊天
    var found = false
    for (i in 0..response1.data.size) {
        if (response1.data[i].name == "关爱少女成长协会") {
            found = true
            break
        }
    }
    if (found) {
        println("[PASS] ApiService.getChats: contains expected chat '关爱少女成长协会'")
        passed++
    } else {
        println("[FAIL] ApiService.getChats: contains expected chat")
        failed++
    }

    // 测试 ApiService.getMessages
    let response2 = ApiService.getMessages("1")
    if (response2.isSuccess()) {
        println("[PASS] ApiService.getMessages: returns success response")
        passed++
    } else {
        println("[FAIL] ApiService.getMessages: returns success response")
        failed++
    }

    if (response2.data.size > 0) {
        println("[PASS] ApiService.getMessages: returns non-empty data, size=${response2.data.size}")
        passed++
    } else {
        println("[FAIL] ApiService.getMessages: returns non-empty data")
        failed++
    }

    // 测试带分页的 getMessages
    let response3 = ApiService.getMessages("1", 1, 20)
    if (response3.isSuccess()) {
        println("[PASS] ApiService.getMessages with pagination: returns success")
        passed++
    } else {
        println("[FAIL] ApiService.getMessages with pagination: returns success")
        failed++
    }

    // 测试 sendMessage
    let response4 = ApiService.sendMessage("1", "Test message")
    if (response4.isSuccess()) {
        println("[PASS] ApiService.sendMessage: returns success response")
        passed++
    } else {
        println("[FAIL] ApiService.sendMessage: returns success response")
        failed++
    }

    // 验证发送的消息内容正确
    let testContent = "Hello World"
    let response5 = ApiService.sendMessage("1", testContent)
    if (response5.data.size > 0 && response5.data[0].content == testContent) {
        println("[PASS] ApiService.sendMessage: returns message with correct content")
        passed++
    } else {
        println("[FAIL] ApiService.sendMessage: returns message with correct content")
        failed++
    }

    // ==================== MockData Tests ====================
    println("\n========== MockData Tests ==========")

    // 测试 MockData.getMessages - 关爱少女成长协会
    let messages1 = MockData.getMessages("关爱少女成长协会")
    if (messages1.size > 0) {
        println("[PASS] MockData.getMessages: returns messages for '关爱少女成长协会', size=${messages1.size}")
        passed++
    } else {
        println("[FAIL] MockData.getMessages: returns messages for '关爱少女成长协会'")
        failed++
    }

    // 测试 MockData.getMessages - 妈妈
    let messages2 = MockData.getMessages("妈妈")
    if (messages2.size > 0) {
        println("[PASS] MockData.getMessages: returns messages for '妈妈', size=${messages2.size}")
        passed++
    } else {
        println("[FAIL] MockData.getMessages: returns messages for '妈妈'")
        failed++
    }

    // 测试 MockData.getMessages - 李明
    let messages3 = MockData.getMessages("李明")
    if (messages3.size > 0) {
        println("[PASS] MockData.getMessages: returns messages for '李明', size=${messages3.size}")
        passed++
    } else {
        println("[FAIL] MockData.getMessages: returns messages for '李明'")
        failed++
    }

    // 测试 MockData.getMessages - 非正常人类研究中心
    let messages4 = MockData.getMessages("非正常人类研究中心")
    if (messages4.size > 0) {
        println("[PASS] MockData.getMessages: returns messages for '非正常人类研究中心', size=${messages4.size}")
        passed++
    } else {
        println("[FAIL] MockData.getMessages: returns messages for '非正常人类研究中心'")
        failed++
    }

    // 测试 MockData.getMessages - Telegram Developers
    let messages5 = MockData.getMessages("Telegram Developers")
    if (messages5.size > 0) {
        println("[PASS] MockData.getMessages: returns messages for 'Telegram Developers', size=${messages5.size}")
        passed++
    } else {
        println("[FAIL] MockData.getMessages: returns messages for 'Telegram Developers'")
        failed++
    }

    // 测试 MockData.getMessages - 未知聊天返回默认消息
    let messages6 = MockData.getMessages("不存在的聊天")
    if (messages6.size > 0) {
        println("[PASS] MockData.getMessages: returns default messages for unknown chat, size=${messages6.size}")
        passed++
    } else {
        println("[FAIL] MockData.getMessages: returns default messages for unknown chat")
        failed++
    }

    // 测试 MockData.addMessage
    var testMessages = ArrayList<Message>([
        Message("received", "Hello", "User1", "10:00")
    ])
    let newMsg = Message("sent", "World", "Me", "10:01")
    let result = MockData.addMessage(testMessages, newMsg)
    if (result.size == 2 && result[1].content == "World") {
        println("[PASS] MockData.addMessage: adds message to list correctly")
        passed++
    } else {
        println("[FAIL] MockData.addMessage: adds message to list correctly")
        failed++
    }

    // ==================== Message Tests ====================
    println("\n========== Message Tests ==========")

    // 测试 Message 完整初始化
    let msg1 = Message("received", "Test content", "User1", "10:00", "read")
    if (msg1.msgType == "received" && msg1.content == "Test content" && 
        msg1.sender == "User1" && msg1.time == "10:00" && msg1.status == "read") {
        println("[PASS] Message: init with all params")
        passed++
    } else {
        println("[FAIL] Message: init with all params")
        failed++
    }

    // 测试 Message 默认状态
    let msg2 = Message("sent", "Hello", "Me", "09:00")
    if (msg2.status == "sent") {
        println("[PASS] Message: has default status 'sent'")
        passed++
    } else {
        println("[FAIL] Message: has default status 'sent'")
        failed++
    }

    // 测试 Message 默认值
    let msg3 = Message()
    if (msg3.msgType == "" && msg3.content == "" && 
        msg3.sender == "" && msg3.status == "sent") {
        println("[PASS] Message: init with default values")
        passed++
    } else {
        println("[FAIL] Message: init with default values")
        failed++
    }

    // ==================== ContactData Tests ====================
    println("\n========== ContactData Tests ==========")

    // 测试 ContactData.getContacts
    let contacts = ContactData.getContacts()
    if (contacts.size > 0) {
        println("[PASS] ContactData.getContacts: returns non-empty list, size=${contacts.size}")
        passed++
    } else {
        println("[FAIL] ContactData.getContacts: returns non-empty list")
        failed++
    }

    // 验证联系人有效性
    if (contacts.size > 0 && contacts[0].name != "" && contacts[0].avatarLetter != "") {
        println("[PASS] ContactData.getContacts: contains valid contacts")
        passed++
    } else {
        println("[FAIL] ContactData.getContacts: contains valid contacts")
        failed++
    }

    // 验证包含在线联系人
    var hasOnline = false
    for (i in 0..contacts.size) {
        if (contacts[i].online) {
            hasOnline = true
            break
        }
    }
    if (hasOnline) {
        println("[PASS] ContactData.getContacts: contains online contacts")
        passed++
    } else {
        println("[FAIL] ContactData.getContacts: contains online contacts")
        failed++
    }

    // 测试结果汇总
    println("\n========================================")
    println("测试完成: passed=${passed}, failed=${failed}")
    println("========================================")

    if (failed > 0) {
        return 1
    }
    return 0
}
