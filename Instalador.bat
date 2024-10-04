@ECHO OFF

set "CURRENT_VAR=%PATH%"

setlocal EnableDelayedExpansion

rem seta a nova variavel, a variavel atual e a concatenada
ECHO Insira a localizacao da pasta raiz do Firebird
set /p "FB_LOC="

cd %FB_LOC%

rem Valida se a pasta esta correta
dir | findstr /I "instsvc" >nul
IF %ERRORLEVEL%==0 (
	rem set "CONCATENED_VAR=!CURRENT_VAR!;!FB_LOC!"
	
	rem verifica se o conteudo da variavel nova ja existe na atual
	echo !CURRENT_VAR! | findstr /C"!FB_LOC!" >nul

	rem adiciona a informacao a variavel de ambiente se nao existir, se existir ele retorna erro
	if !ERRORLEVEL!==0 (
		echo Variavel ja definida
		pause
		exit /b
	) else ( 
		cls
	)
)ELSE (
	echo Diretorio do Firebird incorreto
	pause
	cls
)

rem seta a nova variavel, a variavel atual e a concatenada

cd /
mkdir testes

set "NEW_VAR=C:\testes"
set NEW_CONCATENED_VAR=%CONCATENED_VAR%;%NEW_VAR%

rem verifica se o conteudo da variavel nova ja existe na atual
echo %CURRENT_VAR% | findstr /C"%NEW_VAR%" >nul

rem adiciona a informacao a variavel de ambiente se nao existir, se existir ele retorna erro
if %ERRORLEVEL%==0 (
	cls
	echo Variavel ja definida
	pause
	exit /b
) else (
	cls
	echo Variavel adicionada
	pause
	cls
)

cd C:\Users\gabriel.pereira\Desktop\temp\Facilitador-Backup-Restore--corre-o-da-impossibilidade-de-adicionar-as-duas-var-de-ambiente

set "CONCATENED_VAR=!CURRENT_VAR!;!FB_LOC!;!NEW_VAR!"
setx /m PATH "%CONCATENED_VAR%"

echo %CONCATENED_VAR% > var.txt
pause

endlocal
exit /b

