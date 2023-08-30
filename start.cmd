@echo off
sc start postgresql-x64-15>nul
:LOOP
tasklist | findstr postgres.exe >nul
IF ERRORLEVEL 1 (
  ping -n 2 localhost >nul
  GOTO LOOP
) ELSE (
  GOTO CONTINUE
)
:CONTINUE
SET PATH=%PATH%;C:\Program Files\PostgreSQL\15\bin
IF "%*"=="" ( 
  ping -t localhost >nul
) else (
  CMD /C "%*"
  ping -t localhost >nul
)
