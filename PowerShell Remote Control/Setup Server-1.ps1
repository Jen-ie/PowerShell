<#
Server setup script.
Run one line at a time, under supervision!
#>

# Name the first DC computer
Rename-Computer -NewName server-1
# Check existing IP addresses
Get-NetIPAddress
# My interface index was #3, get an IP address from the lecturer, the range is 172.28.78.1-50
New-NetIPAddress -InterfaceIndex 3 -IPAddress 172.28.78.200 -PrefixLength 22 -DefaultGateway 172.28.76.20
# Set DC-1 as being the DNS
Set-DnsClientServerAddress -InterfaceIndex 3 -ServerAddresses 172.28.78.100
# Join the domain, you will be asked for dc-1 username and password
add-computer –domainname "ads.jburns.com"  -restart
# Now reboot
Restart-Computer
# Allow for remote scripting
Enable-PSRemoting