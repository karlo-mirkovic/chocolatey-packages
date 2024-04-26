$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$checksumType  = 'sha256'
$checksum      = 'E1783858C5E8408A27400157C77A4954776316D186B3C81FDE4CA736D3E4EBA4'
$url           = 'https://download.pdfforge.org/download/pdfcreator-terminal-server/5.2.1/PDFCreator-Terminal-Server-5_2_1-Setup.exe?file=PDFCreator-Terminal-Server-5_2_1-Setup.exe&download'
$url32         = 'https://download.pdfforge.org/download/pdfcreator-terminal-server/5.2.1/PDFCreator-Terminal-Server-5_2_1-Setup.exe?file=PDFCreator-Terminal-Server-5_2_1-Setup.exe&download'

$packageArgs = @{
  packageName   = 'pdfcreator-terminal-server'
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url32
  url64bit      = $url
  softwareName  = 'PDFCreator Terminal Server'
  checksumType  = $checksumType 
  checksum      = $checksum
  checksum64    = $checksum
  silentArgs    = "/COMPONENTS='MAINPROGRAM,HOTFOLDER,IMAGES2PDF' /VERYSILENT /DEFERLICENSECHECK"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
