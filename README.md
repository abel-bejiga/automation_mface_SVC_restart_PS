
# MFACE Service Restart Script

This PowerShell script is designed to **safely stop and start the "MFACE Service"** on a Windows machine and **restart the computer** once the service has successfully restarted.

---

## Features

- Checks if the `MFACE Service` exists before performing any actions.
- Stops the service if it is running and waits until it fully stops.
- Starts the service and verifies that it is running.
- Only restarts the PC if the service restart was successful.
- Provides clear logging in the PowerShell console.

---

## Prerequisites

- Windows PC
- PowerShell running **as Administrator**
- if service name is changed down the line -- Correct **service name** (verify with `Get-Service | Where-Object {$_.DisplayName -like "*MFACE*"}`) -> ... with the assumption of mface only having one service that have name value starting with MFACE

---

## Usage

1. Open **PowerShell as Administrator**.
2. Navigate to the folder containing the script:

```powershell
cd "C:\path\to\script"

