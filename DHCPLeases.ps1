# Get DHCP leases and display with specified headers
$leases = Get-DhcpServerv4Scope | ForEach-Object {
    Get-DhcpServerv4Lease -ScopeId $_.ScopeId | Select-Object @{
        Name='ScopeId'; Expression={$_.ScopeId}
    }, IPAddress, HostName, ClientId, AddressState
}

# Display the leases with appropriate headers
$leases | Format-Table -Property ScopeId, IPAddress, HostName, ClientId, AddressState -AutoSize

# Export to CSV (optional)
$leases | Export-Csv -Path "DHCPLeases.csv" -NoTypeInformation -Delimiter ";" -Encoding UTF8

Write-Host "DHCP leases have been displayed above and exported to DHCPLeases.csv"