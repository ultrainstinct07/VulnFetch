# Step 1: Get system information
$osArchitecture = (Get-CimInstance Win32_OperatingSystem).OSArchitecture
$manufacturer = (Get-CimInstance Win32_ComputerSystem).Manufacturer
$model = (Get-CimInstance Win32_ComputerSystem).Model
$biosVersion = (Get-CimInstance Win32_BIOS).SMBIOSBIOSVersion
$lastBootTime = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
$processor = (Get-CimInstance Win32_Processor).Name
$ram = "{0:N2}" -f ((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB)

# Step 2: Get Windows version details
$windowsDetails = Get-CimInstance -ClassName Win32_OperatingSystem
$windowsVersion = $windowsDetails.Version
$windowsBuild = $windowsDetails.BuildNumber
$windowsName = $windowsDetails.Caption

# Output system information
Write-Output "System Information:"
Write-Output "OS Architecture: $osArchitecture"
Write-Output "Manufacturer: $manufacturer"
Write-Output "Model: $model"
Write-Output "BIOS Version: $biosVersion"
Write-Output "Last Boot Time: $lastBootTime"
Write-Output "Processor: $processor"
Write-Output "RAM (GB): $ram"

# Output Windows version details
Write-Output "Windows Version: $windowsName"
Write-Output "Version: $windowsVersion"
Write-Output "Build: $windowsBuild"

# Step 3: Construct the Vulners API URL
$apiUrl = "https://vulners.com/api/v3/search/lucene/"

# Your Vulners API key
$apiKey = "424WYGNTT7IP8T8U58BTN5TVBLJXAKZKULML9NTEUQ80D2RGY7A2Q746TH22VA1Q"

# Use the windowsName dynamically in the search query
$searchQuery = "$windowsName AND CVE"  # Search for CVEs specific to the Windows version

# Step 4: Create the JSON payload
$payload = @{
    query   = $searchQuery
    skip    = 0
    size    = 20
    fields  = @("id", "published", "description", "type", "title", "cvelist")
    apiKey  = $apiKey
} | ConvertTo-Json -Depth 3

# Step 5: Make the API request
$response = Invoke-WebRequest -Uri $apiUrl `
                              -Method Post `
                              -Headers @{ "Content-Type" = "application/json" } `
                              -Body $payload

# Step 6: Parse the response content (it will be in JSON format)
$responseData = $response.Content | ConvertFrom-Json

# Step 7: Process the response and display vulnerabilities with a short description
Write-Output "Vulnerabilities for ${windowsName}:"
if ($responseData.result -eq "OK" -and $responseData.data.search) {
    $responseData.data.search | ForEach-Object {
        # Extract a small snippet of the description
        $shortDescription = $_._source.description -split "\n" | Select-Object -First 1
        Write-Output "CVE ID: $($_._source.cvelist[0])"
        Write-Output "Description: $shortDescription"  # Display short description
        Write-Output "Published: $($_._source.published)"
        Write-Output "--------------------------"
    }
} else {
    Write-Output "No vulnerabilities found for ${windowsName}."
}
