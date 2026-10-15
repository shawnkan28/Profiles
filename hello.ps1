param(
    [string]$Name = "World",
    [switch]$Loud
)

$msg = "Hello, $Name!"
if($Loud) { $msg = $msg.ToUpper() }
write-host $msg