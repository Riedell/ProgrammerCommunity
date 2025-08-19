# 项目优化记录

## 25-08-12 完成"我的帖子"功能开发

1. **后端实现**
   - 在 `UserController` 中新增 `getllyPostPage` 方法，用于处理"我的帖子"页面请求
   - 该方法通过现有 `DiscussPostService` 获取特定用户的全部帖子
   - 实现完善的分页支持功能
   - 为每篇帖子添加点赞计数
2. **前端实现**
   - 更新 `my-post.html` 模板，采用 `Thymeleaf` 动态数据绑定
   - 将静态内容替换为后端动态数据
   - 实现规范的分页控件
   - 添加导航链接以保持站点结构一致性
3. **系统集成**
   - 更新个人主页，使"我的帖子"标签页生效（关联至新控制器方法）
   - 确保与网站整体风格统一
4. **功能现已完整实现，用户可以**
   - 在个人主页点击"我的帖子"标签页
   - 查看本人创建的全部帖子
   - 浏览帖子标题、内容摘要、点赞数及创建日期
   - 通过分页控件实现帖子列表的多页导航





## 25-08-13 完成"我的回复"功能开发

### 功能描述
实现了用户可以查看自己回复过的所有帖子的功能，增强用户个人主页的交互性。

### 修改内容

1. **数据访问层 (DAO)**
   - 在 `CommentMapper` 接口中添加了两个新方法：
     - `selectDiscussPostIdsByUserId`: 根据用户ID查询其评论过的帖子ID列表
     - `selectDiscussPostCountByUserId`: 根据用户ID查询其评论过的帖子总数
   - 在 `comment-mapper.xml` 中添加了对应的SQL实现

2. **服务层 (Service)**
   - 在 `CommentService` 中添加了两个新方法：
     - `findDiscussPostIdsByUserId`: 调用Mapper方法获取用户评论过的帖子ID列表
     - `findDiscussPostCountByUserId`: 调用Mapper方法获取用户评论过的帖子总数

3. **控制层 (Controller)**
   - 在 `UserController` 中：
     - 注入 `CommentService`
     - 添加 `getMyReplyPage` 方法处理 "/myreply/{userId}" 请求
     - 该方法查询用户评论过的帖子，并将数据传递给前端页面

4. **前端页面**
   - 更新了 `my-reply.html` 模板页面，使用Thymeleaf语法动态展示用户回复过的帖子
   - 更新了 `my-post.html` 和 `profile.html` 中的导航链接，确保页面间跳转正确

### 技术要点
- 使用 `distinct entity_id` 查询确保每个帖子只显示一次（受限于MySQL ONLY_FULL_GROUP_BY模式）
- 按评论时间倒序排列，最新回复的帖子显示在前面
- 支持分页功能，与网站其他页面保持一致
- 页面样式与现有网站保持统一

### 访问路径
- 用户可以通过个人主页的"我的回复"标签访问该功能
- URL路径：`/user/myreply/{userId}`





## 25-08-18 更新

- 新增数据库初始化数据sql和测试类
- 更新README.md





## 25-08-19 实现Elasticsearch数据同步功能

### 功能描述
实现了将数据库中的帖子数据全量同步到Elasticsearch的功能，解决了项目初始化时已有帖子数据无法在搜索中显示的问题（还需调整，后续优化）。

### 修改内容

1. **服务层 (Service)**
   - 在 `ElasticsearchService` 中添加 `bulkSaveDiscussPost` 方法，用于批量保存帖子数据到Elasticsearch

2. **控制层 (Controller)**
   - 创建 `DataSyncController` 控制器，提供REST API接口用于触发全量同步操作
   - 接口路径：`/data/sync/posts`，仅允许管理员访问
   - 添加异常处理和日志记录功能

3. **权限配置**
   - 在 `SecurityConfig` 中配置 `/data/**` 路径需要管理员权限访问
   - 使用 `@PreAuthorize` 注解确保接口安全性

4. **测试支持**
   - 创建 `DataSyncTestController` 控制器，提供无需认证的测试接口
   - 测试接口路径：`/data/test/sync/posts`

### 技术要点
- 使用 `@PreAuthorize("hasAnyAuthority('admin')")` 注解保护接口安全
- 添加try-catch异常处理机制，避免同步过程中出现错误导致系统崩溃
- 添加日志记录，方便追踪同步操作的状态
- 返回统一的JSON格式响应，便于前端处理

### 访问路径
- 管理员访问路径：`GET /data/sync/posts`（需登录且具有管理员权限）
- **【废弃】**~~测试访问路径：`GET /data/test/sync/posts`（无需登录，仅用于测试）~~













