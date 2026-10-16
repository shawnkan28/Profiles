$dir = $env:USERPROFILE + "\bin"
$userPath = [Environment]::GetEnvironmentVariable("Path", "User")
if(($userPath -split ";") -notcontains $dir) {
	[Environment]::SetEnvironmentVariable("Path", $env:Path + ";" + $env:USERPROFILE + "\bin", "User")
	"Added $dir"
} else {
	"bin already in PATH"
}

if(-not (Test-Path $dir)) {
	New-Item -ItemType Directory -Path $dir | Out-Null
	"Created folder $dir"
} else {
	"$dir already exist."
}

# Copy all command files to bin folder
Copy-Item -Path *.cmd -Destination $dir
Copy-Item -Path *.ps1 -Destination $dir