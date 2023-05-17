# indlucde class
. $PSScriptRoot"\class\FolderDialog.ps1"


function main() {
    [object] $fd = New-Object FolderDialog

    if( !($fd.showDialog()) ) {
        Write-Host "フォルダが選択されませんでした"
        Write-Host "処理を停止しました"
        exit
    }
    
    [string] $searchFilePath = Join-Path $fd.getSelectDirPath() "*.zip"
    [array] $zipFiles = Get-ChildItem $searchFilePath -File -Name

    if($zipFiles.Count -eq 0) {
        Write-Host "フォルダ内に「.zip」ファイルが存在しません"
        Write-Host "処理を停止しました"
        exit
    }

    foreach($zipFile in $zipFiles){
        [string] $zipFilePath = Join-Path $fd.getSelectDirPath() $zipFile
        Expand-Archive -Path $zipFilePath -DestinationPath $fd.getSelectDirPath() -Force
    }

    Write-Host "処理完了"
}
main