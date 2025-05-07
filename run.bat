@echo off
:: Script to compile and run the Calculator application on Windows
:: Makes sure Java is installed and compiles/runs the application without an IDE

:: Set colors for console output
set GREEN=[92m
set RED=[91m
set YELLOW=[93m
set NC=[0m

:: Check if Java is installed
where java >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo %RED%Java is not installed or not in your PATH.%NC%
    echo Please install Java JDK 11 or later.
    pause
    exit /b 1
)

:: Check if javac is installed
where javac >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo %RED%Java compiler (javac) is not installed or not in your PATH.%NC%
    echo Please install Java JDK 11 or later.
    pause
    exit /b 1
)

:: Display Java version
echo %GREEN%Using Java version: 
java -version
echo %NC%

:: Create directories if they don't exist
if not exist build mkdir build

:: Clean previous build
echo %YELLOW%Cleaning previous build...%NC%
del /Q build\*.class 2>nul

:: Compile the source files
echo %YELLOW%Compiling source files...%NC%
javac -d build src\main\java\Calculator.java src\main\java\Main.java

:: Check if compilation was successful
if %ERRORLEVEL% NEQ 0 (
    echo %RED%Compilation failed. Please check the errors above.%NC%
    pause
    exit /b 1
)

:: Run the application
echo %GREEN%Starting Calculator Application...%NC%
java -cp build Main

pause
exit /b 0