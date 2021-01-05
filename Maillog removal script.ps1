

#change logpath
#change *.txt to log type

$logpath = "C:\Users\alexg\Desktop\AlexTest"
Get-ChildItem $logpath -recurse *.txt -force | where {$_.LastWriteTime -gt (Get-Date).AddDays(30)}
Remove-Item -force