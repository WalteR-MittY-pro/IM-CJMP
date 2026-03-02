package ohos_app_cangjie_entry.pages

import std.collection.ArrayList

// 消息数据结构
public struct Message {
    public let msgType: String  // "received" or "sent"
    public let content: String
    public let sender: String
    public let time: String
    public var status: String  // "sending", "sent", "delivered", "read", "failed"
    
    public init(msgType: String, content: String, sender: String, time: String, status: String) {
        this.msgType = msgType
        this.content = content
        this.sender = sender
        this.time = time
        this.status = status
    }
    
    public init(msgType: String, content: String, sender: String, time: String) {
        this.msgType = msgType
        this.content = content
        this.sender = sender
        this.time = time
        this.status = "sent"  // 默认状态
    }
    
    public init() {
        this.msgType = ""
        this.content = ""
        this.sender = ""
        this.time = ""
        this.status = "sent"
    }
}

// Mock 数据管理类
public class MockData {
    
    // 获取指定用户的消息列表
    public static func getMessages(chatName: String): ArrayList<Message> {
        // 根据聊天名称返回对应的消息列表
        if (chatName == "关爱少女成长协会") {
            return getChat1Messages()
        } else if (chatName == "PSA-安全公告专栏") {
            return getChat2Messages()
        } else if (chatName == "非正常人类研究中心") {
            return getChat3Messages()
        } else if (chatName == "Telegram Developers") {
            return getChat4Messages()
        } else if (chatName == "妈妈") {
            return getChat5Messages()
        } else if (chatName == "李明") {
            return getChat6Messages()
        } else if (chatName == "编程技术分享") {
            return getChat7Messages()
        } else if (chatName == "每日新闻") {
            return getChat8Messages()
        } else if (chatName == "游戏交流群") {
            return getChat9Messages()
        } else if (chatName == "音乐分享") {
            return getChat10Messages()
        } else if (chatName == "考研学习交流") {
            return getChat11Messages()
        } else if (chatName == "健身打卡") {
            return getChat12Messages()
        } else if (chatName == "旅行爱好者") {
            return getChat13Messages()
        } else if (chatName == "美食分享") {
            return getChat14Messages()
        } else if (chatName == "电影推荐") {
            return getChat15Messages()
        } else if (chatName == "二手交易") {
            return getChat16Messages()
        } else if (chatName == "宠物交流") {
            return getChat17Messages()
        } else if (chatName == "前端开发") {
            return getChat18Messages()
        } else if (chatName == "产品经理交流") {
            return getChat19Messages()
        } else if (chatName == "AI 人工智能") {
            return getChat20Messages()
        } else {
            return getDefaultMessages()
        }
    }
    
    // 1. 关爱少女成长协会
    static func getChat1Messages(): ArrayList<Message> {
        return ArrayList<Message>([
            Message("received", "活动结束后一起吃饭吧", "小明", "10:00"),
            Message("sent", "好主意！", "Me", "10:02"),
            Message("received", "我推荐附近一家餐厅", "小红", "10:10"),
            Message("received", "环境不错，价格实惠", "小华", "10:12"),
            Message("sent", "那就定了，活动后见！", "Me", "10:15"),
            Message("received", "今天大家表现都很棒", "小明", "10:20"),
            Message("sent", "是的，孩子们很开心", "Me", "10:22"),
            Message("received", "下次活动什么时候？", "小红", "10:25"),
            Message("sent", "下周六同一时间", "Me", "10:28"),
            Message("received", "太好了，我会准时参加", "小华", "10:30"),
            Message("sent", "需要准备什么材料吗？", "Me", "10:32"),
            Message("received", "还是带一些文具吧", "小明", "10:35"),
            Message("received", "我可以带一些绘本", "小红", "10:38"),
            Message("sent", "那就这么决定了", "Me", "10:40"),
            Message("received", "下次见，大家辛苦了", "小明", "10:45"),
            Message("sent", "辛苦了，下次见！", "Me", "10:48"),
            Message("received", "大家路上注意安全", "小红", "10:50"),
            Message("received", "明天见", "小华", "10:52"),
            Message("sent", "明天见", "Me", "10:55"),
            Message("received", "拜拜", "小明", "11:00")
        ])
    }
    
    // 2. PSA-安全公告专栏
    static func getChat2Messages(): ArrayList<Message> {
        return ArrayList<Message>([
            Message("received", "【安全提醒】请勿点击不明链接", "官方", "08:00"),
            Message("received", "近期有用户反馈收到钓鱼短信", "官方", "08:05"),
            Message("sent", "收到，会注意的", "Me", "08:10"),
            Message("received", "【使用虚拟号注册小号建议】", "官方", "08:30"),
            Message("received", "建议使用官方渠道注册", "官方", "08:31"),
            Message("sent", "好的，谢谢提醒", "Me", "08:35"),
            Message("received", "【账号安全】请定期修改密码", "官方", "09:00"),
            Message("received", "建议开启两步验证", "官方", "09:01"),
            Message("sent", "已经开启了", "Me", "09:05"),
            Message("received", "【隐私保护】不要泄露个人信息", "官方", "10:00"),
            Message("received", "警惕陌生人的好友请求", "官方", "10:01"),
            Message("sent", "明白", "Me", "10:05"),
            Message("received", "【更新通知】新版本已发布", "官方", "11:00"),
            Message("received", "请及时更新以获得更好体验", "官方", "11:01"),
            Message("sent", "好的，马上更新", "Me", "11:05"),
            Message("received", "【网络诈骗防范】凡是要求转账的都是诈骗", "官方", "12:00"),
            Message("received", "请保护好自己的验证码", "官方", "12:01"),
            Message("sent", "收到，永远不会告诉别人验证码", "Me", "12:05"),
            Message("received", "【账户异常】如发现异常请立即报警", "官方", "13:00"),
            Message("received", "官方不会主动索要您的密码", "官方", "13:01")
        ])
    }
    
    // 3. 非正常人类研究中心
    static func getChat3Messages(): ArrayList<Message> {
        return ArrayList<Message>([
            Message("received", "下周有个讲座", "思无涯", "13:28"),
            Message("received", "关于梦境解析的", "思无涯", "13:29"),
            Message("sent", "我想参加！", "Me", "13:30"),
            Message("received", "好的，我帮你报名", "思无涯", "13:31"),
            Message("received", "地点在研究中心三楼", "思无涯", "13:32"),
            Message("sent", "收到，下周见！", "Me", "13:35"),
            Message("received", "今天研究什么课题？", "思无涯", "14:00"),
            Message("sent", "准备研究人类的睡眠模式", "Me", "14:05"),
            Message("received", "有趣，需要数据吗？", "思无涯", "14:10"),
            Message("sent", "需要，你有相关资料吗？", "Me", "14:12"),
            Message("received", "我有一些研究报告", "思无涯", "14:15"),
            Message("received", "稍等我找找", "思无涯", "14:16"),
            Message("sent", "好的，不急", "Me", "14:20"),
            Message("received", "找到了，稍后发给你", "思无涯", "14:25"),
            Message("sent", "太感谢了！", "Me", "14:26"),
            Message("received", "还有什么需要吗？", "思无涯", "14:30"),
            Message("sent", "暂时不需要了", "Me", "14:32"),
            Message("received", "有问题随时找我", "思无涯", "14:35"),
            Message("sent", "好的，谢谢", "Me", "14:38"),
            Message("received", "不客气", "思无涯", "14:40")
		])
    }
    
    // 4. Telegram Developers
    static func getChat4Messages(): ArrayList<Message> {
        return ArrayList<Message>([
            Message("received", "Next meeting is Friday", "Dev1", "12:40"),
            Message("sent", "I will be there!", "Me", "12:45"),
            Message("received", "Welcome to the group!", "Admin", "12:00"),
            Message("sent", "Thanks! Happy to be here", "Me", "12:05"),
            Message("received", "Feel free to ask questions", "Admin", "12:10"),
            Message("received", "We discuss Telegram API here", "Admin", "12:11"),
            Message("sent", "I have a question about bots", "Me", "12:15"),
            Message("received", "Sure, go ahead", "Dev1", "12:16"),
            Message("sent", "How to handle webhooks?", "Me", "12:17"),
            Message("received", "You need a secure HTTPS endpoint", "Dev1", "12:20"),
            Message("received", "We have docs on that", "Dev2", "12:21"),
            Message("sent", "I will check it out", "Me", "12:25"),
            Message("received", "Let us know if you need help", "Admin", "12:30"),
            Message("received", "We have weekly meetings too", "Admin", "12:31"),
            Message("sent", "Sounds great!", "Me", "12:35"),
            Message("received", "What time is the meeting?", "Dev2", "12:50"),
            Message("sent", "2 PM local time", "Me", "12:52"),
            Message("received", "See you there!", "Admin", "12:55"),
            Message("sent", "Looking forward to it!", "Me", "13:00"),
            Message("received", "Don't forget to prepare your questions", "Dev1", "13:05")
		])
    }
    
    // 5. 妈妈
    static func getChat5Messages(): ArrayList<Message> {
        return ArrayList<Message>([
            Message("received", "记得带伞，今天有雨", "妈妈", "18:00"),
            Message("sent", "好的，谢谢妈妈关心", "Me", "18:05"),
            Message("received", "早饭吃了吗？", "妈妈", "07:00"),
            Message("sent", "吃了，吃的包子", "Me", "07:05"),
            Message("received", "记得喝牛奶", "妈妈", "07:06"),
            Message("sent", "知道了", "Me", "07:10"),
            Message("received", "今天天气冷，多穿点", "妈妈", "08:00"),
            Message("sent", "好的，我穿了厚外套", "Me", "08:05"),
            Message("received", "工作别太累", "妈妈", "10:00"),
            Message("sent", "放心吧，我会注意的", "Me", "10:05"),
            Message("received", "中午记得按时吃饭", "妈妈", "11:30"),
            Message("sent", "好的妈妈", "Me", "11:35"),
            Message("received", "晚上回来吃饭吗？", "妈妈", "17:00"),
            Message("sent", "可能晚点回去", "Me", "17:05"),
            Message("received", "好的，饭菜给你留着", "妈妈", "17:10"),
            Message("received", "路上小心", "妈妈", "18:10"),
            Message("sent", "会的，妈", "Me", "18:12"),
            Message("received", "到了给我发消息", "妈妈", "18:15"),
            Message("sent", "好的", "Me", "18:18"),
            Message("received", "爱你", "妈妈", "18:20")
		])
    }
    
    // 6. 李明
    static func getChat6Messages(): ArrayList<Message> {
        return ArrayList<Message>([
            Message("received", "好的，到时候见", "李明", "10:35"),
            Message("received", "最近怎么样？", "李明", "10:00"),
            Message("sent", "还不错，你呢？", "Me", "10:05"),
            Message("received", "我也挺好的", "李明", "10:06"),
            Message("received", "周末一起吃饭吗？", "李明", "10:10"),
            Message("sent", "好啊，去哪里？", "Me", "10:12"),
            Message("received", "新开了一家火锅店", "李明", "10:15"),
            Message("sent", "可以，什么时候？", "Me", "10:16"),
            Message("received", "周六晚上如何？", "李明", "10:20"),
            Message("sent", "没问题", "Me", "10:22"),
            Message("received", "那我先订位", "李明", "10:25"),
            Message("sent", "好的，订几人位？", "Me", "10:26"),
            Message("received", "就我们两个吧", "李明", "10:28"),
            Message("received", "时间定在6点", "李明", "10:30"),
            Message("sent", "可以，到时候见", "Me", "10:32"),
            Message("received", "不见不散", "李明", "10:40"),
            Message("sent", "好的", "Me", "10:42"),
            Message("received", "那家店地址在哪里？", "李明", "10:45"),
            Message("sent", "市中心步行街78号", "Me", "10:48"),
            Message("received", "知道了", "李明", "10:50")
		])
    }
    
    // 7. 编程技术分享
    static func getChat7Messages(): ArrayList<Message> {
        return ArrayList<Message>([
            Message("received", "下周讲Go的新特性", "管理员", "11:36"),
            Message("sent", "期待！", "Me", "11:40"),
            Message("received", "今天分享：Rust 2025 新特性", "管理员", "11:00"),
            Message("received", "Rust 新增了异步迭代器", "管理员", "11:01"),
            Message("sent", "这个很实用！", "Me", "11:05"),
            Message("received", "还有新的宏系统改进", "管理员", "11:10"),
            Message("received", "编译速度也提升了30%", "管理员", "11:11"),
            Message("sent", "太棒了，迫不及待想试试", "Me", "11:15"),
            Message("received", "有人用过新的错误处理吗？", "用户A", "11:20"),
            Message("sent", "我试了一下，比以前简洁多了", "Me", "11:22"),
            Message("received", "求分享代码示例", "用户A", "11:25"),
            Message("received", "等下我发个gist", "用户B", "11:26"),
            Message("sent", "我也想学习一下", "Me", "11:28"),
            Message("received", "gist链接已发", "用户B", "11:30"),
            Message("received", "有问题可以随时问", "管理员", "11:35"),
            Message("sent", "谢谢管理员", "Me", "11:42"),
            Message("received", "不客气", "管理员", "11:45"),
            Message("sent", "下次的分享主题是什么？", "Me", "11:50"),
            Message("received", "还没确定，你可以提议", "管理员", "11:55"),
            Message("sent", "好的，我想听Web3开发", "Me", "12:00")
		])
    }
    
    // 8. 每日新闻
    static func getChat8Messages(): ArrayList<Message> {
        return ArrayList<Message>([
            Message("received", "天气预报：明日降温", "新闻", "12:00"),
            Message("received", "注意保暖", "新闻", "12:01"),
            Message("sent", "收到，谢谢提醒", "Me", "12:05"),
            Message("received", "今日要闻：科技行业重大突破", "新闻", "08:00"),
            Message("received", "AI芯片性能提升200%", "新闻", "08:01"),
            Message("sent", "这个新闻很重要", "Me", "08:05"),
            Message("received", "股市开盘大涨", "新闻", "09:00"),
            Message("received", "科技板块领涨", "新闻", "09:01"),
            Message("sent", "经济形势向好", "Me", "09:05"),
            Message("received", "新能源汽车销量创新高", "新闻", "10:00"),
            Message("received", "环保政策加码", "新闻", "10:01"),
            Message("sent", "绿色发展趋势明确", "Me", "10:05"),
            Message("received", "国际会议今日召开", "新闻", "11:00"),
            Message("received", "多国领导人出席", "新闻", "11:01"),
            Message("sent", "关注后续报道", "Me", "11:05"),
            Message("received", "明日天气：晴转多云", "新闻", "12:10"),
            Message("sent", "适合出行", "Me", "12:15"),
            Message("received", "今日金价：每克500元", "新闻", "13:00"),
            Message("sent", "了解", "Me", "13:05"),
            Message("received", "明日限行：尾号5和6", "新闻", "14:00")
		])
    }
    
    // 9. 游戏交流群
    static func getChat9Messages(): ArrayList<Message> {
        return ArrayList<Message>([
            Message("received", "记得准时啊", "玩家A", "18:25"),
            Message("received", "拉群组队", "玩家C", "18:30"),
            Message("sent", "好的，马上", "Me", "18:32"),
            Message("received", "今晚开黑，有人来吗？", "玩家A", "18:00"),
            Message("sent", "我来！", "Me", "18:02"),
            Message("received", "加我一个", "玩家B", "18:05"),
            Message("received", "几点开始？", "玩家C", "18:06"),
            Message("sent", "8点如何？", "Me", "18:08"),
            Message("received", "可以", "玩家A", "18:10"),
            Message("received", "没问题", "玩家B", "18:11"),
            Message("received", "玩什么游戏？", "玩家C", "18:12"),
            Message("sent", "排位赛？", "Me", "18:13"),
            Message("received", "好，冲分！", "玩家A", "18:15"),
            Message("received", "我先去吃饭", "玩家B", "18:20"),
            Message("sent", "好的，一会见", "Me", "18:22"),
            Message("received", "我准备好了", "玩家C", "18:35"),
            Message("sent", "等我5分钟", "Me", "18:38"),
            Message("received", "OK", "玩家A", "18:40"),
            Message("sent", "上号！", "Me", "18:45"),
            Message("received", "来了来了", "玩家B", "18:50")
		])
    }
    
    // 10. 音乐分享
    static func getChat10Messages(): ArrayList<Message> {
        return ArrayList<Message>([
            Message("received", "记得关注哦", "音乐家A", "10:40"),
            Message("sent", "期待！", "Me", "10:42"),
            Message("received", "分享了一首歌曲", "音乐家A", "10:00"),
            Message("received", "这首歌很好听", "音乐家A", "10:01"),
            Message("sent", "旋律不错", "Me", "10:05"),
            Message("received", "最近在听什么？", "音乐家A", "10:10"),
            Message("sent", "在听古典音乐", "Me", "10:12"),
            Message("received", "品味不错", "音乐家A", "10:15"),
            Message("received", "推荐一个歌手给你", "音乐家A", "10:20"),
            Message("sent", "好的，谁？", "Me", "10:22"),
            Message("received", "坂本龙一", "音乐家A", "10:25"),
            Message("received", "他的作品很治愈", "音乐家A", "10:26"),
            Message("sent", "我去听听看", "Me", "10:28"),
            Message("received", "还有个爵士乐频道", "音乐家A", "10:30"),
            Message("received", "晚上会更新", "音乐家A", "10:31"),
            Message("sent", "太好了，谢谢推荐", "Me", "10:35"),
            Message("received", "不客气", "音乐家A", "10:45"),
            Message("sent", "你一般用什么听歌？", "Me", "10:50"),
            Message("received", "网易云音乐", "音乐家A", "10:55"),
            Message("sent", "我也是", "Me", "11:00")
		])
    }
    
    // 11. 考研学习交流
    static func getChat11Messages(): ArrayList<Message> {
        return ArrayList<Message>([
            Message("received", "下次分享会讨论这个", "学习委员", "10:10"),
            Message("sent", "期待！", "Me", "10:12"),
            Message("received", "今天你学习了吗？", "学习委员", "07:00"),
            Message("sent", "正在背单词", "Me", "07:05"),
            Message("received", "加油！坚持就是胜利", "学习委员", "07:06"),
            Message("received", "数学复习到哪里了？", "同学A", "08:00"),
            Message("sent", "高数部分快完了", "Me", "08:05"),
            Message("received", "线性代数呢？", "同学A", "08:06"),
            Message("sent", "刚开始", "Me", "08:10"),
            Message("received", "一起刷题吗？", "同学A", "08:12"),
            Message("sent", "好啊，什么时候？", "Me", "08:15"),
            Message("received", "下午2点图书馆见", "同学A", "08:18"),
            Message("sent", "没问题", "Me", "08:20"),
            Message("received", "英语阅读有什么技巧吗？", "同学B", "10:00"),
            Message("received", "我觉得要先看题目", "同学B", "10:01"),
            Message("sent", "同意，带着问题找答案", "Me", "10:05"),
            Message("received", "政治背完了吗？", "同学C", "10:15"),
            Message("sent", "还差近代史", "Me", "10:18"),
            Message("received", "我这里有资料分享", "同学C", "10:20"),
            Message("sent", "谢谢！", "Me", "10:22")
		])
    }
    
    // 12. 健身打卡
    static func getChat12Messages(): ArrayList<Message> {
        return ArrayList<Message>([
            Message("received", "继续保持！", "教练", "12:10"),
            Message("sent", "谢谢教练！", "Me", "12:12"),
            Message("received", "早安！今日打卡开始", "教练", "06:00"),
            Message("sent", "今日打卡已完成！", "Me", "07:30"),
            Message("received", "太棒了，坚持！", "教练", "07:31"),
            Message("received", "做了什么运动？", "健身友A", "07:35"),
            Message("sent", "跑步5公里+力量训练", "Me", "07:36"),
            Message("received", "厉害！", "健身友A", "07:38"),
            Message("received", "我也要加油", "健身友A", "07:39"),
            Message("sent", "一起努力！", "Me", "07:40"),
            Message("received", "今天有瑜伽课", "教练", "10:00"),
            Message("sent", "我报名", "Me", "10:05"),
            Message("received", "好的，已登记", "教练", "10:06"),
            Message("received", "下午还有搏击课", "教练", "12:00"),
            Message("sent", "时间冲突了", "Me", "12:05"),
            Message("received", "没关系，下次参加", "教练", "12:06"),
            Message("sent", "明天几点上课？", "Me", "12:15"),
            Message("received", "早上7点", "教练", "12:18"),
            Message("sent", "我会准时到", "Me", "12:20"),
            Message("received", "不见不散", "教练", "12:22")
		])
    }
    
    // 13. 旅行爱好者
    static func getChat13Messages(): ArrayList<Message> {
        return ArrayList<Message>([
            Message("received", "好的，谢谢分享！", "Me", "09:30"),
            Message("sent", "不客气！", "Me", "09:32"),
            Message("received", "日本旅游攻略分享", "旅行者A", "09:00"),
            Message("received", "京都的樱花季太美了", "旅行者A", "09:01"),
            Message("sent", "什么时候去的？", "Me", "09:05"),
            Message("received", "上个月", "旅行者A", "09:06"),
            Message("received", "照片已上传到群相册", "旅行者A", "09:10"),
            Message("sent", "风景真不错！", "Me", "09:12"),
            Message("received", "推荐去岚山", "旅行者A", "09:15"),
            Message("received", "那里的竹林很壮观", "旅行者A", "09:16"),
            Message("sent", "记下了", "Me", "09:18"),
            Message("received", "有预算参考吗？", "旅行者B", "09:20"),
            Message("received", "大概8000-10000", "旅行者A", "09:22"),
            Message("sent", "包含机票吗？", "Me", "09:25"),
            Message("received", "包含的", "旅行者A", "09:26"),
            Message("received", "淡季去更便宜", "旅行者A", "09:28"),
            Message("sent", "什么时候是淡季？", "Me", "09:35"),
            Message("received", "11月到次年2月", "旅行者A", "09:40"),
            Message("sent", "了解，谢谢", "Me", "09:42"),
            Message("received", "祝你旅途愉快", "旅行者A", "09:45")
		])
    }
    
    // 14. 美食分享
    static func getChat14Messages(): ArrayList<Message> {
        return ArrayList<Message>([
            Message("received", "地址我发群里", "美食家A", "18:12"),
            Message("sent", "收到，谢谢！", "Me", "18:15"),
            Message("received", "这家餐厅不错！", "美食家A", "12:00"),
            Message("received", "招牌菜是红烧肉", "美食家A", "12:01"),
            Message("sent", "在哪里？", "Me", "12:05"),
            Message("received", "市中心步行街", "美食家A", "12:06"),
            Message("received", "人均80左右", "美食家A", "12:08"),
            Message("sent", "性价比挺高", "Me", "12:10"),
            Message("received", "记得提前预约", "美食家A", "12:12"),
            Message("sent", "好的", "Me", "12:13"),
            Message("received", "还有甜品推荐", "美食家A", "18:00"),
            Message("received", "新开的蛋糕店", "美食家A", "18:01"),
            Message("sent", "什么口味？", "Me", "18:05"),
            Message("received", "抹茶和巧克力", "美食家A", "18:06"),
            Message("sent", "改天去试试", "Me", "18:10"),
            Message("received", "需要我发具体地址吗？", "美食家A", "18:20"),
            Message("sent", "好的，麻烦发一下", "Me", "18:22"),
            Message("received", "已发送", "美食家A", "18:25"),
            Message("sent", "收到了", "Me", "18:28"),
            Message("received", "不客气", "美食家A", "18:30")
		])
    }
    
    // 15. 电影推荐
    static func getChat15Messages(): ArrayList<Message> {
        return ArrayList<Message>([
            Message("received", "期待！", "Me", "20:35"),
            Message("sent", "谢谢推荐！", "Me", "20:38"),
            Message("received", "最近看了什么好电影？", "影迷A", "20:00"),
            Message("sent", "看了新上映的科幻片", "Me", "20:05"),
            Message("received", "怎么样？值得看吗？", "影迷A", "20:06"),
            Message("sent", "特效很棒，剧情一般", "Me", "20:08"),
            Message("received", "了解了", "影迷A", "20:10"),
            Message("received", "我推荐一部文艺片", "影迷A", "20:15"),
            Message("sent", "什么名字？", "Me", "20:16"),
            Message("received", "《星光下的约定》", "影迷A", "20:18"),
            Message("sent", "在哪可以看？", "Me", "20:20"),
            Message("received", "视频平台上有", "影迷A", "20:22"),
            Message("received", "评分8.5", "影迷A", "20:23"),
            Message("sent", "我找时间看看", "Me", "20:25"),
            Message("received", "看完记得分享感受", "影迷A", "20:30"),
            Message("received", "下个月有新片上映", "影迷A", "20:32"),
            Message("sent", "什么类型的？", "Me", "20:40"),
            Message("received", "动作片", "影迷A", "20:42"),
            Message("sent", "期待！", "Me", "20:45"),
            Message("received", "一起去看？", "影迷A", "20:50")
		])
    }
    
    // 16. 二手交易
    static func getChat16Messages(): ArrayList<Message> {
        return ArrayList<Message>([
            Message("received", "没问题", "卖家A", "15:25"),
            Message("sent", "好的", "Me", "15:28"),
            Message("received", "出售自用 iPhone 15 Pro", "卖家A", "15:00"),
            Message("received", "9成新，无划痕", "卖家A", "15:01"),
            Message("sent", "多少钱？", "Me", "15:05"),
            Message("received", "6000元", "卖家A", "15:06"),
            Message("sent", "能便宜点吗？", "Me", "15:08"),
            Message("received", "最低5500", "卖家A", "15:10"),
            Message("sent", "配件齐全吗？", "Me", "15:12"),
            Message("received", "原装全套", "卖家A", "15:13"),
            Message("received", "还有保修半年", "卖家A", "15:14"),
            Message("sent", "可以当面交易吗？", "Me", "15:15"),
            Message("received", "可以，你在哪个区？", "卖家A", "15:16"),
            Message("sent", "朝阳区", "Me", "15:18"),
            Message("received", "我就在附近，可以约时间", "卖家A", "15:20"),
            Message("sent", "好的，私聊确定时间", "Me", "15:22"),
            Message("received", "明天上午如何？", "卖家A", "15:30"),
            Message("sent", "可以，10点见", "Me", "15:32"),
            Message("received", "不见不散", "卖家A", "15:35"),
            Message("sent", "好的", "Me", "15:38")
		])
    }
    
    // 17. 宠物交流
    static func getChat17Messages(): ArrayList<Message> {
        return ArrayList<Message>([
            Message("received", "没问题！", "宠物主人A", "11:28"),
            Message("sent", "没问题", "Me", "11:30"),
            Message("received", "可爱的猫咪照片分享", "宠物主人A", "11:00"),
            Message("received", "看我家的小橘", "宠物主人A", "11:01"),
            Message("sent", "太可爱了！", "Me", "11:05"),
            Message("received", "谢谢，它很调皮", "宠物主人A", "11:06"),
            Message("received", "你们养什么宠物？", "宠物主人A", "11:10"),
            Message("sent", "我养了一只狗狗", "Me", "11:12"),
            Message("received", "什么品种？", "宠物主人A", "11:13"),
            Message("sent", "柯基", "Me", "11:15"),
            Message("received", "柯基屁股很可爱哈哈", "宠物主人A", "11:16"),
            Message("sent", "哈哈是的", "Me", "11:18"),
            Message("received", "有空一起遛狗", "宠物主人A", "11:20"),
            Message("sent", "好的，周末如何？", "Me", "11:22"),
            Message("received", "可以，公园见", "宠物主人A", "11:25"),
            Message("received", "记得带零食", "宠物主人A", "11:26"),
            Message("sent", "你家猫咪叫什么？", "Me", "11:35"),
            Message("received", "叫小橘", "宠物主人A", "11:38"),
            Message("sent", "名字真可爱", "Me", "11:40"),
            Message("received", "哈哈", "宠物主人A", "11:42")
		])
    }
    
    // 18. 前端开发
    static func getChat18Messages(): ArrayList<Message> {
        return ArrayList<Message>([
            Message("received", "会议室链接已发", "开发者A", "10:35"),
            Message("sent", "收到", "Me", "10:38"),
            Message("received", "React 19 新特性抢先看", "开发者A", "10:00"),
            Message("received", "新的编译器很强大", "开发者A", "10:01"),
            Message("sent", "性能提升多少？", "Me", "10:05"),
            Message("received", "据说快了40%", "开发者A", "10:06"),
            Message("received", "还有新的服务端组件", "开发者A", "10:10"),
            Message("sent", "期待正式发布", "Me", "10:12"),
            Message("received", "有人用过Vue 4吗？", "开发者B", "10:15"),
            Message("sent", "还没，还在用Vue 3", "Me", "10:18"),
            Message("received", "Vue 4也很强", "开发者B", "10:20"),
            Message("received", "组合式API更完善了", "开发者B", "10:21"),
            Message("sent", "得抽时间学习", "Me", "10:25"),
            Message("received", "今天下午有分享会", "开发者A", "10:30"),
            Message("received", "讲前端性能优化", "开发者A", "10:31"),
            Message("sent", "我参加", "Me", "10:32"),
            Message("sent", "几点开始？", "Me", "10:40"),
            Message("received", "下午3点", "开发者A", "10:42"),
            Message("sent", "好的，准时参加", "Me", "10:45"),
            Message("received", "不见不散", "开发者A", "10:50")
		])
    }
    
    // 19. 产品经理交流
    static func getChat19Messages(): ArrayList<Message> {
        return ArrayList<Message>([
            Message("received", "报名参加！", "Me", "14:35"),
            Message("sent", "好的", "Me", "14:38"),
            Message("received", "分享：产品需求文档模板", "PM A", "14:00"),
            Message("received", "大家可以参考", "PM A", "14:01"),
            Message("sent", "太实用了！", "Me", "14:05"),
            Message("received", "还有用户调研的方法", "PM A", "14:10"),
            Message("sent", "正好需要", "Me", "14:12"),
            Message("received", "你们用什么原型工具？", "PM B", "14:15"),
            Message("sent", "Figma", "Me", "14:16"),
            Message("received", "我也是，协作很方便", "PM B", "14:18"),
            Message("received", "有组件库推荐吗？", "PM B", "14:20"),
            Message("sent", "Ant Design不错", "Me", "14:22"),
            Message("received", "同意，很成熟", "PM A", "14:25"),
            Message("received", "下周有产品沙龙", "PM A", "14:30"),
            Message("sent", "在哪里？", "Me", "14:32"),
            Message("received", "科技园3号楼", "PM A", "14:33"),
            Message("sent", "报名参加！", "Me", "14:35"),
            Message("sent", "几点开始？", "Me", "14:40"),
            Message("received", "下午2点", "PM A", "14:42"),
            Message("sent", "好的，准时到", "Me", "14:45"),
            Message("received", "期待相见", "PM A", "14:50")
		])
    }
    
    // 20. AI 人工智能
    static func getChat20Messages(): ArrayList<Message> {
        return ArrayList<Message>([
            Message("received", "准时参加！", "Me", "09:45"),
            Message("sent", "收到", "Me", "09:48"),
            Message("received", "GPT-5 即将发布！", "AI研究员", "09:00"),
            Message("received", "据称参数量是GPT-4的10倍", "AI研究员", "09:01"),
            Message("sent", "太震撼了", "Me", "09:05"),
            Message("received", "多模态能力大幅提升", "AI研究员", "09:10"),
            Message("sent", "视频理解也有了？", "Me", "09:12"),
            Message("received", "是的，而且更强", "AI研究员", "09:15"),
            Message("received", "有人关注Claude吗？", "开发者A", "09:20"),
            Message("sent", "Claude也很强", "Me", "09:22"),
            Message("received", "各有优势", "开发者A", "09:25"),
            Message("received", "开源模型也在追赶", "AI研究员", "09:30"),
            Message("sent", "LLaMA 4值得期待", "Me", "09:32"),
            Message("received", "本地部署很有前景", "开发者A", "09:35"),
            Message("received", "AI应用落地分享会", "AI研究员", "09:40"),
            Message("received", "明天下午2点", "AI研究员", "09:41"),
            Message("sent", "准时参加！", "Me", "09:45"),
            Message("sent", "在哪里举办？", "Me", "09:50"),
            Message("received", "线上直播", "AI研究员", "09:52"),
            Message("sent", "好的，链接发我", "Me", "09:55")
		])
    }
    
    // 默认消息（未匹配时）
    static func getDefaultMessages(): ArrayList<Message> {
        return ArrayList<Message>([
            Message("received", "你好，有什么可以帮你的？", "助手", "09:00"),
            Message("sent", "你好", "Me", "09:05"),
            Message("received", "欢迎来到Telegram", "助手", "09:06"),
            Message("sent", "谢谢", "Me", "09:10"),
            Message("received", "祝你使用愉快", "助手", "09:11")
		])
    }
    
    // 添加消息到数组 - 使用 ArrayList
    public static func addMessage(messages: ArrayList<Message>, newMsg: Message): ArrayList<Message> {
        var result = messages
        result.add(newMsg)
        return result
    }

    // 验证登录
    // 手机号：11位数字，以13/14/15/16/17/18/19开头
    // 验证码：固定6位数字 123456
    public static func validateLogin(phone: String, code: String): Bool {
        // 验证手机号格式
        if (phone.size != 11) {
            return false
        }
        let prefix = phone[0..2]
        let validPrefixes = ["13", "14", "15", "16", "17", "18", "19"]
        var isValidPrefix = false
        for (p in validPrefixes) {
            if (prefix == p) {
                isValidPrefix = true
                break
            }
        }
        if (!isValidPrefix) {
            return false
        }

        // 验证是否为数字
        let runes = phone.toRuneArray()
        for (i in 0..runes.size) {
            let c = runes[i]
            if (c < r'0' || c > r'9') {
                return false
            }
        }

        // 验证验证码
        if (code != "123456") {
            return false
        }

        return true
    }
}

// 联系人数据结构
public struct ContactItem {
    public let name: String
    public let username: String
    public let online: Bool
    public let lastSeen: String
    public let avatarColor: Int64
    public let avatarLetter: String
    public let onlineStatus: String  // "online", "offline", "recently", "typing"
    public let airId: Int64
    public let level: Int64
    public let badge: String
    public let bio: String

    public init(name: String, username: String, online: Bool, lastSeen: String, avatarColor: Int64, avatarLetter: String, onlineStatus: String, airId: Int64, level: Int64, badge: String, bio: String) {
        this.name = name
        this.username = username
        this.online = online
        this.lastSeen = lastSeen
        this.avatarColor = avatarColor
        this.avatarLetter = avatarLetter
        this.onlineStatus = onlineStatus
        this.airId = airId
        this.level = level
        this.badge = badge
        this.bio = bio
    }

    public init(name: String, username: String, online: Bool, lastSeen: String, avatarColor: Int64, avatarLetter: String) {
        this.name = name
        this.username = username
        this.online = online
        this.lastSeen = lastSeen
        this.avatarColor = avatarColor
        this.avatarLetter = avatarLetter
        this.onlineStatus = if (online) { "online" } else { "recently" }
        this.airId = 0
        this.level = 1
        this.badge = ""
        this.bio = ""
    }
}

// 联系人数据管理
public class ContactData {
    public static func getContacts(): Array<ContactItem> {
        return [
            // 在线状态示例
            ContactItem("Alice", "alice", true, "", 0x2196F3, "A", "online", 12345601, 168, "日榜NO.1", "热爱编程，专注AI领域"),
            ContactItem("Bob", "bob", false, "5分钟前", 0x4CAF50, "B", "recently", 12345602, 85, "周榜TOP10", "喜欢音乐和旅行"),
            ContactItem("Charlie", "charlie", true, "", 0xFF9800, "C", "online", 12345603, 256, "月榜冠军", "产品经理，追求极致体验"),
            ContactItem("David", "david", false, "1小时前", 0x9C27B0, "D", "recently", 12345604, 42, "", "健身爱好者，每天跑步5公里"),
            ContactItem("Emma", "emma", true, "", 0xE91E63, "E", "online", 12345605, 199, "活跃达人", "设计师，喜欢画画"),
            ContactItem("Frank", "frank", false, "30分钟前", 0x00BCD4, "F", "recently", 12345606, 78, "", "大学生，学习计算机科学"),
            // 正在输入状态示例
            ContactItem("Grace", "grace", true, "", 0xFF5722, "G", "typing", 12345607, 312, "传奇榜", "连续签到300天"),
            ContactItem("Henry", "henry", false, "2小时前", 0x795548, "H", "recently", 12345608, 55, "", "游戏玩家，永不言败"),
            ContactItem("Iris", "iris", true, "", 0x3F51B5, "I", "online", 12345609, 142, "新星榜", "前端开发工程师"),
            ContactItem("Jack", "jack", false, "昨天", 0x009688, "J", "recently", 12345610, 33, "", "喜欢摄影和咖啡"),
            ContactItem("Kevin", "kevin", true, "", 0x673AB7, "K", "online", 12345611, 500, "超级明星", "全栈工程师，技术博主"),
            ContactItem("Lily", "lily", false, "10分钟前", 0x8BC34A, "L", "recently", 12345612, 67, "", "喜欢阅读和写作"),
            ContactItem("Michael", "michael", true, "", 0xF44336, "M", "online", 12345613, 189, "月榜TOP5", "数据分析爱好者"),
            ContactItem("Nancy", "nancy", false, "3小时前", 0xFFEB3B, "N", "recently", 12345614, 28, "", "喜欢美食和烹饪"),
            ContactItem("Olivia", "olivia", true, "", 0xE91E63, "O", "online", 12345615, 221, "周榜冠军", "UI/UX设计师"),
            ContactItem("Peter", "peter", false, "昨天", 0x607D8B, "P", "recently", 12345616, 45, "", "喜欢电影和动漫"),
            ContactItem("Quinn", "quinn", true, "", 0xFF9800, "Q", "online", 12345617, 378, "传奇会员", "社区管理员"),
            ContactItem("Rachel", "rachel", false, "5分钟前", 0x9C27B0, "R", "recently", 12345618, 89, "", "喜欢瑜伽和冥想"),
            ContactItem("Steve", "steve", true, "", 0x3F51B5, "S", "online", 12345619, 156, "活跃达人", "后端开发工程师"),
            ContactItem("Tom", "tom", false, "1天前", 0x4CAF50, "T", "recently", 12345620, 51, "", "喜欢户外运动"),
            ContactItem("Uma", "uma", true, "", 0x00BCD4, "U", "online", 12345621, 267, "月榜NO.1", "移动端开发工程师"),
            ContactItem("Victor", "victor", false, "20分钟前", 0xFF5722, "V", "recently", 12345622, 73, "", "喜欢古典音乐"),
            ContactItem("Wendy", "wendy", true, "", 0x795548, "W", "online", 12345623, 134, "新星榜", "喜欢绘画和设计"),
            ContactItem("Xavier", "xavier", false, "6小时前", 0x673AB7, "X", "recently", 12345624, 62, "", "数学爱好者"),
            ContactItem("Yvonne", "yvonne", true, "", 0xE91E63, "Y", "online", 12345625, 298, "传奇榜", "热爱生活，积极向上"),
            ContactItem("Zoe", "zoe", false, "15分钟前", 0x2196F3, "Z", "recently", 12345626, 39, "", "喜欢小动物"),
            ContactItem("李明", "liming", true, "", 0xF44336, "李", "online", 12345627, 178, "周榜TOP5", "软件工程师"),
            ContactItem("王芳", "wangfang", false, "2分钟前", 0x9C27B0, "王", "recently", 12345628, 95, "", "喜欢舞蹈"),
            ContactItem("张伟", "zhangwei", true, "", 0x2196F3, "张", "online", 12345629, 245, "月榜冠军", "创业中，追求梦想"),
            ContactItem("刘洋", "liuyang", false, "1小时前", 0x4CAF50, "刘", "recently", 12345630, 57, "", "喜欢足球")
        ]
    }
}
