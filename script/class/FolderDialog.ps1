# FolderDialog Class

# name space
[void][System.Reflection.Assembly]::LoadWithPartialName("system.windows.forms")

class FolderDialog {

    [object] $dialog
    [string] $selectDirpath

    # コンストラクタ
    FolderDialog() {
        $this.dialog = New-Object System.Windows.Forms.FolderBrowserDialog
        $this.dialog.Description = "フォルダ選択"
        $this.selectDirpath = ""
    }

    # フォルダダイアログ実行
    [boolean] showDialog() {
        [boolean] $result = $false
        
        if($this.dialog.ShowDialog() -eq "ok"){
            $result = $true
            $this.selectDirpath = $this.dialog.SelectedPath
        }

        return $result
    }

    # フォルダダイアログで選択したフォルダまでのパスを取得
    [string] getSelectDirPath() {
        return $this.selectDirpath
    }
}