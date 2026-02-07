@echo off
setlocal enableextensions enabledelayedexpansion

:: --- [ADICIONADO] Definição de Códigos ANSI para Cores ---
:: O Windows 10/11 suporta nativamente códigos de escape ANSI no CMD.
:: O loop abaixo captura o caractere de escape (ESC) necessário para colorir.
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (set "ESC=%%b")

:: Definição de paleta de cores para facilitar o uso no script
set "CYAN=%ESC%[36m"
set "GREEN=%ESC%[32m"
set "RED=%ESC%[31m"
set "YELLOW=%ESC%[33m"
set "RESET=%ESC%[0m"
:: ---------------------------------------------------------

:: Define o alvo. Se nao digitar nada, usa o DNS do Google por padrao
set /p target="Digite o IP ou Host (ou pressione Enter para 8.8.8.8): "
if "%target%"=="" set target=8.8.8.8

cls
:: --- [ALTERADO] Inserção de variáveis de cor (CYAN e RESET) nos cabeçalhos ---
echo %CYAN%======================================================%RESET%
echo %CYAN%   DIAGNOSTICO DE ROTA - Por Jeiel Lima Miranda%RESET%
echo %RESET%
echo %CYAN%e-mail: jeielmiranda@duck.com%RESET%
echo %CYAN%site:   https://jeielmiranda.com.br%RESET%
echo    Alvo: %YELLOW%%target%%RESET%
echo %CYAN%======================================================%RESET%

:: 1. Teste de MTU
echo [1/3] Verificando MTU...
ping %target% -f -l 1472 -n 1 >nul
if %errorlevel% equ 0 (
    echo.
    :: --- [ALTERADO] Cor VERDE para sucesso ---
    echo [%GREEN%+%RESET%] MTU de 1500 suportado.
) else (
    echo.
    :: --- [ALTERADO] Cor VERMELHA para falha ---
    echo [%RED%-%RESET%] Falha no MTU: Pacote muito grande ou host nao responde.
)

echo.
echo [2/3] Testando latencia...
:: O ping padrão não suporta cores internas, mantido padrão do sistema
ping %target% -n 5

echo.
echo [3/3] Analisando saltos (Pathping)...
:: O pathping pode demorar, aviso visual adicionado
echo %YELLOW%Aguarde, isso pode levar alguns minutos...%RESET%
pathping -n -q 30 %target%

echo.
echo %CYAN%======================================================%RESET%
echo %GREEN%Teste finalizado.%RESET%
echo %CYAN%======================================================%RESET%
pause
