$vsExtnDestination =  $PSScriptRoot + "\vsextensions.json"
$vsixinstallerlocation = "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\IDE\VSIXInstaller.exe"

$links = Get-Content -Raw -Path $vsExtnDestination | ConvertFrom-Json

Foreach ($link in $links.extensions)
{
  $uri = $link.url
  $name = $link.name

  $destination = $PSScriptRoot + "\" + $uri.Substring($uri.LastIndexOf("/")+1)
  $argument = "/quiet " + $destination

  Write-Host "Downloading  $name from $uri"

  Invoke-Webrequest -Uri $uri -OutFile $destination

  Write-Host "Downloaded  $name"

  Write-Host "Installing $name from $destination"

  Start-Process -FilePath $vsixinstallerlocation -ArgumentList $argument -PassThru | Wait-Process

  Write-Host "Installed $name"

}
