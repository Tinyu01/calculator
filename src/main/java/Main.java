import java.util.InputMismatchException;
import java.util.Scanner;

/**
 * Main class to run the Calculator application.
 * Provides a command-line interface for user interaction.
 */
public class Main {
    private static final Scanner scanner = new Scanner(System.in);
    private static final Calculator calculator = new Calculator();

    public static void main(String[] args) {
        System.out.println("Welcome to the Calculator Application!");
        boolean running = true;

        while (running) {
            displayMenu();
            int choice = getUserChoice();

            switch (choice) {
                case 1:
                    squareOperation();
                    break;
                case 2:
                    additionOperation();
                    break;
                case 3:
                    divisionOperation();
                    break;
                case 4:
                    running = false;
                    System.out.println("Thank you for using the Calculator. Goodbye!");
                    break;
                default:
                    System.out.println("Invalid choice. Please try again.");
            }
            
            if (running) {
                System.out.println("\nPress Enter to continue...");
                scanner.nextLine(); // Consume the newline
            }
        }
        
        scanner.close();
    }

    /**
     * Displays the main menu options to the user.
     */
    private static void displayMenu() {
        System.out.println("\nPlease select an operation:");
        System.out.println("1. Square a number");
        System.out.println("2. Add two numbers");
        System.out.println("3. Divide two numbers");
        System.out.println("4. Exit");
    }

    /**
     * Gets and validates the user's menu choice.
     * 
     * @return The validated menu choice
     */
    private static int getUserChoice() {
        int choice = 0;
        boolean validInput = false;

        while (!validInput) {
            System.out.print("Enter your choice: ");
            try {
                choice = scanner.nextInt();
                validInput = true;
            } catch (InputMismatchException e) {
                System.out.println("Please enter a valid number.");
            } finally {
                scanner.nextLine(); // Clear the input buffer
            }
        }

        return choice;
    }

    /**
     * Handles the square operation workflow.
     */
    private static void squareOperation() {
        System.out.print("Enter a number to square: ");
        try {
            int number = scanner.nextInt();
            scanner.nextLine(); // Clear the input buffer
            
            try {
                int result = calculator.squareOfSingleIntegerNumber(number);
                System.out.println("Result: " + result);
            } catch (ArithmeticException e) {
                System.out.println("Error: " + e.getMessage() + " Try a smaller number.");
            }
        } catch (InputMismatchException e) {
            System.out.println("Please enter a valid integer.");
            scanner.nextLine(); // Clear the input buffer
        }
    }

    /**
     * Handles the addition operation workflow.
     */
    private static void additionOperation() {
        try {
            System.out.print("Enter first number: ");
            int num1 = scanner.nextInt();
            
            System.out.print("Enter second number: ");
            int num2 = scanner.nextInt();
            scanner.nextLine(); // Clear the input buffer
            
            try {
                int result = calculator.addTwoIntegerNumbers(num1, num2);
                System.out.println("Result: " + result);
            } catch (ArithmeticException e) {
                System.out.println("Error: " + e.getMessage() + " The result is too large or too small for an integer.");
            }
        } catch (InputMismatchException e) {
            System.out.println("Please enter valid integers.");
            scanner.nextLine(); // Clear the input buffer
        }
    }

    /**
     * Handles the division operation workflow.
     */
    private static void divisionOperation() {
        try {
            System.out.print("Enter dividend (number to be divided): ");
            int num1 = scanner.nextInt();
            
            System.out.print("Enter divisor: ");
            int num2 = scanner.nextInt();
            scanner.nextLine(); // Clear the input buffer
            
            try {
                if (num2 == 0) {
                    System.out.println("Error: Cannot divide by zero.");
                    return;
                }
                
                int result = calculator.divideTwoIntegerNumbers(num1, num2);
                System.out.println("Result: " + result);
            } catch (ArithmeticException e) {
                System.out.println("Error: " + e.getMessage());
            }
        } catch (InputMismatchException e) {
            System.out.println("Please enter valid integers.");
            scanner.nextLine(); // Clear the input buffer
        }
    }
}