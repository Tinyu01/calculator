#!/bin/bash

# Script to compile and run the Calculator application on Unix/Linux/Mac
# Makes sure Java is installed and compiles/runs the application without an IDE

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
mkdir -p build

# Clean previous build
echo -e "${YELLOW}Cleaning previous build...${NC}"
rm -rf build/*.class

# Compile the source files
echo -e "${YELLOW}Compiling source files...${NC}"
javac -d build src/main/java/Calculator.java src/main/java/Main.java

# Check if compilation was successful
if [ $? -ne 0 ]; then
    echo -e "${RED}Compilation failed. Please check the errors above.${NC}"
    exit 1
fi

# Run the application
echo -e "${GREEN}Starting Calculator Application...${NC}"
java -cp build Main

exit 0