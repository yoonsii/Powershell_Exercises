function Insert-File {
    param (
        $folderName
    )

    if(Test-Path -Path $path/$folderName) {
        "Path Exists"
    } else {
        "Does not exist!"
    }

}

$path = Read-Host -prompt "Put placeholder text here" #TODO : Change this to path later

$path = '/Users/yoonsi/Documents/Projects/Powershell_Exercises/Basics/FileSorting/'

Write-host $path 

Get-ChildItem -Path $path | ForEach-Object -Process {
    Write-Host $PSItem.Name.Split('.')[1] 

}

Insert-File -folderName Test


