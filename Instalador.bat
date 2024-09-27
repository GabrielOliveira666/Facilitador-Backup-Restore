@ECHO OFF

setlocal EnableDelayedExpansion
set "CURRENT_VAR=%testes%"

rem seta a nova variavel, a variavel atual e a concatenada
ECHO Insira a localização da pasta raiz do Firebird
set /p "FB_LOC="

cd %FB_LOC%

rem Valida se a pasta está correta
dir | findstr /I "instsvc" >nul
IF %ERRORLEVEL%==0 (
	set "CONCATENED_VAR=!CURRENT_VAR!;!FB_LOC!"
	
	pause
	
	rem verifica se o conteúdo da variavel nova já existe na atual
	echo !CURRENT_VAR! | findstr /C"!FB_LOC!" >nul
	
	rem adiciona a informação a variavel de ambiente se não existir, se existir ele retorna erro
	if !ERRORLEVEL!==0 (
		echo Variavel ja definida "!CURRENT_VAR!"
		pause
	) else (
		setx testes "!CONCATENED_VAR!"
		pause
	)
)ELSE (
	echo FEIJOADA
	pause
)
endlocal


setlocal
rem seta a nova variavel, a variavel atual e a concatenada
set "NEW_VAR=C:\Users\G\Desktop\testing"
set "CURRENT_VAR=%testes%"
set "CONCATENED_VAR=%CURRENT_VAR%;%NEW_VAR%"

rem verifica se o conteúdo da variavel nova já existe na atual
echo %CURRENT_VAR% | findstr /C"%NEW_VAR%" >nul

rem adiciona a informação a variavel de ambiente se não existir, se existir ele retorna erro
if %ERRORLEVEL%==0 (
	echo Variavel ja definida
) else (
	setx testes "%CONCATENED_VAR%"
)
echo %CURRENT_VAR%
endlocal



pause