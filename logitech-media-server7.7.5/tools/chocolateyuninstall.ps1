﻿$processor = Get-WmiObject Win32_Processor
$is64bit = $processor.AddressWidth -eq 64
if ($is64bit) {
  $unpath = "${Env:ProgramFiles(x86)}\Squeezebox\unins000.exe"
  } else {
  $unpath = "${Env:ProgramFiles}\Squeezebox\unins000.exe"
  }
$packageName = 'logitech-media-server'
$softwareName = 'Logitech Media Server*' 
$installerType = 'EXE' 
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' 
$validExitCodes = @(0)

Uninstall-ChocolateyPackage $packageName $installerType `
  $silentArgs $unpath -validExitCodes $validExitCodes