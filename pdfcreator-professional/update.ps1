Install-Module au

$softwareName = 'PDFCreator Professional'
$softwareNameWithDashes = $softwareName.Replace(' ','-')
$releases = 'https://download.pdfforge.org/download/' + $softwareNameWithDashes.ToLowerInvariant() + '/list'


function global:au_GetLatest {
  $download_page = Invoke-WebRequest $releases -UseBasicParsing
  $re = "\.exe$"
  $url = $download_page.Links | Where-Object href -match $re | Select-Object -Expand href -First 1
  $domain  = $releases -split '(?<=//.+)/' | Select-Object -First 1
  $version = $url -split '/' | Select-Object -Last 1 -Skip 1
  $versionWithUnderscore = [string]::Join('_', $version.split('.'))
  $setupFileName = $softwareNameWithDashes + '-' + $versionWithUnderscore + '-' + 'Setup.exe'
  $latestUrl = $domain + '/download/' + $softwareNameWithDashes.ToLowerInvariant() + '/' + $version + '/' + $setupFileName + '?' + 'file=' + $setupFileName + '&download'
  @{
      URL         = $latestUrl
      Version     = $version
      PackageName = $softwareNameWithDashes.ToLowerInvariant()
      FileName32  = $url -split 'file=' | Select-Object -Last 1
      FileType    = 'exe'
  }
}

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1"   = @{
        "(?i)(^[$]checksum\s*=\s*)'.*'"           = "`${1}`'$($Latest.Checksum32)`'"
        "(?i)(^[$]url\s*=\s*)'.*'"                = "`${1}`'$($Latest.URL)`'"
    }
  }
}

update