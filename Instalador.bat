@ECHO OFF

set "CURRENT_VAR=%testes%"

setlocal EnableDelayedExpansion

rem seta a nova variavel, a variavel atual e a concatenada
ECHO Insira a localizaÃ§Ã£o da pasta raiz do Firebird
set /p "FB_LOC="

cd %FB_LOC%

rem Valida se a pasta estÃ¡ correta
dir | findstr /I "instsvc" >nul
IF %ERRORLEVEL%==0 (
	set "CONCATENED_VAR=!CURRENT_VAR!;!FB_LOC!"
	
	rem verifica se o conteÃºdo da variavel nova jÃ¡ existe na atual
	echo !CURRENT_VAR! | findstr /C"!FB_LOC!" >nul
	
	rem adiciona a informaÃ§Ã£o a variavel de ambiente se nÃ£o existir, se existir ele retorna erro
	if !ERRORLEVEL!==0 (
		echo Variavel ja definida "!CURRENT_VAR!"
		pause
	) else (
		setx testes "!CONCATENED_VAR!" 
	)
)ELSE (
	echo Diretorio incorreto
	pause
)

echo %CONCATENED_VAR%

pause


rem seta a nova variavel, a variavel atual e a concatenada
set "NEW_VAR=C:\Users\G\Desktop\testing"
rem set "CURRENT_VAR=%testes%"
rem arrumar a concatenação dessa variável, pois a expansão está fodendo com ela
set CONCATENED_VAR=%CONCATENED_VAR%;%NEW_VAR%
echo %CONCATENED_VAR% 
pause

rem verifica se o conteÃºdo da variavel nova jÃ¡ existe na atual
echo %CURRENT_VAR% | findstr /C"%NEW_VAR%" >nul

rem adiciona a informaÃ§Ã£o a variavel de ambiente se nÃ£o existir, se existir ele retorna erro
if %ERRORLEVEL%==0 (
	echo Variavel ja definida
) else (
	setx testes "%CONCATENED_VAR%"
)
echo %CURRENT_VAR%

endlocal
pause
