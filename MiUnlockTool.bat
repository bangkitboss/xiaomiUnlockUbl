@echo off

if "%OS%"=="Windows_NT" setlocal
set FILE_JAR=bin\MiUnlockTool.jar

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
IF "%1"=="" set JAVA_EXE=javaw.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%\bin\java.exe
IF "%1"=="" set JAVA_EXE=%JAVA_HOME%\bin\javaw.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
IF "%1"=="" goto gui
:nogui
"%JAVA_EXE%" -jar %FILE_JAR% %*
goto mainEnd

:gui
start "MiUnlockTool" /B  "%JAVA_EXE%" -jar %FILE_JAR% %*
goto mainEnd


:fail
PAUSE
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal