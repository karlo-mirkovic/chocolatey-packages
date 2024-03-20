Install-Module au

$releases = 'https://download.pdfforge.org/download/pdfcreator-professional/list'

function global:au_GetLatest {
    $download_page = Invoke-WebRequest $releases -UseBasicParsing
    $regex = "\.exe$"
    $latestVersionUrl = $download_page.Links | Where-Object href -match $regex | Select-Object -Expand href -First 1
    $domain  = $releases -split '(?<=//.+)/' | Select-Object -First 1
    $version = $latestVersionUrl -split '/' | Select-Object -Last 1 -Skip 1
    @{
        URL         = $domain + $latestVersionUrl + "&download"
        Version     = $version
    }
}

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1"   = @{
      "(?i)(^[$]url\s*=\s*)'.*'"                = "`${1}$($Latest.URL)`""
      "(?i)(^[$]checksum\s*=\s*)'.*'"           = "`${1}$($Latest.Checksum)`""
    }
  }
}

update