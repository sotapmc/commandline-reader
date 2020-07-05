$cwd = (Split-Path -Parent $MyInvocation.MyCommand.Definition)
$cwdp = $cwd + "\"
Import-Module ($cwdp + "function.psm1")

$global:savedValue = "none"
$ag = $args -split " "
switch ($ag[0]) {
    "get" {
        $r = get $ag[1] $ag[2] $ag[3..$ag.Count]
        if ($r -eq 0) {
            outc red "����ʧ�ܻ��޽�����أ���������Ƿ�Ϻ��淶��"
        } elseif ($r -eq -1) {
            outc yellow ("�������쳣����������Ƿ���д������·���Ƿ���ȷ��")
        } else {
            $global:savedValue = $r
            out $r
        }
    }

    "post" {
        outc red "���޿��õ� POST ���󷽷���"
    }

    "help" {
        if (Test-Path ($cwdp + "*") -Include "help.txt") {
            $c = Get-Content ($cwdp + "help.txt")
        } else {
            $c = "�����ļ�ȱʧ��"
        }
        out $c
    }

    "copy" {
        # Bug: �����ȫ���������޷�����
        Set-Clipboard -Value $global:savedValue
        out $global:savedValue
    }

    default {
        outc red ("�޷�ʶ������" + $args)
    }
}