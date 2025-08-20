# 社区论坛应用JDK 17升级指南

## 执行摘要

本文档概述了将社区论坛应用从当前技术栈（Java 8，Spring Boot 2.1.5）升级到JDK 17和现代框架的全面策略。此次升级将在性能、安全性和现代Java特性访问方面带来显著优势。

## 当前技术栈

- **Java**: 8
- **Spring Boot**: 2.1.5.RELEASE
- **数据库**: MySQL 5.7
- **缓存**: Redis
- **消息队列**: Kafka
- **搜索**: Elasticsearch 6.4.3
- **前端**: Thymeleaf（服务端渲染）+ jQuery + Ajax

## 升级策略概述

推荐采用增量升级策略以降低风险并确保持续验证。升级分为四个阶段：

1. **基础层**: JDK和核心框架
2. **数据访问和集成层**: 数据库和中间件组件
3. **现代化**: 迁移到Spring Boot 3.x
4. **前端增强**: UI现代化

## 详细升级计划

### 初始阶段：分析与准备

本阶段专注于：

- **依赖分析**：使用 `mvn dependency:tree` 等工具，详细梳理当前项目的所有直接和传递性依赖，识别潜在的版本冲突。

- **API废弃扫描**：利用 IDE 或静态分析工具，扫描代码中使用了哪些在目标版本（JDK 17, Spring Boot 2.7/3.x）中已被废弃或移除的 API。

- **编写详细的迁移清单**：通读 Spring Boot 2.2 到 3.1 的所有官方迁移指南（Migration Guides），创建一个详细的检查清单（Checklist），列出所有需要修改的配置项、类和方法。

### 阶段1：基础层（JDK和核心框架）

#### 1. JDK 8 → JDK 17
**优先级**: 高
**预估时间**: 1-2周

**步骤**:
- 在开发环境中安装JDK 17
- 更新Maven构建配置:
  ```xml
  <properties>
      <java.version>17</java.version>
  </properties>
  ```
- 解决兼容性问题:
  - 替换已移除的API
  - 更新JVM参数
  - 修复过时代码

**优势**:
- 性能提升
- 安全性增强
- 访问现代Java语言特性（Records、Switch表达式、文本块）

#### 2. Spring Boot 2.1.5 → 2.7.x
**优先级**: 高
**预估时间**: 2-3周

**步骤**:
- 更新pom.xml中的父版本:
  ```xml
  <parent>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-parent</artifactId>
      <version>2.7.14</version>
  </parent>
  ```
- 更新配置属性（名称可能已更改）
- 调整安全配置
- 彻底测试所有端点

**优势**:
- 错误修复和安全补丁
- 改进的JDK 17兼容性
- 在保持javax.*命名空间的同时访问新特性

### 阶段2：数据访问和集成层

#### 3. 数据库和中间件组件更新
**优先级**: 高
**预估时间**: 3-4周

**需要更新的组件**:
- **MySQL连接器**: 8.0.16 → 8.0.33+
- **MyBatis Spring Boot Starter**: 2.0.1 → 兼容版本
- **Redis客户端**: 更新到与Spring Boot 2.7.x兼容的版本
- **Kafka客户端**: 更新spring-kafka到兼容版本
- **Elasticsearch**: 6.4.3 → 7.x或8.x（重大升级）

**关键注意事项**:
- Elasticsearch升级需要重新索引数据
- 更新后单独测试所有集成
- 更新实体注解和查询语法（如需要）

### 阶段3：现代化到Spring Boot 3.x

#### 4. Spring Boot 2.7.x → 3.x
**优先级**: 高
**预估时间**: 4-6周

**主要变更**:
- **Jakarta EE迁移**: javax.*到jakarta.*包
- **Java 17基线**: 需要JDK 17作为最低版本
- **Spring Framework 6**: 底层框架升级，有破坏性变更

**步骤**:
- 更新到Spring Boot 3.x:
  ```xml
  <parent>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-parent</artifactId>
      <version>3.1.2</version>
  </parent>
  ```
- 将所有javax.*导入替换为jakarta.*
- 更新实体注解
- 调整配置类
- 处理Spring Security 6的变更

**优势**:
- 完整的JDK 17支持
- Jakarta EE 9+合规
- 性能提升
- 访问最新的Spring生态系统特性

### 阶段4：前端增强

#### 5. 前端现代化
**优先级**: 中等
**预估时间**: 2-3周

**当前状态**: 使用Thymeleaf和jQuery的混合方法

**现代化选项**:
1. **增量方法**: 
   - 保留现有的Thymeleaf页面用于静态内容
   - 将新的交互功能实现为Vue组件
   - 在过渡期间维护两个系统

2. **完全迁移方法**:
   - 完全迁移到使用RESTful API的Vue.js
   - 使用Vuex实现状态管理
   - 引入现代构建工具（Vite/Webpack）

**建议**:
- 最初采用混合方法以降低风险
- 增强REST API以支持新前端
- 维护安全特性（CSRF保护）
- 考虑为SEO关键页面使用服务端渲染（Nuxt.js）

## 时间估算

### 保守估计: 3-4个月
- 阶段1: 2-3周
- 阶段2: 3-4周
- 阶段3: 4-6周
- 阶段4: 2-3周
- 测试和优化: 2-3周

### 激进估计: 6-8周
- 在有经验的团队和专用资源的情况下

## 风险缓解策略

### 技术风险
1. **破坏性变更**: 
   - 使用官方迁移指南
   - 在每个阶段进行彻底测试
   - 维护回滚计划

2. **依赖冲突**:
   - 使用Spring Boot依赖管理
   - 以兼容的版本组更新依赖

3. **数据迁移**:
   - 规划Elasticsearch重新索引
   - 升级前备份数据库
   - 升级后测试数据完整性

### 组织风险
1. **团队适应**:
   - 提供新技术培训
   - 从小组件开始
   - 在复杂迁移期间进行结对编程

2. **业务连续性**:
   - 为逐步推出实施功能标志
   - 维护并行环境
   - 在低流量期间安排升级

## 升级的主要优势

1. **性能提升**:
   - JDK 17性能增强
   - G1垃圾收集器改进
   - Spring Boot 3.x优化

2. **安全性增强**:
   - 最新的安全补丁
   - 改进的身份验证机制
   - 现代加密标准

3. **开发人员生产力**:
   - 现代Java语言特性
   - 改进的工具和调试
   - 更好的框架文档

4. **未来兼容性**:
   - JDK 17的LTS支持（直到2029年）
   - 访问现代生态系统
   - 更容易的未来升级

## 实施建议

1. **首先升级JDK和Spring Boot**，然后再考虑前端变更
2. **采用增量方法**，在每个阶段进行彻底测试
3. **在整个迁移过程中保持全面的测试覆盖**
4. **记录所有变更**以供未来维护
5. **规划回滚程序**以防出现关键问题
6. **与利益相关者沟通时间表和期望**

此升级路径提供了一种平衡的方法，在最小化风险的同时最大化现代技术的优势。增量方法允许持续验证，并减少可能阻碍迁移过程的重大问题的可能性。





## ——————

## 分项升级建议

### 后端 (Backend)

| 组件            | 当前版本            | 建议升级方向                                            | 理由与说明                                                   |
| --------------- | ------------------- | ------------------------------------------------------- | ------------------------------------------------------------ |
| **Spring Boot** | 2.1.5.RELEASE       | **核心升级：升级到 Spring Boot 3.x** (例如最新的 3.3.x) | \- **必要性**：2.1.x 版本已于2020年停止开源支持，存在大量已知或未知的安全漏洞。升级是必须的。<br/>- **版本选择**：Spring Boot 3.x 是当前的主流版本，基于 Spring Framework 6，带来了显著的性能提升、AOT（Ahead-Of-Time）编译支持（可用于 GraalVM 原生镜像），以及对 Java 17+ 的全面支持。<br/>- **关键变更**：升级到 3.x 有一个重大变化：Java EE 迁移到了 Jakarta EE，所有包名从 `javax.*` 变为 `jakarta.*`。这需要全局性的代码修改，但 IDE 提供了自动化工具可以辅助完成。 |
| **Java 版本**   | 8                   | **升级到 Java 17 或 21**                                | \- **配合 Spring Boot 3**：Spring Boot 3.x 的最低要求是 Java 17。<br/>- **LTS 版本**：Java 17 和 Java 21 都是长期支持（LTS）版本，拥有更好的性能（如 ZGC、Shenandoah GC）、更现代的语法（如 Records, Sealed Classes, Switch表达式等）和持续的安全更新。对于新项目，推荐 Java 21。 |
| **ORM**         | MyBatis             | **保持使用，升级版本**                                  | \- MyBatis 依然是一个非常优秀且灵活的 ORM 框架，尤其适合对 SQL 有精细控制需求的场景。没有必要强行更换为 JPA。<br/>- 仅需将 MyBatis Spring Boot Starter 升级到与 Spring Boot 3 兼容的最新版本即可。 |
| **数据库**      | MySQL 5.7           | **升级到 MySQL 8.x**                                    | \- **生命周期**：MySQL 5.7 已于 2023 年 10 月结束了官方扩展支持（EOL），不再有安全更新。<br/>- **功能与性能**：MySQL 8.x 提供了窗口函数（Window Functions）、公用表表达式（CTEs）、更好的 JSON 处理能力和显著的性能改进。 |
| **分布式缓存**  | Redis               | **保持使用，升级客户端和服务器版本**                    | \- Redis 依然是分布式缓存领域的首选。升级 Spring Boot 后，其内置的 `spring-boot-starter-data-redis` 会自动管理 Lettuce 或 Jedis 客户端的更新。<br/>- 建议同时检查并升级生产环境的 Redis Server 到最新的稳定版本（如 6.x 或 7.x），以获得更好的性能和新功能。 |
| **消息队列**    | Kafka 2.13-2.6.0    | **升级到 Kafka 3.x**                                    | \- Kafka 3.x 引入了一个重要的架构变化：移除了对 ZooKeeper 的依赖（通过 KRaft 模式），这大大简化了部署和运维。<br/>- 即使暂时不使用 KRaft 模式，新版本也带来了性能优化和各种改进。升级 `spring-kafka` 依赖版本即可。 |
| **搜索引擎**    | Elasticsearch 6.4.3 | **高优先级升级：升级到 Elasticsearch 8.x**              | \- **重大风险**：6.x 版本非常古老，已停止维护多年，存在严重的安全漏洞（如 Log4Shell 对旧版 ES 的影响）。<br/>- **迁移难度高**：从 6.x 到 8.x 是一个大版本跨越，API 变化巨大。例如，移除了 Type Mappings，REST High Level Client 已被废弃，需要迁移到新的 Java API Client。<br/>- **建议步骤**：这是一个需要详细规划的迁移任务，建议先升级到 7.17（最后一个 7.x 版本），解决废弃项，然后再迁移到 8.x。务必做好数据迁移和索引重建的准备。 |
| **本地缓存**    | Caffeine            | **保持使用，升级版本**                                  | \- Caffeine 是目前 Java 生态中最优秀的本地缓存库。Spring Boot 3.x 会自动管理其到最新兼容版本。 |
| **安全**        | Spring Security     | **随 Spring Boot 升级，重构配置**                       | \- Spring Security 在 Spring Boot 2.7 -> 3.x 的过程中有重大配置变更。废弃了 `WebSecurityConfigurerAdapter`，全面转向基于 `SecurityFilterChain` Bean 的组件化配置方式。<br/>- 这部分需要重写安全配置代码，但新的方式更灵活、更清晰。 |
| **其他**        | Spring Mail, Quartz | **随 Spring Boot 升级**                                 | \- 这些 Spring 生态内的工具，直接通过升级 Spring Boot parent POM 即可获得更新。API 基本保持稳定。 |
| **wkhtmltox**   | 0.12.6-1            | **考虑替代方案**                                        | \- `wkhtmltox` 是一个基于旧版 WebKit 的命令行工具，对现代 CSS 和 JavaScript 的支持不佳，且已不再维护。<br/>- **替代建议**：可以考虑使用基于现代浏览器引擎的库，例如 **Playwright** 或 **Puppeteer**。可以将 PDF 生成功能封装成一个独立的微服务，通过 API 调用，这样主应用就不再依赖这个外部二进制文件。 |



### 前端 (Frontend)

目前的前端技术栈是典型的后端渲染方案。这里有两个主要升级路径：

**路径 A：渐进式改进（Evolutionary Approach）**

如果想保留后端渲染，以最小成本进行现代化。

- **Thymeleaf**: 保持使用，随 Spring Boot 升级版本。
- **Bootstrap**: 升级到 **Bootstrap 5.x**。这是一个重要步骤，Bootstrap 5 移除了对 jQuery 的依赖，使用原生 JavaScript，性能更好，也更现代。
- **jQuery/Ajax**: **移除 jQuery**。将之前依赖 jQuery 的 DOM 操作和 Ajax 请求，用**原生 JavaScript (Vanilla JS)** 或轻量级的库（如 **Alpine.js**，它和 Thymeleaf/Bootstrap 配合得很好）来重写。

**路径 B：彻底现代化（Revolutionary Approach）**

如果项目未来有更高的交互性要求，建议采用前后端分离架构。

- **后端**：改造为只提供 RESTful API 的纯后端服务。可以利用 Spring Boot 快速构建。
- **前端**：使用现代前端框架（如 **Vue.js**、**React** 或 **Angular**）重新构建一个单页面应用（SPA）。
  - **优点**：用户体验极佳、前后端职责清晰、团队可以并行开发。
  - **缺点**：开发和维护成本更高，需要专门的前端技能和构建体系（Webpack/Vite, Node.js 等）。



### 开发环境 (Development Environment)

| 组件              | 当前状态                            | 建议                                                         |
| ----------------- | ----------------------------------- | ------------------------------------------------------------ |
| **构建工具**      | Apache Maven                        | **保持使用，升级版本**。Maven 依然是 Java 世界的绝对主流，升级到最新的 3.9.x 版本即可。 |
| **集成开发工具**  | IDEA / Eclipse                      | **保持使用**，确保更新到最新版本以获得对 Java 17/21 和 Spring Boot 3 的最佳支持。 |
| **版本控制**      | Git                                 | **保持使用**，这是行业标准。                                 |
| **应用服务器**    | Apache Tomcat                       | Spring Boot 内嵌了 Tomcat，升级 Spring Boot 会自动升级 Tomcat 版本，无需额外操作。 |
| **接口/压力测试** | Postman, JMeter                     | **保持使用**，这些工具依然是行业标杆。                       |
| **新增建议**      | **容器化：Docker / Docker Compose** | \- **强烈建议**将你的应用进行容器化。为你的 Spring Boot 应用编写一个 `Dockerfile`。<br/>- 使用 `docker-compose.yml` 在本地一键启动你的应用以及所有依赖（MySQL, Redis, Kafka, Elasticsearch），极大地简化了开发环境的搭建和保障了环境一致性。<br/>- 这是迈向云原生和微服务的第一步，也是现代软件开发的事实标准。 |



### 补充

**测试的重要性** 进一步强调其在每个阶段的核心地位。

- **更新现有测试**：对于每个阶段来说，现有的单元测试和集成测试会大量失败，修复这些测试是该阶段工作的一部分。
- **补充集成测试**：针对 Spring Security、数据库连接、Kafka 消息收发、Redis 缓存等关键集成点，如果缺乏自动化集成测试，应优先补充，这将是升级成功与否的关键保障。

**细化回滚计划** 为每个阶段定义明确的回滚步骤。

- **版本控制**：为每个阶段创建一个独立的特性分支（feature branch），在合并到主干前进行充分验证。
- **数据库备份**：在执行任何可能影响数据的操作前，确保有可靠的数据库备份。
- **蓝绿部署/金丝雀发布**：在生产环境部署时，考虑使用蓝绿部署或金丝雀发布策略，以实现快速、低风险的回滚。
