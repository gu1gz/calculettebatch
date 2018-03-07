@echo OFF
cls
color 0B
title Jean Script
:Debut
echo			    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo			   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo			  /////////////////////////				    Version 0.1				////////////////////////////
echo			 ////////////////////////			Calculette By Guillaume Desoutter		///////////////////////////
echo			//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo.
echo.
echo								    ------------- Calculette -------------
echo.
echo.
echo										A. Addition
echo										B. Soustraction
echo										C. Multiplication
echo										D. Division
echo.
echo.
echo Selectionne une option:
echo.
echo.
set /p UserInput=
if "%UserInput%" == "a" set UserInput=A
if "%UserInput%" == "b" set UserInput=B
if "%UserInput%" == "c" set UserInput=C
if "%UserInput%" == "d" set UserInput=D
echo.
echo.
echo %UserInput%| findstr /r "[^A-D]">nul
if %errorlevel% EQU 0 (
  GOTO Erreur
)
echo.
echo.
echo Selectionne une premiere valeur:
echo.
set /p val1=
echo %val1%| findstr /r "[^0-9]">nul
if %errorlevel% EQU 0 (
  GOTO Erreur
)
echo.
echo.
echo Selectionne une seconde valeur:
echo.
set /p val2=
echo %val2%| findstr /r "[^0-9]">nul
if %errorlevel% EQU 0 (
  GOTO Erreur
)

if "%UserInput%" == "A" GOTO Addition
if "%UserInput%" == "B" GOTO Soustraction
if "%UserInput%" == "C" GOTO Multiplication
if "%UserInput%" == "D" GOTO Division

:Erreur
cls
echo Erreur de frappe
GOTO Debut

:entrelettre
echo Voulez-vous continuer a utiliser la calculette ?
echo.
echo      Y. Continuer
echo      N. Arreter
set /a entreok=0
set /p UserInput2=
cls
if "%UserInput2%" == "Y" GOTO Debut
if "%UserInput2%" == "N" EXIT
if "%entreok%" == "0" GOTO entrelettre

:Addition
set /a resultat = %val1% + %val2%
echo.
echo %val1% + %val2% = %resultat%
GOTO entrelettre

:Soustraction
set /a resultat = %val1% - %val2%
echo.
echo %val1% - %val2% = %resultat%
GOTO entrelettre

:Multiplication
set /a resultat = %val1% * %val2%
echo.
echo %val1% x %val2% = %resultat%
GOTO entrelettre

:Division
set /a resultat = %val1% / %val2%
echo.
echo %val1% / %val2% = %resultat%
GOTO entrelettre
