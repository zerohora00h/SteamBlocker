@echo off
setlocal

echo Script will be opened...
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0steam_block.ps1""' -Verb RunAs"

exit