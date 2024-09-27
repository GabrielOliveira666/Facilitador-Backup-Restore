@ECHO OFF

REM Filtra as tasks abertas que tenham "dj" em seu nome
tasklist | findstr /I "dj" >nul
IF %ERRORLEVEL% == 0 (
	ECHO Feche todos os processos da DJSystem
	pause
	exit
)

REM Filtra serviços ativos do Firebird
sc query state= | findstr /I "firebird" >nul
IF %ERRORLEVEL% == 0 (
	ECHO Desative os servicos do Firebird
	pause
	exit
)

setlocal
:case

ECHO Escolha alguma funcao:
ECHO.
ECHO 1 - GBAK.EXE
ECHO 2 - GFIX.EXE -V - FULL
ECHO 3 - GFIX.EXE -MEND -IG
ECHO 4 - SAIR

SET /p "FUNCAO="


IF "%FUNCAO%"=="1" (
	ECHO Insira o caminho do banco
	SET /p "BANCO="
	ECHO %BANCO%
	
	pause
	cls
	goto case
)
IF "%FUNCAO%"=="2" (
	ECHO Você escolheu %FUNCAO%
	pause
	cls
	goto case
) 
IF "%FUNCAO%"=="3" (
	ECHO Você escolheu %FUNCAO%
	pause
	cls
	goto case
)
IF "%FUNCAO%"=="4" (
	EXIT
)

endlocal