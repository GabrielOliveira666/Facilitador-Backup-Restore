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
	set "CONCATENED_VAR=!CURRENT_VAR!;!FB_LOC!"
	
	rem verifica se o conteudo da variavel nova ja existe na atual
	echo !CURRENT_VAR! | findstr /C"!FB_LOC!" >nul

	rem adiciona a informacao a variavel de ambiente se nao existir, se existir ele retorna erro
	if !ERRORLEVEL!==0 (
		echo Variavel ja definida
		pause
	) else (
		setx PATH "!CONCATENED_VAR!" 
		cls
	)
)ELSE (
	echo Diretorio do Firebird incorreto
	pause
	cls
)

rem seta a nova variavel, a variavel atual e a concatenada
set "NEW_VAR=C:\testes"
set NEW_CONCATENED_VAR=%CONCATENED_VAR%;%NEW_VAR%

rem verifica se o conteudo da variavel nova ja existe na atual
echo %CURRENT_VAR% | findstr /C"%NEW_VAR%" >nul

rem adiciona a informacao a variavel de ambiente se nao existir, se existir ele retorna erro
if %ERRORLEVEL%==0 (
	cls
	echo Variavel ja definida
	pause
) else (
	setx PATH "%NEW_CONCATENED_VAR%"
	cls
	echo Variavel adicionada
	pause
	cls
)
endlocal
exit /b

