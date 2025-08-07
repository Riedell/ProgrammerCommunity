# ProgrammerCommunity
An exclusive community exchange forum for professional programmers.  
职业程序员专属的社区交流论坛。

## 项目简介
`ProgrammerCommunity` 是一套前后端不分离的编码社区交流系统/网站（严格来说属于：后端渲染（`Thymeleaf`）和前后端半分离（`jQuery`+`Ajax`）的混合模式），基于目前主流 Java Web 技术栈（`Spring` + `SpringBoot` + `MyBatis` + `MySQL` + `Redis` + `Kafka` + `Elasticsearch` + `Spring Security` + ...）开发。包含帖子、评论、私信、系统通知、点赞、关注、搜索、用户设置、数据统计等功能模块。

## 技术栈
### 开发环境
- **Java 版本**：8
- **操作系统**：Windows 10 / Linux
- **构建工具**：Apache Maven
- **集成开发工具**：Intellij IDEA / Eclipse
- **版本控制工具**：Git
- **应用服务器**：Apache Tomcat
- **接口测试工具**：Postman / Api Fox
- **压力测试工具**：Apache JMete

### 后端：
- Spring
- Spring Boot 2.1.5 RELEASE
- Spring MVC
- ORM：MyBatis
- **数据库**：MySQL 5.7
- **分布式缓存**：Redis
- **消息队列**：Kafka 2.13-2.6.0
- **搜索引擎**：Elasticsearch 6.4.3
- **本地缓存**：Caffeine
- **安全**：Spring Security
- **邮件任务**：Spring Mail
- **分布式定时任务**：Spring Quartz
- wkhtmltox 0.12.6-1
- **日志**：SLF4J（日志接口）、Logback（日志实现）

### 前端：
- Thymeleaf
- Bootstrap 4.x
- Jquery
- Ajax

## 本地运行
项目本地部署测试所需环境：

- Java 8
- MySQL 5.7
- Redis
- Kafka 2.13-2.6.0
- Elasticsearch 6.4.3

然后修改配置文件中的信息为自己的本地环境，项目相关配置信息用 xxxxxx 代替，请自行替换。

本地运行需要修改的配置文件信息如下：

1. **application-develop.properties：**

- MySQL
- Spring Mail（邮箱需要开启 SMTP 服务）
- Kafka：consumer.group-id（该字段见 Kafka 安装包中的 consumer.proerties，可自行修改, 修改完毕后需要重启 Kafka）
- Elasticsearch：cluster-name（该字段见 Elasticsearch 安装包中的 elasticsearch.yml，可自行修改）
- 七牛云（需要新建一个七牛云的对象存储空间，用来存放上传的头像图片）

2. **logback-spring-develop.xml：**

- LOG_PATH：日志存放的位置

项目运行前需要启动：

- MySQL
- Redis
- Elasticsearch
- Kafka

此外，还需要提前创建并初始化数据库 community，然后依次运行项目 sql 文件夹下的 sql 文件以建立数据库表。

## 功能列表
### 注册
### 登录 | 登出
* 动态生成验证码
* 记住我
### 账号设置
* 修改头像
* 修改密码
### 过滤敏感词
* 前缀树
### 帖子模块
* 发布帖子（过滤敏感词）
* 分页显示所有的帖子
* 支持按照 “发帖时间” 显示
* 支持按照 “热度排行” 显示（Spring Quartz）
* 查看帖子详情
* 权限管理（Spring Security + Thymeleaf Security）
* 未登录用户无法发帖
* “版主” 可以看到帖子的置顶和加精按钮并执行相应操作
* “管理员” 可以看到帖子的删除按钮并执行相应操作
* “普通用户” 无法看到帖子的置顶、加精、删除按钮，也无法执行相应操作
### 评论模块
* 发布对帖子的评论（过滤敏感词）
* 分页显示评论
* 发布对评论的回复（过滤敏感词）
* 权限管理（Spring Security）
* 未登录用户无法使用评论功能
### 私信模块
* 发送私信（过滤敏感词）
* 私信列表
* 查询当前用户的会话列表
* 每个会话只显示一条最新的私信
* 支持分页显示
* 私信详情
* 查询某个会话所包含的所有私信
* 访问私信详情时，将显示的私信设为已读状态
* 支持分页显示
* 权限管理（Spring Security）
* 未登录用户无法使用私信功能
### 统一处理 404 / 500 异常
* 普通请求异常
* 异步请求异常
### 统一记录日志
### 点赞模块
* 支持对帖子、评论/回复点赞
* 第 1 次点赞，第 2 次取消点赞
* 首页统计帖子的点赞数量
* 详情页统计帖子和评论/回复的点赞数量
* 详情页显示当前登录用户的点赞状态（赞过了则显示已赞）
* 统计我的获赞数量
* 权限管理（Spring Security）
* 未登录用户无法使用点赞相关功能
### 关注模块
* 关注功能
* 取消关注功能
* 统计用户的关注数和粉丝数
* 我的关注列表（查询某个用户关注的人），支持分页
* 我的粉丝列表（查询某个用户的粉丝），支持分页
* 权限管理（Spring Security）
* 未登录用户无法使用关注相关功能
### 系统通知模块
* 通知列表
* 显示评论、点赞、关注三种类型的通知
* 通知详情
* 分页显示某一类主题所包含的通知
* 进入某种类型的系统通知详情，则将该页的所有未读的系统通知状态设置为已读
* 未读数量
* 分别显示每种类型的系统通知的未读数量
* 显示所有系统通知的未读数量
* 导航栏显示所有消息的未读数量（未读私信 + 未读系统通知）
* 权限管理（Spring Security）
* 未登录用户无法使用系统通知功能
### 搜索模块
### 网站数据统计（管理员专属）
* 独立访客 UV
* 支持单日查询和区间日期查询
* 日活跃用户 DAU
* 支持单日查询和区间日期查询
* 权限管理（Spring Security）
* 只有管理员可以查看网站数据统计
### 优化网站性能
* 处理每次请求时，都要通过拦截器根据登录凭证查询用户信息，访问的频率非常高。因此将已成功登录的用户信息在缓存 Redis 中保存一段时间，查询用户信息的时候优先从缓存中取值；若缓存中没有该用户信息，则将其存入缓存；用户信息变更时清除对应的缓存数据
* 引入本地缓存 Caffeine，缓存热帖列表和帖子的总数，提升响应速度（可以进一步采用二级缓存架构）
