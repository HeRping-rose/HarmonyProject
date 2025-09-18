# 前端 Git 教程讲义

## 一、Git 基础

| 对比维度         | 传统集中式版本控制系统（如 SVN）                     | Git（分布式版本控制系统）                                |
| :--------------- | ---------------------------------------------------- | -------------------------------------------------------- |
| **架构模式**     | 集中式：依赖中央服务器存储所有代码和历史记录         | 分布式：每个本地仓库包含完整代码和历史记录，无单点依赖   |
| **本地存储内容** | 仅保存当前工作版本，历史记录存储在中央服务器         | 本地保存完整历史记录，支持离线查看所有版本               |
| **分支操作**     | 分支本质是目录复制，创建 / 合并耗时且占空间          | 分支是轻量指针，创建 / 切换 / 合并几乎零成本（毫秒级）   |
| **提交方式**     | 提交必须联网，直接提交到中央服务器                   | 本地提交无需联网，仅在同步时与远程仓库交互               |
| **离线工作能力** | 几乎无法离线工作（需连接中央服务器获取历史、提交等） | 完全支持离线开发，所有操作（提交、日志、分支等）本地完成 |
| **数据安全性**   | 中央服务器故障可能导致历史记录丢失                   | 任何本地仓库均可恢复完整项目历史，抗风险能力强           |
| **历史记录特性** | 历史记录可被管理员修改，无严格校验机制               | 提交通过哈希值唯一标识，篡改可被检测，历史默认不可变     |
| **同步效率**     | 拉取 / 推送需传输完整文件或大量数据，速度较慢        | 仅传输增量修改，通过哈希协商机制减少带宽消耗             |
| **冲突处理时机** | 提交到中央服务器时才检测冲突，可能导致多人同时冲突   | 本地合并时即可检测冲突，冲突处理更灵活及时               |
| **核心依赖**     | 强依赖中央服务器，服务器宕机时无法协作               | 无强依赖，仅同步时需要远程仓库，协作更灵活               |

本地和在线管理我们的项目并可以实现在线协作开发

### Git 下常用linux命令

```
mkdir  abc   创建文件夹
rm abc.txt   删除文件  rm -rf  abc 循环删除所有子文件夹
cd  abc   切换到abc目录   cd ../  返回上一层文件夹
ls  当前目录的内容列表
ls -al当前目录的内容列表（隐藏.git）
touch  index.txt   创建一个文件
echo 1 > index.txt            > 清空并写入1
echo 2 >> index.txt          >> 追加写入2
vi index.txt 使用vi编辑
esc :wq 保存退出
cat  index.txt  查看文件内容
```



### 1.1 Git 简介

Git 是一个分布式版本控制系统，它可以有效、高速地处理从很小到非常大的项目版本管理。在前端开发中，Git 能帮助我们追踪代码的变化、协作开发以及回滚到之前的版本等。

### 1.2 Git 安装与配置

#### 1.2.1 安装 Git

- Windows 系统：可以从 Git 官网（https://git-scm.com/）下载安装程序，按照默认选项安装即可。

- Mac 系统：可以使用 Homebrew 安装，命令为brew install git；也可以从官网下载安装程序。

- Linux 系统：通常系统自带 Git，若没有可以使用sudo apt-get install git等命令安装。

#### 1.2.2 配置 Git

安装完成后，需要配置用户名和邮箱，这将作为你提交代码时的身份标识。

```
git config --global user.name "你的用户名"
git config --global user.email "你的邮箱"
```

可以使用git config --list命令查看配置信息。

```
#为避免重复输入，可以保存用户名和密码
git config --global --unset credential.helper store
#清除用户名和密码
git config --global --unset credential.helper store
```



## 二、Git 核心操作

### 2.1 初始化仓库

要使用 Git 管理项目，首先需要初始化一个 Git 仓库。

在项目文件夹下执行以下命令：

```
git init
```

执行后，会在项目文件夹中生成一个隐藏的.git目录，这个目录就是 Git 用来管理版本的核心。

---

当执行 `git add` 命令将文件添加到暂存区时，文件内容会被写入到 `.git/objects` 目录下的**松散对象（loose objects）** 中，同时暂存区的信息会记录在 `.git/index` 文件里。

具体过程如下：

1. 文件内容会被压缩并计算哈希值，以哈希值为文件名存储在 `.git/objects` 目录下（例如 `.git/objects/ab/cdef1234...`），形成一个**blob 对象**
2. `.git/index` 文件会记录这个文件的路径、哈希值、权限等元数据，这就是所谓的 "暂存区"（stage/index）

简单来说：

- 实际文件内容 → `.git/objects`（以哈希命名的二进制文件）
- 暂存区索引信息 → `.git/index`（文本文件，记录哪些文件被暂存）

---



**代码举例**：

假设我们有一个简单的前端项目，目录结构如下：

```
my-frontend-project/
├── index.html
└── css/
    └── style.css
```

在my-frontend-project文件夹下执行git init，初始化仓库。

### 2.2 添加文件到暂存区

将文件添加到暂存区，是 Git 版本控制中的一个重要步骤，暂存区用于临时存放我们将要提交的文件。

命令：

```
git add <文件名>
```

如果要添加所有文件，可以使用：

```
git add .
```

从暂存区中取回到工作区

```
git checkout -- index.html   
git checkout . #从暂存区撤回所有
git status   git状态  #绿色在暂存区  红色在工作区
```

![img_v3_02q0_f444c063-b278-4eb7-a102-e8c7dd01a3fg](C:\Users\EDY\AppData\Roaming\LarkShell\sdk_storage\a2c758b16f94c08f9c951677c1962f15\resources\images\img_v3_02q0_f444c063-b278-4eb7-a102-e8c7dd01a3fg.png)

**代码举例**：

我们创建了index.html文件，内容如下：

### 2.3 提交文件到本地仓库(历史区)

将暂存区的文件提交到本地仓库，完成一次版本记录。

命令：-m 添加注释的命令

```
git commit -m "提交说明"
```

提交说明要简洁明了地描述本次提交的内容。

**代码举例**：

接上例，执行git commit -m "初始化项目，添加index.html和style.css"，将文件提交到本地仓库。

## 添加远程仓库

```
git remote add <远程仓库别名> <远程仓库URL>
```

通常会将远程仓库别名设置为 `origin`（这是 Git 的默认约定，代表主要的远程仓库）

```
git remote add orign https://gitee.com/giteejerry/git-demo.git
```

验证是否成功：

```
git remote      # 仅显示远程仓库别名
# 或
git remote -v   # 显示别名对应的详细 URL（fetch 和 push 地址）

git remote remove origin 执行移除远程仓库的命令
```

**拉取远程仓库的最新内容（首次推送前建议执行）**
若远程仓库非空（例如有 README、LICENSE 等文件），需先拉取远程内容并合并，避免冲突

```
git pull origin master --allow-unrelated-histories
```



首次推送到远程

```
git push -u origin main
```



---

### git分支说明

在 Git 分支管理中，不同分支有明确的职责划分，主流的分支模型（如 Git Flow）定义了一套规范，以下是各主要分支的用途和说明：

### 1. **主分支（长期存在）**

#### `main` 分支 / `master` 分支

- **用途**：存放正式发布的代码，始终保持可部署、稳定的状态，代表生产环境的代码版本。
- **说明**：
  - 两者本质上是同一个概念，只是名称不同（`main` 是近年来的主流替代名称）。
  - 不允许直接在该分支上修改代码，只能通过其他分支合并（如 `develop` 或 `hotfix` 分支）。
  - 每次合并到 `main` 通常会打一个版本标签（Tag），如 `v1.0.0`，用于记录发布版本。

### 2. **开发分支（长期存在）**

#### `develop` 分支

- **用途**：作为日常开发的集成分支，存放下一个版本的开发中的代码。
- **说明**：
  - 从 `main` 分支创建，所有功能开发完成后会合并到这里。
  - 包含最新的开发成果，但可能不稳定（未经过完整测试）。
  - 当 `develop` 分支积累了足够多的功能，会合并到 `main` 分支进行发布。

### 3. **功能分支（临时存在）**

#### `feature` 分支（命名通常为 `feature/功能名称` 或 `feature/issue编号`）

- **用途**：用于开发新功能或改进，避免直接影响 `develop` 分支的稳定性。
- **说明**：
  - 从 `develop` 分支创建，完成后合并回 `develop` 分支。
  - 例如：`feature/user-login`（开发用户登录功能）、`feature/payment-module`（开发支付模块）。
  - 多个开发者可并行开发不同功能，各自在独立的 `feature` 分支工作，减少冲突。

### 4. **修复分支（临时存在）**

#### `hotfix` 分支（命名通常为 `hotfix/问题描述`）

- **用途**：紧急修复生产环境（`main` 分支）出现的严重 bug，不影响正常开发流程。
- **说明**：
  - 从 `main` 分支创建，修复完成后同时合并到 `main` 和 `develop` 分支（避免下次发布时 bug 重现）。
  - 例如：`hotfix/login-error`（修复生产环境登录失败的紧急问题）。
  - 合并到 `main` 后，通常会打一个新的补丁版本标签，如 `v1.0.1`。

### 5. **发布分支（临时存在）**

#### `release` 分支（命名通常为 `release/版本号`）

- **用途**：准备发布版本的分支，用于版本发布前的最终测试和小修复。
- **说明**：
  - 从 `develop` 分支创建，当 `develop` 分支功能足够发布时使用。
  - 仅修复小 bug、优化文档或版本号相关配置，不开发新功能。
  - 完成后合并到 `main`（打版本标签）和 `develop` 分支（同步修复内容）。
  - 例如：`release/v2.1.0`（为 2.1.0 版本做发布准备）。

### 其他常见分支

- **`bugfix` 分支**：与 `hotfix` 类似，但用于修复 `develop` 分支中的非紧急 bug（不影响生产环境），从 `develop` 创建并合并回 `develop`。
- **`test` 分支**：用于测试环境部署，通常从 `develop` 分支创建，测试通过后合并到 `release` 或 `develop`。
- **`staging` 分支**：预发布环境分支，模拟生产环境，用于最终验证，通常从 `release` 或 `develop` 创建，验证通过后合并到 `main`。

### 总结

- **长期分支**：`main`（生产）、`develop`（开发）—— 贯穿项目生命周期。
- **临时分支**：`feature`（功能开发）、`hotfix`（生产紧急修复）、`release`（发布准备）—— 完成任务后删除。

这种分支策略的核心是分离不同环境的代码状态，确保开发、测试、发布过程有序可控，尤其适合团队协作和迭代频繁的项目。

---



### 2.4 查看工作区状态

使用git status命令可以查看工作区、暂存区的状态，了解哪些文件被修改、哪些文件未被跟踪等。

**代码举例**：

当我们修改了index.html文件后，执行git status，会显示index.html文件被修改。

### 2.5 查看提交历史

使用git log命令可以查看提交历史，包括提交者、提交时间、提交说明等信息。

如果想以简洁的方式查看，可以使用git log --oneline。

## 三、版本回退

### 3.1 回退到指定版本

当我们需要回到之前的某个版本时，可以使用git reset命令。

命令：

查看提交日志

git log

git reflog 

```
git reset --hard <提交ID>
```

提交 ID 可以通过git log查看。

**代码举例**：

假设我们有三次提交，提交 ID 分别为a1b2c3d、e4f5g6h、i7j8k9l，我们想回退到e4f5g6h版本，执行git reset --hard e4f5g6h。



### 3.2 撤销工作区修改

如果我们修改了文件但还没有添加到暂存区，想撤销修改，可以使用：

```
git checkout -- <文件名>
```

**代码举例**：

我们修改了index.html中<h1>的内容为 “Hello, World!”，但还没执行git add，执行git checkout -- index.html，文件会恢复到修改前的状态。

### 3.3 撤销暂存区修改

如果文件已经添加到暂存区，想撤销到工作区，可以使用：

```
git reset HEAD <文件名>
```

**代码举例**：

我们执行git add index.html后，又想撤销，执行git reset HEAD index.html，index.html会从暂存区回到工作区。

---

`git stash` 是一个非常实用的 Git 命令，用于**临时保存工作区和暂存区的修改**，让工作区回到干净状态（与最近一次提交保持一致）。

它的典型使用场景包括：

- 需要切换分支，但当前工作还未完成不想提交
- 想拉取远程最新代码，但本地有未提交的修改
- 临时需要处理其他紧急任务，先保存当前工作进度

### 常用操作：

1. **保存当前修改**

   ```bash
   git stash
   # 或添加描述信息（推荐）
   git stash save "修复首页布局的临时修改"
   ```

2. **查看所有 stash**

   

   ```bash
   git stash list
   # 输出类似：stash@{0}: On main: 修复首页布局的临时修改
   ```

3. **恢复最近的 stash**

   

   ```bash
   # 恢复修改但保留 stash 记录
   git stash apply
   
   # 恢复修改并删除该 stash 记录（常用）
   git stash pop
   
   # 恢复指定 stash（比如恢复第1个）
   git stash pop stash@{1}
   ```

4. **删除 stash**

   

   ```bash
   # 删除最近的 stash
   git stash drop
   
   # 删除指定 stash
   git stash drop stash@{1}
   
   # 清空所有 stash
   git stash clear
   ```

   

注意：`git stash` 不会保存以下内容：

- 未跟踪的文件（可以用 `git stash -u` 包含未跟踪文件）
- 忽略的文件（如 `.gitignore` 中指定的）

如果你的仓库之前有 "could not resolve HEAD" 错误，建议先修复仓库状态再使用 `git stash`，否则可能会遇到类似的错误。





Git tag 打标签  



---





## 四、分支操作

### 4.1 创建分支

创建分支可以让我们在不影响主分支的情况下进行开发。

命令：

```
git branch <分支名>
```

```
git branch -a  查看所有分支
git push -u origin "develop" 把这个分支也提交到远程
添加一点内容，再次推送
git push origin "develop"
```



### 4.2 切换分支

使用git checkout命令切换分支：

```
git checkout <分支名>
```

也可以使用git switch <分支名>

### 4.3 创建并切换分支

可以一步完成创建并切换分支的操作：

```
git checkout -b <分支名>
```

或git switch -c <分支名>。

**代码举例**：

创建并切换到feature/register分支，执行git checkout -b feature/register。

### 4.4 合并分支

当分支开发完成后，需要将其合并到主分支（通常是main或master）。

首先切换到主分支，然后执行合并命令：

```
git merge <分支名>
```

**代码举例**：

我们在feature/login分支完成了登录功能的开发，切换到main分支后，执行git merge feature/login将登录功能合并到主分支。

### 4.5 删除分支

分支合并后，如果不再需要该分支，可以将其删除：

```
git branch -d <分支名>
```

**代码举例**：

删除feature/login分支，执行git branch -d feature/login。

## 五、远程仓库操作

### 5.1 关联远程仓库

要将本地仓库与远程仓库关联，使用：

```
git remote add origin <远程仓库地址>
```

**代码举例**：

关联 GitHub 上的远程仓库，执行git remote add origin https://github.com/yourusername/yourrepo.git。

### 5.2 推送到远程仓库

将本地仓库的内容推送到远程仓库，使用：

```
git push -u origin <分支名>
```

第一次推送时加上-u参数，后续可以直接使用git push。

**代码举例**：

将main分支推送到远程仓库，执行git push -u origin main。

### 5.3 从远程仓库拉取

从远程仓库拉取最新内容到本地  并且自动合并，使用：

```
git pull origin <分支名>
```

**代码举例**：

拉取远程main分支的最新内容，执行git pull origin main。



//第二种 原始拉取合并

git fetch origin <分支名> 从远程仓库拉取最新内容到本地 

git merge origin main  把远程最新内容合并到本地分支

### 5.4 克隆远程仓库

如果还没有本地仓库，可以克隆远程仓库到本地：

```
git clone <远程仓库地址>
```

**代码举例**：

克隆 GitHub 上的仓库，执行git clone https://github.com/yourusername/yourrepo.git。

## 六、解决冲突

在多人协作开发中，很容易出现代码冲突。当合并分支或拉取代码时出现冲突，需要手动解决。

**代码举例**：

假设 A 和 B 同时修改了index.html中<h1>的内容，A 修改为 “Hello, Git!” 并提交推送，B 修改为 “Hi, Git!” 并尝试推送，此时会出现冲突。

B 需要先执行git pull origin main拉取 A 的代码，此时index.html会显示冲突标记：

¥¥¥html

<<<<<<< HEAD

```
git checkout --ours <文件名>：选择当前分支（HEAD） 的版本（即 <<<<<<< HEAD 到 ======= 之间的内容）
git checkout --theirs <文件名>：选择合并进来的分支的版本（即 ======= 到 >>>>>>> 提交ID 之间的内容）
```



```
git reset --hard HEAD^   //把历史区重置到上一个提交
git reset --hard 521cb3d （指定回到某个版本）
git reflog  查看所有提交（简）
git log 查看所有提交（详）
按 Enter 键：显示下一行
按 Space 键：显示下一屏
按 q 键：退出查看
```



## 七、Git 与前端项目结合实践

### 7.1 前端项目的 Git 工作流

在前端项目开发中，通常采用以下工作流：

1. 从main分支创建功能分支（如feature/xxx）进行开发。

1. 开发完成后，提交到本地仓库并推送到远程功能分支。

1. 通过 Pull Request（PR）进行代码审查。

1. 审查通过后，合并到main分支。

1. 定期从main分支创建发布分支（如release/xxx）进行发布准备。

### 7.2 忽略不必要的文件

在前端项目中，有些文件不需要纳入 Git 管理，如node_modules、dist等，可以创建.gitignore文件来指定忽略的文件。

**代码举例**：

.gitignore文件内容：

¥¥¥

node_modules/

dist/

*.log

.idea/

.vscode/

¥¥¥



---

### git 提交规范

在 Git 提交中，遵循规范的 commit message 有助于团队协作和代码历史追踪。目前广泛使用的是 **Conventional Commits** 规范，其基本格式如下：

```plaintext
<类型>[可选作用域]: <描述>

[可选正文]

[可选脚注]
```

以下是常见的提交规范举例：

### 1. 功能新增（feat）

```bash
git commit -m "feat(login): 实现用户登录功能"
git commit -m "feat(dashboard): 添加数据统计卡片组件"
```

### 2. 代码修复（fix）

```bash
git commit -m "fix(表单): 修复手机号验证失败的问题"
git commit -m "fix(api): 解决分页接口返回数据异常的bug"
```

### 3. 文档更新（docs）

```bash
git commit -m "docs: 更新README中的安装步骤"
git commit -m "docs(api): 补充接口参数说明文档"
```

### 4. 代码风格调整（style）

```bash
git commit -m "style: 统一代码缩进为4个空格"
git commit -m "style: 修复ESLint检测到的格式错误"
```

### 5. 重构代码（refactor）

```bash
git commit -m "refactor(utils): 优化日期格式化工具函数"
git commit -m "refactor: 拆分过大的组件文件"
```

### 6. 性能优化（perf）

```bash
git commit -m "perf: 优化图片加载速度"
git commit -m "perf(列表): 减少DOM操作提升渲染性能"
```

### 7. 测试相关（test）

```bash
git commit -m "test: 为登录功能添加单元测试"
git commit -m "test(api): 补充接口测试用例"
```

### 8. 构建 / 配置修改（build）

```bash
git commit -m "build: 升级webpack到5.0版本"
git commit -m "build: 添加生产环境打包配置"
```

### 9. 持续集成（ci）

```bash
git commit -m "ci: 调整GitHub Actions的测试流程"
git commit -m "ci: 新增代码覆盖率检查步骤"
```

### 10. 其他变更（chore）

```bash
git commit -m "chore: 更新依赖包版本"
git commit -m "chore: 清理无用的临时文件"
```





在 Git 提交中，遵循规范的 commit message 有助于团队协作和代码历史追踪。目前广泛使用的是 **Conventional Commits** 规范，其基本格式如下：



```plaintext
<类型>[可选作用域]: <描述>

[可选正文]

[可选脚注]
```

以下是常见的提交规范举例：

 **git push -u origin 'feature'  本地创建远程不存在的分支并是第一次提交 带-u**

### 1. 功能新增（feat）



```bash
git commit -m "feat(login): 实现用户登录功能"
git commit -m "feat(dashboard): 添加数据统计卡片组件"
```

### 2. 代码修复（fix）



```bash
git commit -m "fix(表单): 修复手机号验证失败的问题"
git commit -m "fix(api): 解决分页接口返回数据异常的bug"
```

### 3. 文档更新（docs）



```bash
git commit -m "docs: 更新README中的安装步骤"
git commit -m "docs(api): 补充接口参数说明文档"
```

### 4. 代码风格调整（style）

```bash
git commit -m "style: 统一代码缩进为4个空格"
git commit -m "style: 修复ESLint检测到的格式错误"
```

### 5. 重构代码（refactor）



```bash
git commit -m "refactor(utils): 优化日期格式化工具函数"
git commit -m "refactor: 拆分过大的组件文件"
```

### 6. 性能优化（perf）



```bash
git commit -m "perf: 优化图片加载速度"
git commit -m "perf(列表): 减少DOM操作提升渲染性能"
```

### 7. 测试相关（test）



```bash
git commit -m "test: 为登录功能添加单元测试"
git commit -m "test(api): 补充接口测试用例"
```

### 8. 构建 / 配置修改（build）



```bash
git commit -m "build: 升级webpack到5.0版本"
git commit -m "build: 添加生产环境打包配置"
```

### 9. 持续集成（ci）



```bash
git commit -m "ci: 调整GitHub Actions的测试流程"
git commit -m "ci: 新增代码覆盖率检查步骤"
```

### 10. 其他变更（chore）



```bash
git commit -m "chore: 更新依赖包版本"
git commit -m "chore: 清理无用的临时文件"
```



### 带正文和脚注的例子



```bash
git commit -m "feat(支付): 支持支付宝支付方式

- 集成支付宝SDK
- 实现支付结果回调处理
- 添加支付状态查询接口

Closes #123"
```



这种规范的好处是：

- 自动化生成版本日志
- 清晰区分不同类型的变更
- 便于查找特定类型的提交
- 帮助团队成员快速理解提交目的

很多项目会配合 `commitlint` 工具来强制检查提交信息是否符合规范。

### 带正文和脚注的例子



```bash
git commit -m "feat(支付): 支持支付宝支付方式

- 集成支付宝SDK
- 实现支付结果回调处理
- 添加支付状态查询接口

Closes #123"
```

### origin/develop和orgin develop的区别

在 Git 版本控制中，`origin/develop` 和 `origin develop` 看似相似，实则代表**完全不同的概念**，核心区别在于是否包含斜杠（`/`），这直接决定了它们是 “远端跟踪分支” 还是 “远端仓库 + 分支” 的组合。下面从定义、用途、本质三个维度详细拆解：

### 1. 核心定义与本质区别

| 表达式           | 类型                                   | 本质含义                                                     |
| ---------------- | -------------------------------------- | ------------------------------------------------------------ |
| `origin/develop` | 远端跟踪分支（Remote Tracking Branch） | 本地仓库中**记录远端仓库（origin）的 develop 分支状态**的 “镜像分支”，是本地数据结构。 |
| `origin develop` | 远端仓库 + 分支                        | 明确指向 “名为 `origin` 的远端仓库” 中**实际存在的 `develop` 分支**，是远端真实分支。 |

### 2. 具体用途与场景差异

两者的使用场景完全不同，错误混用会导致 Git 命令执行失败或逻辑错误，以下是典型场景对比：

#### （1）`origin/develop`：本地跟踪远端状态的 “桥梁”

- **本质**：它不是远端仓库的分支本身，而是 Git 在本地自动创建的 “跟踪分支”—— 当你从 `origin` 拉取（`pull`）或获取（`fetch`）`develop` 分支时，Git 会更新 `origin/develop`，让它与远端 `develop` 分支的最新状态保持一致。
- **典型用途**：
  1. **查看远端最新状态**：用 `git log origin/develop` 查看远端 `develop` 分支的提交历史（无需联网，因为是本地跟踪的镜像）。
  2. **与本地分支对比**：用 `git diff develop origin/develop` 查看本地 `develop` 分支与远端 `develop` 分支的差异（比如本地有哪些未推送的修改）。
  3. **基于远端状态创建分支**：用 `git checkout -b new-feature origin/develop` 基于远端 `develop` 的最新状态创建本地新分支（依赖本地跟踪的 `origin/develop` 数据）。

#### （2）`origin develop`：直接操作远端仓库的分支

- **本质**：它是 “远端仓库名（`origin`）” 和 “远端分支名（`develop`）” 的组合，直接指向远端仓库中真实存在的分支，**操作时通常需要联网**（如推送、拉取、删除远端分支）。
- **典型用途**：
  1. **推送本地分支到远端**：用 `git push origin develop` 将本地 `develop` 分支的修改推送到远端 `origin` 的 `develop` 分支（这里 `origin` 是远端仓库名，`develop` 是远端目标分支名）。
  2. **拉取远端分支到本地**：用 `git pull origin develop` 直接拉取远端 `origin` 的 `develop` 分支到本地当前分支（若本地无跟踪关系，需显式指定远端仓库和分支）。
  3. **删除远端分支**：用 `git push origin --delete develop` 删除远端 `origin` 的 `develop` 分支（同样是 “远端仓库名 + 分支名” 的组合）。

### 3. 关键总结：一句话区分

- **`origin/develop`**：带斜杠，是本地的 “远端跟踪分支”，用来记录远端 `develop` 的状态，操作不直接影响远端。
- **`origin develop`**：空格分隔，是 “远端仓库（origin）+ 远端分支（develop）” 的组合，操作直接作用于远端仓库的分支。

### 补充：为什么会有 “远端跟踪分支”？

Git 设计 `origin/develop` 这类跟踪分支的核心目的是**解耦本地与远端**：
本地无需时刻联网查询远端状态，只需通过 `git fetch origin` 同步一次，`origin/develop` 就会更新为远端最新状态，后续的日志查看、差异对比等操作都可基于本地跟踪分支完成，提升效率。
