<#
Forest/domain setup script.
Run one line at a time, under supervision!
#>

# Set the forest name
$FOREST = 'ads.jburns.com'

# Name the first DC computer
Rename-Computer -NewName dc-1
# Check existing IP addresses
Get-NetIPAddress
# My interface index was #5 - I was using a lan segment so could choose my own IP range
New-NetIPAddress -InterfaceIndex 5 -IPAddress 172.28.78.100 -PrefixLength 22 -DefaultGateway 172.28.76.20
# Now reboot
Restart-Computer

# Install the required features
Install-WindowsFeature -name AD-Domain-Services -IncludeManagementTools
# Create the root domain
Install-ADDSForest -DomainName $FOREST
# Make sure DNS was installed
Get-WindowsFeature | where {($_.name -like "DNS")}
# Install DHCP 
Install-WindowsFeature DHCP -IncludeManagementTools
# First DC, so set external time synch
#w32tm /config /manualpeerlist:172.28.64.1 /syncfromflags:manual /update


