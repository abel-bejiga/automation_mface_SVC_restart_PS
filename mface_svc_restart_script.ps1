# MFACE service restart tool

$serviceName = "MFACE Service"

Write-Host "Checking Service: $serviceName"

$service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue

if (-not $service){
	Write-Error "Service `$serviceName` not found. Aborting ... "
	exit 1
}

# stop service if runnig

if ($service.Status -ne "Stopped"){
	Write-Host "Stopping Service..."
	Stop-Service -Name $serviceName -Force
	$service.WaitForStatus("Stopped", "00:00:30")
}

# Start mface Serivce

Write-Host "Starting service..."
Start-Service -Name $serviceName
$service.WaitForStatus("Running", "00:00:30")

$service.Refresh()
if ($service.status -eq "Running"){
	Write-Host "service restarted successfully. rebooting PC ...."
	Restart-Computer -Force
} else {
	Write-Error "Servic failed to start... System will Not reboot"
	exit 1
}
