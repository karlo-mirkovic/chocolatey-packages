$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$checksumType  = 'sha256'
$checksum      = '9c68a989f89c233bb4e191e4a8c2f6aef79d4b272a00b82a736e2368e0936f4d'
$url           = 'https://download.pdfforge.org/download/pdfcreator/5.2.1/PDFCreator-5_2_1-Setup.exe?file=PDFCreator-5_2_1-Setup.exe&download'

$packageArgs = @{
  packageName   = 'pdfcreator'
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'PDFCreator'
  checksumType  = $checksumType
  checksum      = $checksum
  silentArgs    = "/COMPONENTS='MAINPROGRAM' /SILENT"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
