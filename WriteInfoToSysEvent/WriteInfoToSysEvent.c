#include <windows.h>
//Function adds entry to Windows event log
// Params:
// LPTSTR message: this message will be added to log
// DWORD informationtype : info kind possibly values are
// EVENTLOG_ERROR_TYPE 1
// EVENTLOG_WARNING_TYPE 2
// EVENTLOG_INFORMATION_TYPE 4
// see winbase.h
void AddToMessageLog(LPCSTR SERVICENAME, LPTSTR message, DWORD informationtype)
{
    int dwErr;
	TCHAR MSG[256];
	HANDLE eventSource;
	const char *strings[2];

	dwErr=GetLastError();
	eventSource=RegisterEventSource( NULL, TEXT(SERVICENAME) );

	sprintf(MSG, TEXT("%s error: %ld"), TEXT(SERVICENAME), dwErr);
	strings[0]=MSG;
	strings[1]=message;

	if (eventSource!=NULL)
	{
		ReportEvent(eventSource,
			informationtype,
			0,
			0,
			NULL,
			2,
			0,
			strings,
			NULL);

		(void) DeregisterEventSource(eventSource);
	}
}
int main(int argc, char *argv[]) {
    AddToMessageLog("EVT_WRITE_TEST", "Test error message", 1);
	return 0;
}