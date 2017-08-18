$links = Get-Content -Raw -Path vsextensions.json | ConvertFrom-Json
Foreach ($link in $links.extensions)
{
  $url = $link.url
  $name = $link.name

  $destination = $PSScriptRoot + + $name.Substring($name.IndexOf("=")+1) + ".vsix"

  Write-Host "Downloading  $name from $uri"

  Invoke-Webrequest -Uri $url -OutFile "$destination"

  Write-Host "Downloaded  $name from $uri"

  Write-Host "Installing $name"

  Start-Process -FilePath $destination -ArgumentList '/install /quiet /norestart' -PassThru | Wait-Process

  Write-Host "Installed $name"

}
