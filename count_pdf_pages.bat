@echo off
setlocal enabledelayedexpansion

REM Summerize how many page are in 
REM the PDF files stored within a given 
REM root folder.
REM 
REM Necessary arguments:
REM   <root folder containing the PDF files>
REM
REM The XPDF-Utils must be installed and this
REM batch script must be executed from that 
REM folder where the pdfinfo.exe is.
REM The XPDF package can be downloaded from here
REM 
REM "http://sourceforge.net/projects/gnuwin32/?source=dlp"

SET _result=
SET _cnt=
SET _iter=0
SET TAB=     

FOR /F "tokens=*" %%A IN ('dir /s /b %1*.pdf') DO (
	pdfinfo "%%A" 1> %temp%\pdfcount
	call:get_count
)

if not exist %temp%\pdfcount (
  echo Osszesen !_cnt! oldal > d:\sum_cnt.txt
  echo Osszesen !_cnt! oldal
  goto:eof
)

:get_count
FOR /F "tokens=*" %%G in ('findstr /C:"Pages:" %temp%\pdfcount') DO (
	
	SET str=%%G
	
	SET _result=%str:~16,5%
	
	SET /a _cnt=!_CNT!+!_result!
	
	SET /a _iter=!_iter!+1
	SET /a _mod=!_iter!%%100

	if !_mod! EQU 0	(echo After !_iter! doc page count is			!_cnt!)
	
	del %temp%\pdfcount
)