# **createb**
## 登录--身份选择
, LAContext *laCtx = [[LAContext alloc] init]; ,
* teacher
* student
-------
,,,
LAContext *laCtx = [[LAContext alloc] init];
    if (![laCtx canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:NULL]) {
        NSLog(@"不支持指纹识别");
        return;
    }
    [laCtx evaluatePolicy:LAPolicyDeviceOwnerAuthentication localizedReason:@"指纹登录" reply:^(BOOL success, NSError * _Nullable error) {
        if (success) {
            NSLog(@"指纹识别成功");
        }else{
            NSLog(@"指纹识别失败");
        }
    }];
,,,
## 首页展示成绩
* 在线
* 历史记录 
> chats->MPAndroidChart  use_frameworks! （用到swift才需要写）
## 测评提交数据后台处理并返回结构
## 跑步，画图形轨迹
![developer](https://ss3.baidu.com/-rVXeDTa2gU2pMbgoY3K/it/u=1548151179,1599468232&fm=202&mola=new&crop=v1)
## 资讯，图文+视频
 数据库管理系统（英语：Database Management System，简称DBMS）是为管理数据库而设计的电脑软件系统，一般具有存储、截取、安全保障、备份等基础功能。数据库管理系统可以依据它所支持的数据库模型来作分类，例如关系式、XML；或依据所支持的计算机类型来作分类，例如服务器群集、移动电话；或依据所用查询语言来作分类，例如SQL、XQuery；
 
 或依据性能冲量重点来作分类，例如最大规模、最高运行速度；亦或其他的分类方式。不论使用哪种分类方式，一些DBMS能够跨类别，例如，同时支持多种查询语言。
## 用户设置
