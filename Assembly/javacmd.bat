@echo off

cls 
echo COMPILING...

ml /c /Zd /coff %1.asm


if %ERRORLEVEL% EQU 0 (	
	echo FINISHED...
	Link /SUBSYSTEM:CONSOLE %1.obj
	%1.exe
)