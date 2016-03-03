@echo OFF
title Demarrage du point d'accès wifi deja cree
color 0A
@mode con: cols=100 lines=30

echo.
echo   		            ________________________________________
echo.
echo       		                Creation d'un point d'acces wifi
echo    		            ________________________________________
echo. 

netsh wlan start hostednetwork
echo Appuyez sur une touche pour arreter le partage wifi..
pause > nul
cls
netsh wlan stop hostednetwork
echo Appuyez sur une touche pour sortir du programme.
pause > nul