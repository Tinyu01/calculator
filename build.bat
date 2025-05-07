@echo off
:: Script to compile the Calculator application on Windows
:: Creates a standalone JAR file that can be run without an IDE

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
if not exist build\classes mkdir build\classes
if not exist dist mkdir dist

:: Clean previous build
echo %YELLOW%Cleaning previous build...%NC%
del /Q build\classes\*.class 2>nul
del /Q dist\*.jar 2>nul

:: Compile the source files
echo %YELLOW%Compiling source files...%NC%
javac -d build\classes src\main\java\Calculator.java src\main\java\Main.java

:: Check if compilation was successful
if %ERRORLEVEL% NEQ 0 (
    echo %RED%Compilation failed. Please check the errors above.%NC%
    pause
    exit /b 1
)

:: Create manifest file
echo Main-Class: Main > build\MANIFEST.MF

:: Create JAR file
echo %YELLOW%Creating JAR file...%NC%
jar cvfm dist\Calculator.jar build\MANIFEST.MF -C build\classes .

:: Check if JAR creation was successful
if %ERRORLEVEL% NEQ 0 (
    echo %RED%JAR creation failed. Please check the errors above.%NC%
    pause
    exit /b 1
)

echo %GREEN%Build successful! JAR file created at dist\Calculator.jar%NC%
echo Run the application with: %YELLOW%java -jar dist\Calculator.jar%NC%

pause
exit /b 0