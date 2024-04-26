$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$checksumType  = 'sha256'
$checksum      = 'F22048A792B4AF556AF531FA2188DA7C5833EB565F1DB8AB45AE7CE29ACAD42D'
$url           = 'https://download.pdfforge.org/download/pdfcreator-server/3.2.0/PDFCreator-Server-3_2_0-Setup.exe?file=PDFCreator-Server-3_2_0-Setup.exe&download'
$url32         = 'https://download.pdfforge.org/download/pdfcreator-server/3.2.0/PDFCreator-Server-3_2_0-Setup.exe?file=PDFCreator-Server-3_2_0-Setup.exe&download'

$packageArgs = @{
  packageName   = 'pdfcreator-server'
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url32
  url64bit      = $url
  softwareName  = 'PDFCreator Server'
  checksumType  = $checksumType 
  checksum      = $checksum
  checksum64    = $checksum
  silentArgs    = "/COMPONENTS='MAINPROGRAM,HOTFOLDER,IMAGES2PDF' /VERYSILENT /DEFERLICENSECHECK"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
