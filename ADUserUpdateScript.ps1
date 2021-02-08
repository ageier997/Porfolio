#sets UserUpdate = to the path to the file
\
Import-Module activedirectory
$UserUpdate = Import-Csv  "\\FILESERVER\IT Share\ADUserUpdateScript\ADUpdate1.csv"

foreach($user in $UserUpdate){
    # Find user
    $ADUser = Get-ADUser -Filter "name -eq $user.name"
    if ($ADUser){
        Set-ADUser -Identity $ADUser -Title $user.jobtitle

        Set-ADUser -Identity $ADUser -Department $user.department
	
	Set-ADUser -Identity $ADUser -office $user.office

    }else{
    # outputs to a log file 
    $user|Format-Table -auto | Out-String | Out-File 'C:\ADUpdate Log File\ADUserUpdate.log' -append    
 }
}