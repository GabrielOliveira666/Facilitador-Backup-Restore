@ECHO OFF

set "CURRENT_VAR=%testes%"

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
		echo Variavel ja definida "!CURRENT_VAR!"
		pause
	) else (
		setx testes "!CONCATENED_VAR!" 
	)
)ELSE (
	echo Diretorio do Firebird incorreto
	pause
)

rem seta a nova variavel, a variavel atual e a concatenada
set "NEW_VAR=C:\testes"
rem set "CURRENT_VAR=%testes%"
rem arrumar a concatenaÃ§Ã£o dessa variÃ¡vel, pois a expansÃ£o estÃ¡ fodendo com ela
set NEW_CONCATENED_VAR=%CONCATENED_VAR%;%NEW_VAR%
echo %NEW_CONCATENED_VAR% 
pause

rem verifica se o conteÃƒÂºdo da variavel nova jÃƒÂ¡ existe na atual
echo %CURRENT_VAR% | findstr /C"%NEW_VAR%" >nul

rem adiciona a informaÃƒÂ§ÃƒÂ£o a variavel de ambiente se nÃƒÂ£o existir, se existir ele retorna erro
if %ERRORLEVEL%==0 (
	echo Variavel ja definida
) else (
	setx testes "%NEW_CONCATENED_VAR%"
)
echo %CURRENT_VAR%

endlocal
pause
