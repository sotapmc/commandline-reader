$cwd = (Split-Path -Parent $MyInvocation.MyCommand.Definition)
$cwdp = $cwd + "\"
Import-Module ($cwdp + "function.psm1")

$ag = $args -split " "
switch ($ag[0]) {
    "get" {
        $r = get $ag[1] $ag[2] $ag[3..$ag.Count]
        if ($r -eq 0) {
            outc red "请求失败或无结果返回，请检查参数是否合乎规范。"
        } elseif ($r -eq -1) {
            outc yellow ("请求发生异常，请检查参数是否填写完整或路径是否正确。")
        } else {
            out $r
        }
    }

    "post" {
        outc red "暂无可用的 POST 请求方法。"
    }

    "help" {
        if (Test-Path ($cwdp + "*") -Include "help.txt") {
            $c = Get-Content ($cwdp + "help.txt")
        } else {
            $c = "帮助文件缺失。"
        }
        out $c
    }

    default {
        outc red ("无法识别此命令：" + $args)
    }
}