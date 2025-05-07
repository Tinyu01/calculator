@echo off
:: Executable batch file for the Calculator application on Windows
:: Place this file in a directory in your PATH

:: Find the directory where this script is located
set "SCRIPT_DIR=%~dp0"

:: Check if JAR file exists, otherwise build it
if not exist "%SCRIPT_DIR%dist\Calculator.jar" (
    echo Calculator JAR not found. Building...
    
    :: Check if build script exists and run it
    if exist "%SCRIPT_DIR%build.bat" (
        call "%SCRIPT_DIR%build.bat"
    ) else (
        :: If build script doesn't exist, try to compile and build JAR
        if not exist "%SCRIPT_DIR%build\classes" mkdir "%SCRIPT_DIR%build\classes"
        if not exist "%SCRIPT_DIR%dist" mkdir "%SCRIPT_DIR%dist"
        javac -d "%SCRIPT_DIR%build\classes" "%SCRIPT_DIR%src\main\java\Calculator.java" "%SCRIPT_DIR%src\main\java\Main.java"
        echo Main-Class: Main > "%SCRIPT_DIR%build\MANIFEST.MF"
        jar cvfm "%SCRIPT_DIR%dist\Calculator.jar" "%SCRIPT_DIR%build\MANIFEST.MF" -C "%SCRIPT_DIR%build\classes" .
    )
    
    :: Check if JAR creation was successful
    if not exist "%SCRIPT_DIR%dist\Calculator.jar" (
        echo Failed to build Calculator JAR. Please check error messages.
        pause
        exit /b 1
    )
)

:: Run the JAR file
java -jar "%SCRIPT_DIR%dist\Calculator.jar"