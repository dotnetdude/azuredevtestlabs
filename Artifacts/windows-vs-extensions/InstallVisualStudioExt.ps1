$vsExtnDestination =  $PSScriptRoot + "\vsextensions.json"
$links = Get-Content -Raw -Path $vsExtnDestination | ConvertFrom-Json
Foreach ($link in $links.extensions)
{
  $uri = $link.url
  $name = $link.name

  $destination = $PSScriptRoot + "\" + $uri.Substring($uri.LastIndexOf("/")+1)

  Write-Host "Downloading  $name from $uri"

  Invoke-Webrequest -Uri $uri -OutFile $destination

  Write-Host "Downloaded  $name"

  Write-Host "Installing $name from $destination"

  Start-Process -FilePath $destination -ArgumentList '/install /quiet /norestart' -PassThru | Wait-Process

  Write-Host "Installed $name"

}
