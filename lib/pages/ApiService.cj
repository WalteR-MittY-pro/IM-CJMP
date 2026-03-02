package ohos_app_cangjie_entry.pages

// 聊天列表项 API 数据
public struct ChatApiItem {
    public let id: String
    public let name: String
    public let avatar: String
    public let lastMsg: String
    public let lastTime: String
    public let unreadCount: Int32

    public init(id: String, name: String, avatar: String, lastMsg: String, lastTime: String, unreadCount: Int32) {
        this.id = id
        this.name = name
        this.avatar = avatar
        this.lastMsg = lastMsg
        this.lastTime = lastTime
        this.unreadCount = unreadCount
    }

    public init() {
        this.id = ""
        this.name = ""
        this.avatar = ""
        this.lastMsg = ""
        this.lastTime = ""
        this.unreadCount = 0
    }
}

// 消息 API 数据
public struct MessageApiItem {
    public let id: String
    public let msgType: String    // "text", "image", "voice"
    public let content: String
    public let sender: String
    public let senderName: String
    public let time: String
    public let status: String     // "sending", "sent", "delivered", "read"

    public init(id: String, msgType: String, content: String, sender: String, senderName: String, time: String, status: String) {
        this.id = id
        this.msgType = msgType
        this.content = content
        this.sender = sender
        this.senderName = senderName
        this.time = time
        this.status = status
    }

    public init() {
        this.id = ""
        this.msgType = "text"
        this.content = ""
        this.sender = ""
        this.senderName = ""
        this.time = ""
        this.status = "sent"
    }
}

// 联系人 API 数据
public struct ContactApiItem {
    public let id: String
    public let name: String
    public let username: String
    public let avatar: String
    public let online: Bool
    public let lastSeen: String

    public init(id: String, name: String, username: String, avatar: String, online: Bool, lastSeen: String) {
        this.id = id
        this.name = name
        this.username = username
        this.avatar = avatar
        this.online = online
        this.lastSeen = lastSeen
    }

    public init() {
        this.id = ""
        this.name = ""
        this.username = ""
        this.avatar = ""
        this.online = false
        this.lastSeen = ""
    }
}

// 聊天列表 API 响应
public class ChatsResponse {
    public let code: Int32
    public let message: String
    public let data: Array<ChatApiItem>

    public init(code: Int32, message: String, data: Array<ChatApiItem>) {
        this.code = code
        this.message = message
        this.data = data
    }

    public func isSuccess(): Bool {
        return this.code == 0
    }
}

// 消息列表 API 响应
public class MessagesResponse {
    public let code: Int32
    public let message: String
    public let data: Array<MessageApiItem>

    public init(code: Int32, message: String, data: Array<MessageApiItem>) {
        this.code = code
        this.message = message
        this.data = data
    }

    public func isSuccess(): Bool {
        return this.code == 0
    }
}

// 联系人列表 API 响应
public class ContactsResponse {
    public let code: Int32
    public let message: String
    public let data: Array<ContactApiItem>

    public init(code: Int32, message: String, data: Array<ContactApiItem>) {
        this.code = code
        this.message = message
        this.data = data
    }

    public func isSuccess(): Bool {
        return this.code == 0
    }
}

// API 服务类 - 模拟网络请求
public class ApiService {

    // 模拟网络延迟
    static func simulateDelay() {
        // 实际项目中可使用 async/await
    }

    // GET /api/v1/chats - 获取聊天列表
    public static func getChats(): ChatsResponse {
        simulateDelay()
        
        // 返回模拟数据
        let result: Array<ChatApiItem> = [
            ChatApiItem("1", "关爱少女成长协会", "", "你好", "12:30", 3),
            ChatApiItem("2", "PSA-安全公告专栏", "", "安全提醒", "11:00", 0),
            ChatApiItem("3", "非正常人类研究中心", "", "研究讨论", "10:30", 5),
            ChatApiItem("4", "Telegram Developers", "", "技术分享", "09:45", 1),
            ChatApiItem("5", "妈妈", "", "注意身体", "昨天", 2),
            ChatApiItem("6", "李明", "", "今晚吃饭？", "昨天", 0),
            ChatApiItem("7", "编程技术分享", "", "新框架发布", "前天", 2),
            ChatApiItem("8", "每日新闻", "", "今日要闻", "前天", 0),
            ChatApiItem("9", "游戏交流群", "", "开黑组队", "3天前", 10),
            ChatApiItem("10", "音乐分享", "", "新歌推荐", "3天前", 1),
            ChatApiItem("11", "考研学习交流", "", "复习资料", "4天前", 3),
            ChatApiItem("12", "健身打卡", "", "今天运动了吗", "5天前", 0),
            ChatApiItem("13", "旅行爱好者", "", "周末去爬山", "1周前", 2),
            ChatApiItem("14", "美食分享", "", "私房菜推荐", "1周前", 1),
            ChatApiItem("15", "电影推荐", "", "最近看什么", "1周前", 0)
        ]
        
        return ChatsResponse(0, "success", result)
    }

    // GET /api/v1/chats/{id}/messages - 获取消息列表
    public static func getMessages(chatId: String): MessagesResponse {
        return getMessages(chatId, 1, 20)
    }

    // 获取消息列表（带分页）
    public static func getMessages(chatId: String, page: Int32, pageSize: Int32): MessagesResponse {
        simulateDelay()
        
        // 返回模拟数据
        let result: Array<MessageApiItem> = [
            MessageApiItem("1", "text", "你好", "user1", "用户1", "12:30", "read"),
            MessageApiItem("2", "text", "有什么新鲜事吗？", "user2", "用户2", "12:25", "read"),
            MessageApiItem("3", "text", "今天天气不错", "user1", "用户1", "12:20", "read"),
            MessageApiItem("4", "text", "晚上一起吃饭吧", "user2", "用户2", "11:50", "read"),
            MessageApiItem("5", "text", "好的，去哪里？", "user1", "用户1", "11:45", "read"),
            MessageApiItem("6", "text", "老地方吧", "user2", "用户2", "11:40", "read"),
            MessageApiItem("7", "text", "没问题", "user1", "用户1", "11:35", "read"),
            MessageApiItem("8", "text", "那就这么定了", "user2", "用户2", "11:30", "read")
        ]
        
        return MessagesResponse(0, "success", result)
    }

    // POST /api/v1/chats/{id}/messages - 发送消息
    public static func sendMessage(chatId: String, content: String): MessagesResponse {
        simulateDelay()
        
        // 创建新消息
        let newMessage = MessageApiItem(
            "100",
            "text",
            content,
            "me",
            "我",
            "12:35",
            "sent"
        )
        
        let result: Array<MessageApiItem> = [newMessage]
        return MessagesResponse(0, "消息发送成功", result)
    }

    // GET /api/v1/contacts - 获取联系人列表
    public static func getContacts(): ContactsResponse {
        simulateDelay()
        
        // 返回模拟数据
        let result: Array<ContactApiItem> = [
            ContactApiItem("1", "Alice", "alice", "", true, ""),
            ContactApiItem("2", "Bob", "bob", "", false, "5分钟前"),
            ContactApiItem("3", "Charlie", "charlie", "", true, ""),
            ContactApiItem("4", "David", "david", "", false, "1小时前"),
            ContactApiItem("5", "Emma", "emma", "", true, ""),
            ContactApiItem("6", "Frank", "frank", "", false, "30分钟前"),
            ContactApiItem("7", "Grace", "grace", "", true, ""),
            ContactApiItem("8", "Henry", "henry", "", false, "2小时前"),
            ContactApiItem("9", "Iris", "iris", "", true, ""),
            ContactApiItem("10", "Jack", "jack", "", false, "昨天"),
            ContactApiItem("11", "Kevin", "kevin", "", true, ""),
            ContactApiItem("12", "Lily", "lily", "", false, "10分钟前"),
            ContactApiItem("13", "Michael", "michael", "", true, ""),
            ContactApiItem("14", "Nancy", "nancy", "", false, "3小时前"),
            ContactApiItem("15", "Olivia", "olivia", "", true, ""),
            ContactApiItem("16", "Peter", "peter", "", false, "昨天"),
            ContactApiItem("17", "Quinn", "quinn", "", true, ""),
            ContactApiItem("18", "Rachel", "rachel", "", false, "5分钟前"),
            ContactApiItem("19", "Steve", "steve", "", true, ""),
            ContactApiItem("20", "Tom", "tom", "", false, "1天前"),
            ContactApiItem("21", "Uma", "uma", "", true, ""),
            ContactApiItem("22", "Victor", "victor", "", false, "20分钟前"),
            ContactApiItem("23", "Wendy", "wendy", "", true, ""),
            ContactApiItem("24", "Xavier", "xavier", "", false, "6小时前"),
            ContactApiItem("25", "Yvonne", "yvonne", "", true, ""),
            ContactApiItem("26", "Zoe", "zoe", "", false, "15分钟前"),
            ContactApiItem("27", "李明", "liming", "", true, ""),
            ContactApiItem("28", "王芳", "wangfang", "", false, "2分钟前"),
            ContactApiItem("29", "张伟", "zhangwei", "", true, ""),
            ContactApiItem("30", "刘洋", "liuyang", "", false, "1小时前")
        ]
        
        return ContactsResponse(0, "success", result)
    }
}
