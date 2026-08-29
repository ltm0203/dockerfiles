# Node.js 24.20.0 + pnpm 10.6.2

面向前端构建和 E2E 工作区的多架构基础镜像，支持 `linux/amd64` 与 `linux/arm64`。

## 镜像

```text
registry.cn-chengdu.aliyuncs.com/yoyosoft/node:24.20.0
```

## 版本检查

```bash
docker run --rm registry.cn-chengdu.aliyuncs.com/yoyosoft/node:24.20.0 node --version
docker run --rm registry.cn-chengdu.aliyuncs.com/yoyosoft/node:24.20.0 pnpm --version
```

预期输出：

```text
v24.20.0
10.6.2
```

镜像内将 pnpm store 固定为 `/root/.pnpm`，便于现有 Docker 构建继续复用缓存目录约定。
