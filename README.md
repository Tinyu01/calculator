# Calculator Application

A robust calculator application with safety features for integer operations.

## Features

- Integer arithmetic operations with overflow/underflow protection
- Square operation with bounds checking
- Addition and division with proper error handling
- JUnit 5 tests including parameterized tests

## Project Structure

```
calculator/
├── src/
│   └── main/
│       └── java/
│           ├── Calculator.java
│           └── Main.java
└── test/
    └── java/
        └── CalculatorTest.java
```

## Getting Started

### Prerequisites

- JDK 11 or later
- Maven or Gradle

### Running the Application

```bash
# Clone this repository
git clone https://github.com/yourusername/calculator.git

# Change to the project directory
cd calculator

# Run the application
mvn exec:java -Dexec.mainClass="Main"
```

## Running Tests

```bash
# Run all tests
mvn test
```

## How to Use

The calculator provides a simple command-line interface with the following operations:

1. Square a number
2. Add two numbers
3. Divide two numbers

Example:
```
Welcome to the Calculator Application!
Please select an operation:
1. Square a number
2. Add two numbers
3. Divide two numbers
4. Exit
Enter your choice: 1
Enter a number to square: 5
Result: 25
```

## Implementation Details

- All operations check for integer overflow/underflow
- The application uses proper exception handling to prevent crashes
- Tests cover valid inputs, edge cases, and exception scenarios

## License

This project is licensed under the MIT License - see the LICENSE file for details.