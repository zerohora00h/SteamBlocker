do {
    # Check current Steam status
    Write-Host "Checking Steam status..."
    if (Get-NetFirewallRule -DisplayName 'Block-Steam ZH' -ErrorAction SilentlyContinue) {
        Write-Host "STEAM IS BLOCKED." -ForegroundColor Red
    } else {
        Write-Host "STEAM IS UNBLOCKED." -ForegroundColor Green
    }

    Write-Host ""
    Write-Host "Select an option:"
    Write-Host "1. Block Steam"
    Write-Host "2. Unblock Steam"
    Write-Host "3. Exit"
    $action = Read-Host "Choose 1, 2, or 3"

    if ($action -eq "1") {
        if (Get-NetFirewallRule -DisplayName 'Block-Steam ZH' -ErrorAction SilentlyContinue) {
            Write-Host "Steam is already blocked!"
        } else {
            Write-Host "Blocking Steam..."
            New-NetFirewallRule -Action block -Program 'C:\Program Files (x86)\Common Files\Steam\SteamService.exe' -Profile any -Direction Outbound -DisplayName 'Block-Steam ZH' | Out-Null
            New-NetFirewallRule -Action block -Program 'C:\Program Files (x86)\Steam\bin\cef\cef.win7x64\steamwebhelper.exe' -Profile any -Direction Outbound -DisplayName 'Block-Steam ZH' | Out-Null
            New-NetFirewallRule -Action block -Program 'C:\Program Files (x86)\Steam\steam.exe' -Profile any -Direction Outbound -DisplayName 'Block-Steam ZH' | Out-Null
            Write-Host "Steam blocked successfully!"
        }
    } elseif ($action -eq "2") {
        Write-Host "Unblocking Steam..."
        Get-NetFirewallRule -DisplayName 'Block-Steam ZH' | Remove-NetFirewallRule | Out-Null
        Write-Host "Steam unblocked successfully!"
    } elseif ($action -eq "3") {
        Write-Host "Exiting..."
        break
    } else {
        Write-Host "Invalid option! Choose 1, 2, or 3."
    }

    Write-Host ""
    Write-Host "Press ENTER to continue..."
    Read-Host
} while ($true)