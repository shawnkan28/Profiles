param(
    [string]$project,
    [string]$platform="linux/arm64",
    [string]$ver="latest",
    [string]$dest="\\shawn-rpi\files\docker-images"
)

# Get Project Name
if($project -eq ""){
    $project = (Get-Item .).Name.toLower()
}

# Get platform Type
$platType = $platform.Replace("/", "-")

# Check if Docker file exist
if(-not (Test-Path .\Dockerfile -PathType Leaf)){
    Write-Error "No Dockerfile found in $PWD. Run this from the project folder."
    exit 1
}

#TODO: I need to zip this file now, then move it to the RPI SAMBA folder
$filename = "$project.$platType.tar"
docker buildx build --platform $platform -t "${project}:$ver" --output "type=docker,dest=$filename" .

$in = [IO.File]::OpenRead("$PWD\$filename")
$out = [IO.File]::Create("$PWD\$filename.gz")
$gz = New-Object IO.Compression.GZipStream($out, [IO.Compression.CompressionLevel]::Optimal)
$in.CopyTo($gz)
$gz.Dispose(); $out.Dispose(); $in.Dispose()

Remove-Item $filename

If(-not (Test-Path $dest)) {
    Write-Error "Can't reach $dest. Is the Pi on and are you logged in to the share?"
    exit 1
}
Move-Item "$PWD\$filename.gz" $dest -Force
"Moved to $dest"