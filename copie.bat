@echo off

:debut
if not exist "Y:" ( goto error ) else ( goto copie_01 )


:copie_01
::copie des fichiers pdf dans 01-TODO
Y:
cd "04-KO TECHNIQUE"
for /R %%i in ( *.pdf ) do (
    echo %%i
    xcopy "%%i" "Y:\Mathieu" /S
)
echo Copie vers "Mathieu" terminee
timeout 5 /nobreak >nul
cls
goto supr

:supr
echo Suppression desactive actuellement
::Suppression des dossiers présent dans 04-KO TECHNIQUE
forfiles /P "Y:\04-KO TECHNIQUE" /M * /C "cmd /c if @isdir==FALSE del @file"
forfiles /P "Y:\04-KO TECHNIQUE" /M * /C "cmd /c if @isdir==TRUE rmdir /S /Q @file"
timeout 5 /nobreak >nul
cls
goto eof

:error
echo Impossible de trouver le lecteur. Merci de le reconnecter sur Y:
echo Le chemin est \\srv-ad\partage\Secrétaires\EUROCOMBLES Secrétaires\Dossiers Clients\RPA\01-SCAN
goto eof

:eof
