# Set the path to the directory where you want to create the dummy files
$directory = "/Users/yoonsi/Documents/Projects/Powershell_Exercises/Basics/FileSorting/"

# Create 10 dummy files
1..10 | ForEach-Object {
    # Generate a random file name
    $fileName = "DummyFile$_" + (Get-Random -Minimum 1000 -Maximum 9999)
    
    # Generate a random file extension from a list of extensions
    $extensions = @(".txt", ".docx", ".xlsx", ".pdf")
    $extension = $extensions | Get-Random
    
    # Create the dummy file
    $null = New-Item -Path "$directory\$fileName$extension" -ItemType File
}

Write-Host "Dummy files created in $directory"
