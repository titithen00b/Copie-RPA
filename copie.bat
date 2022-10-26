@echo off 
REM Encodage UTF-8
chcp 65001 > nul

setlocal enabledelayedexpansion
setlocal enableextensions

:debut
REM Vérification de l'existance de Y:
if not exist "Y:" ( goto error ) else ( goto copie_01 )


:copie_01
REM Deplacement dans le dossier KO Technique
cd /D "Y:\04-KO technique"

REM Vérification que le fichier temporaire n'existe pas. Si celui-ci existe déjà, on le supprime pour eviter tous problèmes de doublons.
if exist "Y:\vartemp.txt" ( del /f /q /S Y:\vartemp.txt > nul )


for /R %%i in ( *.pdf ) do (
    echo %%i >> "Y:\vartemp.txt"
)

REM On vérifie que le fichier existe (si aucun PDF n'est trouver, on ne fait rien)
if exist "Y:\vartemp.txt" ( goto copie_2 ) else ( goto erreur )

:copie_2
for /F " delims=\ tokens=3 " %%j in ( Y:\vartemp.txt ) do (

    REM Set des différentes variables 
    set var=%%j
    set passage="0"
    set var2=!var:~58,60!



    REM On vérifie chacune des lignes pour voir si 3 passages ont été effectués. Si il y a 3 passage sans succès
    REM la variable !passage! est set a 1 ce qui permet le déplacement dans le dossier Mathieu.
    REM Par défaut, elle est set a 0 a chaque passage de la boucle FOR

    for /f %%t in (' echo !var2! ^| findstr "^_" ' ) do set passage="1"
    
    
    REM Débug : echo !passage! >> "Y:\tata.txt"

    
    if /i !passage! == "1" (
        cd /d %%j
        for %%a in ( *.pdf ) do (
            xcopy "%%a" "Y:\Mathieu" /S

        )
        echo Copie OK
        cd ..
        ) else ( 
            cd /d %%j
            for %%a in ( *.pdf ) do (
            xcopy "%%a" "Y:\01-TODO" /S
            )
            cd ..
        )


)
forfiles /P "Y:\04-KO TECHNIQUE" /M * /C "cmd /c if @isdir==FALSE del @file"
forfiles /P "Y:\04-KO TECHNIQUE" /M * /C "cmd /c if @isdir==TRUE rmdir /S /Q @file"
goto eof


:erreur
echo erreur
goto eof

:eof 
endlocal
