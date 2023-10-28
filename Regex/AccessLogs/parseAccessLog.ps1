$path = "C:\Sandbox\PowerShell\Powershell_Exercises\Regex\AccessLogs\access_log.txt"

$contents = Get-Content -Path $path 

$matches = $contents | Select-String -AllMatches -Pattern "User:[\w]+"
$actionmatches = $contents | Select-String -AllMatches -Pattern "Action:[\w\s]+"
$IPmatches = $contents | Select-String -AllMatches -Pattern "IP:[\w\.]+"

$userNameArray = @()
$ActionArray = @()
$IPArray = @()


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

foreach ($ip in $IPmatches.matches.value) {
	#$ip
	$IPArray += ($ip -Split ":")[1] 
}

#$userNameArray
#$IPArray

$userHash = @{}
$ipHash = @{}

foreach ($un in $userNameArray) {
	if($userHash.$un -eq $null) {
		#Write-host "NULL"
		$userHash.$un = 0
	} else {
			$userHash.$un++
	}
}

#$ActionArray.count

<# for(($i = 0); ($i -lt $ActionArray.count); ($i++))
{
 	#$ActionArray[$i]
	#$UserNameArray[$i] 
	
	if($userHash["$UserNameArray[$i]" + "$ActionArray[$i]"] -eq $null)
	{
		$userHash["$UserNameArray[$i]" + "$ActionArray[$i]"] = 0
	} else
	{
		$userHash["$UserNameArray[$i]" + "$ActionArray[$i]"]++
	}
		
	
}	 #>

for ($i = 0; $i -lt $ActionArray.count; $i++) {
    $action = $ActionArray[$i]
    $username = $UserNameArray[$i]

    $key = "$username$action"

    if ($userHash[$key] -eq $null) {
        $userHash[$key] = 1
    } else {
        $userHash[$key]++
    }
}
	
#$userHash	
<# $UserNameArray[1]
$ActionArray[1]
 #>

Write-Host "*********"

$hold = 1
#Write-Host "$UserNameArray[$hold]" + "$ActionArray[$hold]"

for ($i = 0; $i -lt $IParray.count; $i++) {
    $action = $ActionArray[$i]
    $ip = $IParray[$i]

    $key = "$ip$action"
	if($action -eq "Login")
	{
		if ($ipHash[$key] -eq $null) {
			$ipHash[$key] = 1
		} else {
			$ipHash[$key]++
		}
	}
}
	
$userHash
Write-Host "*******************"
$ipHash