$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$checksumType  = 'sha256'
$checksum      = '9C68A989F89C233BB4E191E4A8C2F6AEF79D4B272A00B82A736E2368E0936F4D'
$url           = 'https://download.pdfforge.org/download/pdfcreator/5.2.1/PDFCreator-5_2_1-Setup.exe?file=PDFCreator-5_2_1-Setup.exe&download'

$packageArgs = @{
  packageName   = 'pdfcreator'
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url
  softwareName  = 'PDFCreator'
  checksumType  = $checksumType
  checksum      = $checksum
  checksum64    = $checksum
  silentArgs    = "/COMPONENTS='MAINPROGRAM' /SILENT"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
