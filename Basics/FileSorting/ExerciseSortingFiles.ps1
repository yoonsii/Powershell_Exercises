function Insert-File {
    param (
        $folderName,
        $file
    )

    if(Test-Path -Path $path/$folderName) {
        Move-Item -Path "$path/$file.$folderName" -Destination $path/$folderName/
        Write-Host "Moving File $path/$file.$folderName to $path/$folderName/" 
    } else {
        Write-Host "Creating Folder: $folderName"
        New-Item -Path $path -Name $folderName -ItemType "Directory"
        Move-Item -Path "$path/$file.$folderName" -Destination $path/$folderName/
        Write-Host "Moving File $path/$file.$folderName to $path/$folderName/" 
    }
}

$path = Read-Host -prompt "Put placeholder text here" #TODO : Change this to path later

$path = '/Users/yoonsi/Documents/Projects/Powershell_Exercises/Basics/FileSorting/'

#Write-host $path 

Get-ChildItem -Path $path | ForEach-Object -Process {
    $filename = $PSItem.Name.Split('.')[0] 
    $extension = $PSItem.Name.Split('.')[1] 

    #$filename
    #$extension

    if ($extension -eq "txt" -or $extension -eq "docx" -or $extension -eq "xlsx" -or $extension -eq "pdf") {
        Insert-File -folderName $extension -file $filename
        #TODO : Output to a log file
    }

}




