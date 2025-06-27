# # $a = 1,2,3,4,5
# # $a[0..4]

# # $person = [PSCustomObject]@{
# #     Name = "John"
# #     FullName = "Doe"
# #     Age = 30
# #     City = "New York"
# # }

# # "FullName : $($person.Name) $($person.FullName)"
# # $person.Age

# #List of Custom Objects
# $people = @(
#     [PSCustomObject]@{ Name = "Alice"; Age = 28; City = "Los Angeles" },
#     [PSCustomObject]@{ Name = "Bob"; Age = 35; City = "Chicago" },
#     [PSCustomObject]@{ Name = "Charlie"; Age = 22; City = "Miami" }
# )
# foreach ($p in $people) {
#     "Name: $($p.Name), Age: $($p.Age), City: $($p.City)"
# }
# # Example of a simple function
# function Get-Greeting {
#     param (
#         [string]$Name
#     )
#     return "Hello, $Name!"
# }
# # Call the function
# $greeting = Get-Greeting -Name "Alice"
# "Function Output: $greeting"
# # Example of a loop
# for ($i = 1; $i -le 5; $i++) {
#     "Iteration: $i"
# }
# # Example of a conditional statement
# if ($greeting -like "Hello*") {
#     "Greeting starts with 'Hello'"
# } else {
#     "Greeting does not start with 'Hello'"
# }
# # Example of a switch statement
# switch ($greeting) {
#     { $_ -like "Hello*" } { "Greeting is a hello message"; break }
#     { $_ -like "Goodbye*" } { "Greeting is a goodbye message"; break }
#     default { "Greeting is something else" }
# }
# # Example of a try-catch block
# try {
#     $result = 10 / 0  # This will cause a division by zero error
# } catch {
#     "An error occurred: $_"
# } finally {
#     "This block always executes"
# }
# # Example of a pipeline operation
# $numbers = 1..10
# $evenNumbers = $numbers | Where-Object { $_ % 2 -eq 0 }
# "Even Numbers: $($evenNumbers -join ', ')"
# # Example of using a hashtable
# $hashtable = @{
#     Name = "John"
#     Age = 30
#     City = "New York"
# }
# "Name: $($hashtable.Name), Age: $($hashtable.Age), City: $($hashtable.City)"
# # Example of using a script block
# $scriptBlock = {
#     param ($name)
#     "Hello, $name!"
# }
# # Invoke the script block
# $scriptBlock.Invoke("Bob")
# # Example of using a class
# class Person {
#     [string]$Name
#     [int]$Age
#     [string]$City

#     Person([string]$name, [int]$age, [string]$city) {
#         $this.Name = $name
#         $this.Age = $age
#         $this.City = $city
#     }

#     [string]ToString() {
#         return "Name: $($this.Name), Age: $($this.Age), City: $($this.City)"
#     }
# }


# # Pipeline 
# # Command 1 | Command 2 | Command 3

# Get-Service | Where-Object { $_.Status -eq 'Stopped' } | Select-Object Name, DisplayName
# Set-Location -Path "D:\Repos\ngx-admin-demo" `
#     ; ng serve --port 4200 --host 0.0.0.0`
#     ; Start-Process "http://localhost:4200" `
#     ; Set-Location -Path "D:\Repos\ngx-admin-demo\src\app\pages\dashboard\dashboard.component.ts" `
#     ; code . `

# Example of creating a file in a specified directory
# This function creates a file in the specified directory and returns a message.

# function Create-FileInDirectory {
#     param (
#         [string]$Directory,
#         [string]$FileName
#     )

#     # Ensure the directory exists
#     if (-not (Test-Path -Path $Directory)) {
#         New-Item -ItemType Directory -Path $Directory | Out-Null
#     }

#     # Create the file
#     $filePath = Join-Path -Path $Directory -ChildPath $FileName
#     New-Item -ItemType File -Path $filePath -Force | Out-Null
    

#     return "File created at: $filePath"
# }
# # Example usage of the Create-FileInDirectory function
# $directoryPath = "D:\Repos"
# $fileName = "example.txt"
# $result = Create-FileInDirectory -Directory $directoryPath -FileName $fileName
# Write-Output $result

# How lo call other scripts in PowerShell
# You can call other scripts in PowerShell using the dot-sourcing method or by using the `&` operator.
# Dot-sourcing example
# . .\OtherScript.ps1  # This will execute the script in the current scope
# # Using the & operator
# & .\OtherScript.ps1  # This will execute the script in a new scope

# $exe = "ping"
# $arg = "google.com"
# & $exe $arg


# Створюємо змінні 
$DirectoryPath = "D:\Repos\PowerShell_Scripts"
$ChildPath = "Homework1.ps1"
$FullPath = Join-Path -Path $DirectoryPath -ChildPath $ChildPath

# Створюємо директорію та файл, якщо їх немає
New-Item -ItemType Directory -Path $DirectoryPath -Force
New-Item -ItemType File -Path $FullPath -Force
Write-Output "File created at: $FullPath"

# Перевірка наявності файлу
Test-Path "D:\Repos\PowerShell_Scripts\Homework1.ps1"

# Запуск скрипту Homework1.ps1
# & "D:\Repos\PowerShell_Scripts\Homework1.ps1"

# 3. Вміст скрипту, який буде створено
$ScriptContent = @'
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
'@

# 4. Записати скрипт у файл
$ScriptContent | Set-Content -Path $FullPath -Encoding UTF8
Write-Host "Скрипт створено: $FullPath"
& "D:\Repos\PowerShell_Scripts\Homework1.ps1"
