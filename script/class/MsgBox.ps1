# MsgBox Class

# アセンブリのロード
Add-Type -AssemblyName System.Windows.Forms

class MsgBox {
    [string] $msgStr = ""
    [string] $msgTitle = ""
    [string] $msgBtn = ""
    [string] $msgIcon = ""
    [string] $msgBtnPosition = ""
    
    # コンストラクタ
    MsgBox() {}

    # ワーニング
    warningMsg([string] $msgStr) {
        $this.msgStr = $msgStr
        $this.msgTitle = "警告メッセージ"
        $this.msgBtn = "OK"
        $this.msgIcon = "Exclamation"
        $this.msgBtnPosition = "button3"

        [System.Windows.Forms.MessageBox]::Show(
            $this.msgStr,
            $this.msgTitle, 
            $this.msgBtn,
            $this.msgIcon,
            $this.msgBtnPosition
        )
    }

}