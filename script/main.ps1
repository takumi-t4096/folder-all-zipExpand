# include Class
. $PSScriptRoot"\class\FolderDialog.ps1"
. $PSScriptRoot"\class\MsgBox.ps1"


function main() {
    [object] $fd = New-Object FolderDialog
    [object] $mb = New-Object MsgBox

    if( !($fd.showDialog()) ) {
        $mb.warningMsg("フォルダが選択されませんでした`r`n処理を終了しました")
        exit
    }
    
    [string] $searchFilePath = Join-Path $fd.getSelectDirPath() "*.zip"
    [array] $zipFiles = Get-ChildItem $searchFilePath -File -Name

    if($zipFiles.Count -eq 0) {
        $mb.warningMsg("フォルダ内に「.zip」ファイルが存在しません`r`n処理終了しました")
        exit
    }

    foreach($zipFile in $zipFiles){
        [string] $zipFilePath = Join-Path $fd.getSelectDirPath() $zipFile
        Expand-Archive -Path $zipFilePath -DestinationPath $fd.getSelectDirPath() -Force
    }

    Write-Host "処理完了"
}
main