# commandline-reader

目前来说，这是一个用来快速发送 GET 请求至 SoTap 相关 API 的命令行小工具，在某种意义上你可以用它来阅读我们所发布的新内容。

本程序分 Windows 和 Python 两个版本，共六个小版本。六个小版本中的 Windows 部分将保持同步更新，每与 Python 版本更新一次算作一次大版本更新。不同的小版本具有不同的特点和功能，分别以六个不同的脚本文件的形式存在于不同的文件夹中。至于每个小版本的区别究竟在哪里，可以阅读下文继续了解。

## 到底有什么用

正如简介所说，本质上这只是一个 *GET collection*（后期也有可能出现 POST），不过你仍然可以用自己的方式来使用它。借助该工具，你可以在命令行内使用简单的命令语法轻松获取我们发布的新的内容，例如更新日志（`https://open.sotap.org`）等。该工具的功能将伴随着 SoTap 一系列 RESTful API 的完善而完善。

在将来我们*也许*会推出

- 使用命令行阅读我们最新的更新日志、博客文章或者论坛帖子；
- 使用命令行登录论坛，发表纯文本信息、回复等；
- 使用命令行与服务器内的玩家进行对话。

具体地，我们会在程序基础框架正式完成不久之后发布简明的教程，用于阐述该脚本的基本用法。

## 如何使用

不同于 Batch 脚本，Powershell 脚本默认只能以单指令形式执行，即如果要写成脚本文件并运行，就需要额外的配置。同时，该工具与外界网络有交互，通常情况下也会被自动拦截。因此，我们必须在正式运行之前允许它运行。

**以管理员身份**打开 Powershell，键入如下指令后回车

```powershell
Set-ExecutionPolicy RemoteSigned
```

接下来会提示「执行策略更改」，需要你的确认。输入大写的 `Y` 或者 `A` 并回车以确认。如果没有执行上面的操作，恐怕在使用期间键入任何指令都会提示下面的错误。

```
无法加载文件 *.ps1，因为在此系统上禁止运行脚本
```

完成执行权限设置后，选择一个程序入口即可开始使用。

#### 针对 Python 版本的说明

Python 版本并非提供给用户进行日常所用，但我们仍然会做出一个在命令行能够运行的简单脚本。具体地，Python 版本将来的发展方向更像是一个简易的 SDK。但如果 SoTap 在将来所推出的 API 以及相关的需求越来越少，Python 版本可能停止更新。

## 关于程序入口

为了使整个程序更易于使用，我们分别或即将做出六个程序入口。以下我们用表格的形式列出每个程序入口的名称、路径以及特点。

|文件名|路径|所属系统|特点|开发者|
|:-:|:-:|:-:|:-:|:-:|
|`main.cmd`|`/win`|Windows|以 CMD 形式出现的程序入口，双击即可运行，是 Windows 系统下的主要入口。但其指令反应速度较慢，大部分是 Powershell 所导致。|✔|
|`main.ps1`|`/win/functions`|Windows|Windows 的程序核心文件，但也是入口之一。用于在 Powershell 或 CMD 中直接以传参的方式调用，同时可用于其他程序的拓展。|✔|
|`easymode.cmd`|`/win`|Windows|以 CMD 形式出现的简单程序入口，其指令都经过了简化，更利于新手或者单纯的阅读者使用。局限性较大，但对于一般用户来说足矣。|❌|
|`main.py`|`/python`|All|以 Python 脚本形式出现的程序入口，可用于所有的操作系统。在使用之前必须安装 Python >= 3.6 环境，且安装相应的依赖（*以后列出*）。|✔|
|`api.py`|`/python`|All|以 Python 脚本形式出现的函数库，用于 Python 语言对于 SoTap 所有 API 的开发。提供了大部分可能用到的函数，简化需求。具体推出时间较晚。|✔|
|*?*|*?*|*?*|*?*|✔|

## 语言信息

Commandline Reader 使用三种脚本语言开发，在将来可能引入更多脚本语言或者 Java 语言。

- Python >= 3.6
- Powershell > 3.0
- Batchfile

为了使其能够正常运行，请确保自己的系统在 Windows 7 或以上，macOS X 10.12 或以上，Ubuntu 18.04 LTS 或以上。至于其它系统，请自行斟酌和试验。

