$cwd = (Split-Path -Parent $MyInvocation.MyCommand.Definition)
$cwdp = $cwd + "\"

function out() {
    Write-Output $args
}
function outc([string]$ForegroundColor) {
    $fc = $host.UI.RawUI.ForegroundColor
    $host.UI.RawUI.ForegroundColor = $ForegroundColor
    Write-Output $args
    $host.UI.RawUI.ForegroundColor = $fc
}

function decode([string]$jsonString) {
    return ($jsonString | ConvertFrom-Json)
}

function getUrlFromMap([string]$target) {
    $json = decode (Get-Content ($cwdp + "targetmap.json"))
    return ("https://" + $json.$target)
}

function get([string]$target, [string]$comp, $para) {
    # $para 对应调用语句中的 $ag[3..$ag.Count]
    $url = (getUrlFromMap $target) + $comp + "?" + ($para -join "&")
    try {
        $result = Invoke-WebRequest $url -Method "GET" -UseBasicParsing
    } catch {
        return -1
    }
    if ($result.StatusCode -eq 200) {
        $c = decode $result.Content
        # 如果 $c 的 code 属性存在，或者 $c 根本就不存在，则判定为请求失败
        if ((404, 500, 400) -contains $c.code) {
            return 0
        } else {
            return $c
        }
    } else {
        return 0
    }
}