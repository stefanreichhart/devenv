@echo off

set CYGWIN=C:\\cygwin64\\bin\\mintty.exe
set CYGWIN_REG=%~dp0\registry\openCygwinHere.reg

IF EXIST %CYGWIN% (
	If EXIST %CYGWIN_REG% (
		echo Installing registry keys (%CYGWIN_REG%) ...
		REG IMPORT %CYGWIN_REG%
	) ELSE (
		echo [ERROR] Cygwin Registry is missing (%CYGWIN_REG%)
	)
) ELSE (
	echo [ERROR] Cygwin is missing (%CYGWIN%)
)

echo Done

pause