@echo off
wevtutil /r:<DHCP_SERVER_ADDR> qe Microsoft-Windows-Dhcp-Server/FilterNotifications /c:30 /rd:true /f:xml /e:root /q:"Event[System[EventID=20100 or EventID=20097]]" > <OUTPUT_FILE_NAME>.xml
