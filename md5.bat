@echo off
setlocal enabledelayedexpansion
SET ROOT_FOLDER=%1
SET EXT=%2
SET outf=%3

FOR /F "tokens=*" %%X IN ('dir /s /b %ROOT_FOLDER%\*%EXT%') DO (
   echo %%X
   SET OK=
   FOR /F "usebackqskip=1tokens=1-16delims= " %%A in (`certutil -hashfile "%%X" MD5`) DO (
      IF NOT DEFINED OK (
      echo %%A%%B%%C%%D%%E%%F%%G%%H%%I%%J%%K%%L%%M%%N%%O%%P,%%X >> %outf%
      SET OK=1
      )
   )
)
endlocal