@echo OFF
title Creation d'un point d'accès wifi
color 0A
@mode con: cols=100 lines=30

echo.
echo   		            ________________________________________
echo.
echo       		                Creation d'un point d'acces wifi
echo    		            ________________________________________
echo. 

SET /p nom=     Nom que vous voulez donner au wifi : &;
:mdpasse
SET /p mdp=     Nom que vous voulez donner au wifi (minimum 8 caractère) : &;

setlocal enabledelayedexpansion
set VrCompt=-1
:boucle
set /a VrCompt+=1
set test2=!mdp:~%VrCompt%,1!
if not "%test2%"=="" goto boucle
if %VrCompt% LSS 8 (
color 0C
echo          Il faut 8 caractères minimum pour le mot de passe.
color 0A
goto mdpasse
)

cls

netsh wlan set hostednetwork mode=allow ssid=%nom% key=%mdp%
netsh wlan start hostednetwork

SET IP=192.168.1.1
SET Masque=255.255.255.0
netsh interface ipv4 set address Hotspot static 192.168.1.1 255.255.255.0 192.168.1.1 1 

echo.
echo    ________________________________________
echo.
echo          	  Nom du wifi : %nom%
echo                 Code : %mdp%
echo.
echo                     ---
echo	    Seulement si execute en administrateur : 
echo.
echo         Votre adresse ip : 192.168.1.1/24
echo    ________________________________________
echo. 
echo Appuyez sur une touche pour arreter le partage wifi..
pause > nul
cls
netsh wlan stop hostednetwork
netsh interface ipv4 set address Hotspot dhcp
echo Appuyez sur une touche pour sortir du programme.
pause > nul