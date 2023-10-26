$path = "C:\Sandbox\PowerShell\Powershell_Exercises\Regex\AccessLogs\access_log.txt"

$contents = Get-Content -Path $path 

$matches = $contents | Select-String -AllMatches -Pattern "User:[\w]+"
$actionmatches = $contents | Select-String -AllMatches -Pattern "Action:[\w\s]+"

$userNameArray = @()
$ActionArray = @()


#$matches | ForEach-Object {
#	$userNameArray += $matches.matches.value
#}

#foreach ($uN in $userNameArray) {
	
#	Write-Host "From the Array:" $userNameArray
	
#}

foreach ($m in $matches.matches.value) {
	$userNameArray += ($m -Split ":")[1]
}

foreach ($am in $actionmatches.matches.value) {
	$ActionArray += (($am -Split ":")[1] -Split " ")[1] 
}


$ActionArray