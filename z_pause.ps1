if( [Environment]::CommandLine -imatch "keepopen" ) {
  kill $((gwmi win32_process -Filter "processid='$pid'").parentprocessid)
  write-host "Press any key to continue..." -NoNewLine
  read-host
}
