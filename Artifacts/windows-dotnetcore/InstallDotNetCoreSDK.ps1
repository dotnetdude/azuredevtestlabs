$dotNetCoreSDKurl = "https://aka.ms/dotnet-sdk-2.0.0-win-gs-x64"

$dotNetCoreSDKDestination =  $PSScriptRoot + "\dotnet-sdk-2.0.0-win-gs-x64.exe"

Write-Host "Downloading DotNet Core SDK"

Invoke-WebRequest -Uri $dotNetCoreSDKurl -OutFile $dotNetCoreSDKDestination

Write-Host "Completed downloading DotNet Core SDK"

Write-Host "Installing DotNet Core SDK"
Start-Process -FilePath $dotNetCoreSDKDestination -ArgumentList '/install /quiet /norestart' -PassThru | Wait-Process

Write-Host "Completed installing DotNet Core SDK"
