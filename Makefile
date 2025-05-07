# Makefile for Calculator Application
# Provides simple commands for building and running without an IDE

# Directories
SRC_DIR = src/main/java
TEST_DIR = test/java
BUILD_DIR = build/classes
DIST_DIR = dist

# Java commands
JAVAC = javac
JAVA = java
JAR = jar

# Default target
all: clean compile jar

# Create directories
init:
	@mkdir -p $(BUILD_DIR)
	@mkdir -p $(DIST_DIR)

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	@rm -rf $(BUILD_DIR)/* $(DIST_DIR)/* 2>/dev/null || true

# Compile source files
compile: init
	@echo "Compiling source files..."
	@$(JAVAC) -d $(BUILD_DIR) $(SRC_DIR)/Calculator.java $(SRC_DIR)/Main.java

# Run the application from compiled classes
run: compile
	@echo "Running application..."
	@$(JAVA) -cp $(BUILD_DIR) Main

# Create JAR file
jar: compile
	@echo "Creating JAR file..."
	@echo "Main-Class: Main" > $(BUILD_DIR)/MANIFEST.MF
	@$(JAR) cvfm $(DIST_DIR)/Calculator.jar $(BUILD_DIR)/MANIFEST.MF -C $(BUILD_DIR) .

# Run the application from JAR
runjar: jar
	@echo "Running application from JAR..."
	@$(JAVA) -jar $(DIST_DIR)/Calculator.jar

# Compile tests (if JUnit is present)
compile-tests: compile
	@echo "Compiling test files..."
	@$(JAVAC) -cp "$(BUILD_DIR):lib/*" -d $(BUILD_DIR) $(TEST_DIR)/CalculatorTest.java 2>/dev/null || echo "Skipping tests (JUnit not in classpath)"

# Help
help:
	@echo "Calculator Application Build System"
	@echo ""
	@echo "Available targets:"
	@echo "  make all        - Clean, compile, and build JAR"
	@echo "  make clean      - Remove build artifacts"
	@echo "  make compile    - Compile source files"
	@echo "  make run        - Run from compiled classes"
	@echo "  make jar        - Create executable JAR"
	@echo "  make runjar     - Run from executable JAR"

.PHONY: all init clean compile run jar runjar compile-tests help