## 🔹 一、基础配置

```bash
# 设置用户名
git config --global user.name "你的名字"

# 设置邮箱
git config --global user.email "你的邮箱"

# 查看当前配置
git config --list
```

---

## 🔹 二、远程仓库操作

```bash
# 查看远程仓库
git remote -v

# 添加远程仓库
git remote add origin git@github.com:xxx/xxx.git

# 修改远程仓库地址
git remote set-url origin git@github.com:xxx/xxx.git

# 删除远程仓库
git remote remove origin
```

---

## 🔹 三、推送（push）

```bash
# 推送当前分支到远程（常用）
git push origin 分支名

# 推送本地所有分支
git push --all origin

# 推送并设置默认上游分支（以后直接 git push 就行）
git push -u origin 分支名

# 强制推送（谨慎）
git push origin 分支名 --force
```

---

## 🔹 四、拉取（pull & fetch）

```bash
# 拉取远程最新代码并自动合并
git pull origin 分支名

# 拉取并与本地分支 rebase（更干净的提交记录）
git pull --rebase origin 分支名

# 仅获取远程分支，但不合并
git fetch origin

# 获取远程所有分支
git fetch --all
```

---

## 🔹 五、合并（merge & rebase）

```bash
# 将其他分支合并到当前分支
git merge 分支名

# 避免自动生成合并提交，尝试快进
git merge --ff-only 分支名

# 遇到冲突时手动解决后，标记为已解决
git add .
git commit

# 使用 rebase 合并（让提交历史更线性）
git rebase 分支名

# 如果 rebase 出错，可以中止
git rebase --abort

# 解决冲突后继续 rebase
git rebase --continue
```

---

## 🔹 六、分支操作

```bash
# 查看所有分支
git branch -a

# 新建分支
git branch 分支名

# 切换分支
git checkout 分支名
# 或
git switch 分支名

# 新建并切换分支
git checkout -b 分支名
# 或
git switch -c 分支名

# 删除本地分支
git branch -d 分支名
git branch -D 分支名   # 强制删除

# 删除远程分支
git push origin --delete 分支名
```

---

## 🔹 七、常见协作场景

```bash
# 1. 从远程更新分支并合并到本地
git fetch origin
git merge origin/分支名

# 2. 在本地开发新分支并推送
git checkout -b feature-xxx
git push -u origin feature-xxx

# 3. 保持分支最新（推荐 rebase）
git fetch origin
git rebase origin/main

# 4. 合并 PR 前，把分支与 main 同步
git checkout feature-xxx
git rebase main
```