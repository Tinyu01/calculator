# Project Structure

This document outlines the structure and organization of the Calculator Application project.

## Directory Structure

```
calculator/
├── src/
│   └── main/
│       └── java/
│           ├── Calculator.java
│           └── Main.java
├── test/
│   └── java/
│       └── CalculatorTest.java
├── pom.xml
├── README.md
├── CONTRIBUTING.md
└── PROJECT_STRUCTURE.md
```

## Component Overview

### Calculator.java

The core class that implements arithmetic operations:

- `squareOfSingleIntegerNumber(int num1)`: Calculates the square of an integer with overflow protection
- `addTwoIntegerNumbers(int num1, int num2)`: Adds two integers with overflow protection
- `divideTwoIntegerNumbers(int num1, int num2)`: Divides two integers with error handling
- `multiplyTwoIntegerNumbers(int num1, int num2)`: Multiplies two integers with overflow protection

All methods include bounds checking to prevent integer overflow/underflow and throw appropriate exceptions when necessary.

### Main.java

The application entry point that provides a user interface:

- Displays a menu of available operations
- Handles user input
- Processes operations using the Calculator class
- Implements error handling for user input and calculation results

### CalculatorTest.java

JUnit 5 test class that verifies the Calculator functionality:

- Uses parameterized tests to test multiple scenarios efficiently
- Tests valid inputs, edge cases, and exception scenarios
- Includes setup and teardown methods for test resources

### pom.xml

Maven project configuration file:

- Defines project dependencies (JUnit 5)
- Configures build settings
- Sets up plugins for testing and execution

## Design Principles

1. **Robustness**: All methods include input validation and error handling
2. **Maintainability**: Code is well-documented with JavaDoc comments
3. **Testability**: Classes are designed for easy unit testing
4. **User Experience**: Command-line interface is intuitive and handles errors gracefully

## Future Improvements

Potential enhancements for future versions:

1. Additional mathematical operations (logarithms, trigonometry, etc.)
2. Support for decimal numbers using BigDecimal
3. Memory functions (store/recall values)
4. Expression parsing for complex calculations
5. Graphical user interface

## Build and Run

To build and run the project:

```bash
# Build the project
mvn clean install

# Run the application
mvn exec:java
```

To run tests:

```bash
mvn test
```