@echo off
echo Installation Begins
echo Username %POSTGRES_USERNAME%
postgresql-15.2-2-windows-x64.exe --mode unattended --unattendedmodeui none --superaccount %POSTGRES_USERNAME% --superpassword %POSTGRES_PASSWORD%
SET TRIES=0
:LOOP
tasklist | findstr postgres.exe >nul
IF ERRORLEVEL 1 (
  SET /A TRIES=TRIES+1>nul
  IF %TRIES% LSS 10 (
  ping -n 10 localhost >nul
  GOTO LOOP
  ) else (
    GOTO ERROR
  )
) ELSE (
  GOTO CONTINUE
)
:CONTINUE
ping -n 2 localhost >nul

SET PATH=%PATH%;C:\Program Files\PostgreSQL\15\bin
SET PGPASSWORD=%POSTGRES_PASSWORD%
IF EXIST init.sql psql -U postgres -f init.sql
SETX /M PATH "%PATH%;C:\\Program Files\\PostgreSQL\\15\\bin" >nul
echo Installation Successful
goto ENDE

:ERROR
echo Installation Failed

:ENDE