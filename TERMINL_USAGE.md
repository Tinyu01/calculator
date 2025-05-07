# Running the Calculator Application from Terminal

This document explains how to build and run the Calculator application from the terminal without needing an IDE.

## Prerequisites

- Java JDK 11 or later installed
- Java added to your system PATH

You can verify your Java installation by running:
```bash
java -version
javac -version
```

## Quick Start

### Unix/Linux/Mac

```bash
# Make the run script executable
chmod +x run.sh

# Run the application
./run.sh
```

### Windows

```batch
# Run the application
run.bat
```

## Building and Running Options

This repository provides several methods to build and run the application from the terminal:

### 1. Using the Run Scripts

The simplest way to compile and run the application:

- **Unix/Linux/Mac**: `./run.sh`
- **Windows**: `run.bat`

### 2. Creating a JAR file

To create a standalone JAR file:

- **Unix/Linux/Mac**: `./build.sh`
- **Windows**: `build.bat`

After building, you can run the JAR file:
```bash
java -jar dist/Calculator.jar
```

### 3. Using Make (Unix/Linux/Mac)

If you have Make installed, you can use the provided Makefile:

```bash
# Compile and run
make run

# Build JAR and run
make runjar

# See all available options
make help
```

### 4. Using Executable Command

For convenience, you can also use the provided command scripts:

- **Unix/Linux/Mac**: 
  ```bash
  # Make the script executable
  chmod +x calculator
  
  # Run
  ./calculator
  
  # Optionally, move to a directory in your PATH
  sudo cp calculator /usr/local/bin/
  ```

- **Windows**:
  ```batch
  calculator.bat
  ```

## Manual Compilation and Execution

If you prefer to manually compile and run, use:

```bash
# Create build directory
mkdir -p build

# Compile
javac -d build src/main/java/Calculator.java src/main/java/Main.java

# Run
java -cp build Main
```

## Troubleshooting

1. **Java not found**: Ensure Java is installed and added to your PATH.

2. **Compilation errors**: Check your Java version (`java -version`) to ensure it's compatible.

3. **Permission issues**: For Unix/Linux/Mac, make sure the scripts have execute permission:
   ```bash
   chmod +x *.sh calculator
   ```

4. **PATH issues**: When using the `calculator` or `calculator.bat` commands, ensure they're either in your current directory or in a directory that's in your PATH.

## Integration with Command Line

To make the calculator easily accessible from anywhere in your terminal:

### Unix/Linux/Mac
```bash
# Copy to a directory in your PATH
sudo cp calculator /usr/local/bin/

# Now you can run from anywhere
calculator
```

### Windows
Add the directory containing `calculator.bat` to your PATH, or copy the batch file to a directory that's already in your PATH.