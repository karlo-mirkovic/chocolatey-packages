# IMPORTANT: Before releasing this package, copy/paste the next 2 lines into PowerShell to remove all comments from this file:
#   $f='c:\path\to\thisFile.ps1'
#   gc $f | ? {$_ -notmatch "^\s*#"} | % {$_ -replace '(^.*?)\s*?[^``]#.*','$1'} | Out-File $f+".~" -en utf8; mv -fo $f+".~" $f

$ErrorActionPreference = 'Stop' # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$checksumType  = 'sha256'
$checksum      = '9BBA1C537ABA79C0294ED373727E876814781F4640D5FFD796AD543182375B8B'
$url           = 'https://download.pdfforge.org/download/pdfcreator-professional/5.2.1/PDFCreator-Professional-5_2_1-Setup.exe?file=PDFCreator-Professional-5_2_1-Setup.exe&download'

$packageArgs = @{
  packageName   = 'pdfcreator-professional'
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url
  softwareName  = 'PDFCreator Professional'
  checksumType  = $checksumType 
  checksum      = $checksum
  checksum64    = $checksum
  silentArgs    = "/COMPONENTS='MAINPROGRAM,HOTFOLDER,IMAGES2PDF' /VERYSILENT /DEFERLICENSECHECK"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs