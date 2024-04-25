::----------------------------------------------::
::                Made by Baikil                ::
::                  Version 02                  ::
:: https://github.com/baikil/Spicetify-manager/ ::
::----------------------------------------------::
@echo off

set "logo=echo [38;2;246;147;45m   ____     _         __  _ ___&echo [38;2;243;123;45m  / __/__  (_)______ / /_(_) _/_ __   __ _  ___  ___  ___  ___  ___ ____&echo [38;2;237;96;53m _\ \/ _ \/ / __/ -_) __/ / _/ // /  /  ' \/ _ `/ _ \/ _ `/ _ `/ -_) __/&echo [38;2;233;78;58m/___/ .__/_/\__/\__/\__/_/_/ \_, /  /_/_/_/\_,_/_//_/\_,_/\_, /\__/_/&echo [38;2;224;76;64m   /_/                      /___/                        /___/&echo [38;5;237mVersion 02[0m"

:00 Main menu
cls&title Spicetify manager&%logo%&echo.
echo 1. Install Spicetify
echo 2. Install Spicetify apps
echo 3. Update/restore Spicetify
echo 4. Uninstall Spicetify
echo 5. Exit
choice /n /c 12345
goto %errorlevel%0

::--------

:10 Install Spicetify
cls&title Spicetify manager - Installing Spicetify&%logo%&echo.
powershell -command "iwr -useb https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.ps1 | iex"
powershell -command "iwr -useb https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/install.ps1 | iex"
echo.&title Spicetify manager - Done&pause&goto 00

::--------

:20 Install Spicetify apps
cls&title Spicetify manager - Install Spicetify apps&%logo%&echo.
echo 1. Spicetify Stats
echo 2. Lyrics Plus
::echo 3. Eternal Jukebox
::echo 4. Better Local Files
::echo 5. Name That Tune
::echo 6. Playlist Combiner
::echo 7. Beat Saber
echo ---------------------
echo 8. (^<-)
choice /n /c 12345678
goto 2%errorlevel%

:21 Spicetify Stats
cls&title Spicetify manager - Installing Spicetify Stats&%logo%&echo.
powershell -command "(New-Object System.Net.WebClient).DownloadFile('https://codeload.github.com/harbassan/spicetify-stats/zip/refs/heads/dist','%appdata%/spicetify/CustomApps/spicetify-stats-dist.zip')"
powershell -command "Expand-Archive %appdata%/spicetify/CustomApps/spicetify-stats-dist.zip -DestinationPath %appdata%/spicetify/CustomApps/unzipped"
move /y "%appdata%/spicetify/CustomApps/unzipped/spicetify-stats-dist/" "%appdata%/spicetify/CustomApps/stats/"
rd /s /q "%appdata%/spicetify/CustomApps/unzipped/"
del /f /q "%appdata%/spicetify/CustomApps/spicetify-stats-dist.zip"
powershell -command "spicetify config custom_apps stats"
powershell -command "spicetify apply"
echo.&title Spicetify manager - Done&pause&goto 20

:22 Lyrics Plus
powershell -command "spicetify config custom_apps lyrics-plus"
powershell -command "spicetify apply"
echo.&title Spicetify manager - Done&pause&goto 20

::Not yet implemented - pause and go back to the :20 menu
:23 Eternal Jukebox
:24 Better Local Files
:25 Name that tune
:26 Playlist Combiner
:27 Beat Saber
pause&goto 20
:28 Back to main menu
goto 00

::--------

:30 Update/restore Spicetify
cls&title Spicetify manager - Updating/restoring Spicetify&%logo%&echo.
powershell -command "spicetify backup"
powershell -command "spicetify update"
powershell -command "spicetify restore backup apply"
echo.&title Spicetify manager - Done&pause&goto 00

::--------

:40 Uninstall Spicetify
cls&title Spicetify manager - Uninstalling Spicetify&%logo%&echo.
powershell -command "spicetify restore"
powershell -command "rmdir -r -fo $env:APPDATA\spicetify"
powershell -command "rmdir -r -fo $env:LOCALAPPDATA\spicetify"
echo.&title Spicetify manager - Done&pause&goto 00

::--------

:50 Exit
exit