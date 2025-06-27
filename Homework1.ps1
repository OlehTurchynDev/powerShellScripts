$computerName = [System.Environment]::MachineName
Write-Host "Computer Name: $computerName"

$os = Get-CimInstance Win32_OperatingSystem
$totalMemMB = [math]::Round($os.TotalVisibleMemorySize / 1024, 2)
$freeMemMB = [math]::Round($os.FreePhysicalMemory / 1024, 2)
Write-Host "Total Memory: $totalMemMB MB"
Write-Host "Free Memory: $freeMemMB MB"

$service = Get-Service -Name "wuauserv" -ErrorAction SilentlyContinue
if ($service -and $service.Status -eq 'Running') {
    Write-Host "Service 'wuauserv' is running"
} elseif ($service) {
    Write-Host "Service 'wuauserv' is installed but not running"
} else {
    Write-Host "Service 'wuauserv' not found"
}
