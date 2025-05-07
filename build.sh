#!/bin/bash

# Script to compile the Calculator application on Unix/Linux/Mac
# Creates a standalone JAR file that can be run without an IDE

# Colors for console output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if Java is installed
if ! command -v java &> /dev/null; then
    echo -e "${RED}Java is not installed or not in your PATH.${NC}"
    echo "Please install Java JDK 11 or later."
    exit 1
fi

# Check if javac is installed
if ! command -v javac &> /dev/null; then
    echo -e "${RED}Java compiler (javac) is not installed or not in your PATH.${NC}"
    echo "Please install Java JDK 11 or later."
    exit 1
fi

# Display Java version
JAVA_VERSION=$(java -version 2>&1 | head -1 | cut -d'"' -f2 | sed '/^1\./s///' | cut -d'.' -f1)
echo -e "${GREEN}Using Java version: $(java -version 2>&1 | head -1)${NC}"

# Create directories if they don't exist
mkdir -p build/classes
mkdir -p dist

# Clean previous build
echo -e "${YELLOW}Cleaning previous build...${NC}"
rm -rf build/classes/*.class dist/*.jar

# Compile the source files
echo -e "${YELLOW}Compiling source files...${NC}"
javac -d build/classes src/main/java/Calculator.java src/main/java/Main.java

# Check if compilation was successful
if [ $? -ne 0 ]; then
    echo -e "${RED}Compilation failed. Please check the errors above.${NC}"
    exit 1
fi

# Create manifest file
echo "Main-Class: Main" > build/MANIFEST.MF

# Create JAR file
echo -e "${YELLOW}Creating JAR file...${NC}"
jar cvfm dist/Calculator.jar build/MANIFEST.MF -C build/classes .

# Check if JAR creation was successful
if [ $? -ne 0 ]; then
    echo -e "${RED}JAR creation failed. Please check the errors above.${NC}"
    exit 1
fi

echo -e "${GREEN}Build successful! JAR file created at dist/Calculator.jar${NC}"
echo -e "Run the application with: ${YELLOW}java -jar dist/Calculator.jar${NC}"

exit 0