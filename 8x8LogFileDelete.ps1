#Create the Logfile
New-item -Path c:\Users\administrator.napa\Desktop -Name 8x8errorlog -ItemType File

#set $users to the users in the root directory and filters out anything that is not a folder
$users = Get-ChildItem c:\users | Where-Object { $_.PSIsContainer}

#set $userpath = to the location of the 8x8 VOD folder under each of the users
foreach ($user in $users){
    $userpath = "C:\Users\$user\AppData\Roaming\8x8 Work\8x8 Work\logs\vod"

#removes the folder under each of the users profiles
#if an error is recieved, the script should continue without flagging
    Try{
        Remove-Item $userpath\* -Recurse -Whatif -ErrorVariable error -ErrorAction SilentlyContinue  
    } 
#note each of the errors recieved and write them to the logfile, -append does not overwrite    
    catch {
        "$error" | Out-File c:\Users\administrator.napa\Desktop\8x8errorlog\errors.txt -append
    }
}