# SteamBlocker

A Windows utility to block or unblock Steam's network access using firewall rules.

## Features
- Toggles Steam's network access (block/unblock) with a simple interface.
- Displays current Steam status (BLOCKED or UNBLOCKED) in color-coded output.
- Runs with administrative privileges via a batch script that launches a PowerShell script.
- Loops until the user chooses to exit.

## Requirements
- Administrative privileges to modify firewall rules.
- Steam installed at default path (`C:\Program Files (x86)\Steam`).

## Usage
1. Clone or download the repository.
2. Run `SteamBlock.bat` as a regular user.
3. Approve the UAC prompt to allow the PowerShell script to run with admin rights.
4. In the PowerShell window, choose an option:
   - `1`: Block Steam.
   - `2`: Unblock Steam.
   - `3`: Exit.
5. Press `ENTER` to continue or exit.

## Files
- `SteamBlock.bat`: Launches the PowerShell script with admin privileges.
- `steam_block.ps1`: Manages firewall rules and user interface.

## Notes
- Ensure Steam is installed in the default directory, or modify the paths in `steam_block.ps1` if installed elsewhere.
- The script creates firewall rules named `Block-Steam ZH`.

## License
MIT License. See [LICENSE](LICENSE) for details.
