rem Create empty directories for package bundle
@echo off

IF "%PLATFORM%"=="x86" (
    SET FOLDER_PLATFORM="32"
) ELSE IF "%PLATFORM%"=="x64" (
    SET FOLDER_PLATFORM="64"
) ELSE (
    echo "Platform %PLATFORM% is not supported"
    exit 1
)

md %APPVEYOR_BUILD_FOLDER%\package\pthread-win%FOLDER_PLATFORM%

(robocopy pthread-win%FOLDER_PLATFORM%\ %APPVEYOR_BUILD_FOLDER%\package\pthread-win%FOLDER_PLATFORM% /s /e /np) ^& IF %ERRORLEVEL% GTR 1 exit %ERRORLEVEL%
exit 0
