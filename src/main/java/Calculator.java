/**
 * Calculator class providing basic arithmetic operations with overflow/underflow protection.
 * All methods check if results exceed the integer range and throw exceptions if necessary.
 */
public class Calculator {

    /**
     * Calculates the square of an integer with overflow/underflow protection.
     *
     * @param num1 The number to square
     * @return The square of the input number
     * @throws ArithmeticException if the result would exceed integer bounds
     */
    public int squareOfSingleIntegerNumber(int num1) {
        long resultTestValue = (long) num1 * num1;
        if (resultTestValue > Integer.MAX_VALUE || resultTestValue < Integer.MIN_VALUE) {
            throw new ArithmeticException("Overflow/Underflow error.");
        }
        return (int) resultTestValue;
    }

    /**
     * Adds two integers with overflow/underflow protection.
     *
     * @param num1 First number to add
     * @param num2 Second number to add
     * @return The sum of the two numbers
     * @throws ArithmeticException if the result would exceed integer bounds
     */
    public int addTwoIntegerNumbers(int num1, int num2) {
        long resultTestValue = (long) num1 + num2;
        if (resultTestValue > Integer.MAX_VALUE || resultTestValue < Integer.MIN_VALUE) {
            throw new ArithmeticException("Overflow/Underflow error.");
        }
        return (int) resultTestValue;
    }

    /**
     * Divides two integers with overflow/underflow protection.
     *
     * @param num1 Dividend (number to be divided)
     * @param num2 Divisor (number to divide by)
     * @return The result of dividing num1 by num2
     * @throws ArithmeticException if division by zero is attempted or if the result would exceed integer bounds
     */
    public int divideTwoIntegerNumbers(int num1, int num2) {
        if (num2 == 0) {
            throw new ArithmeticException("Division by zero.");
        }
        
        long resultTestValue = (long) num1 / num2;
        if (resultTestValue > Integer.MAX_VALUE || resultTestValue < Integer.MIN_VALUE) {
            throw new ArithmeticException("Overflow/Underflow error.");
        }
        return (int) resultTestValue;
    }
    
    /**
     * Multiplies two integers with overflow/underflow protection.
     *
     * @param num1 First number to multiply
     * @param num2 Second number to multiply
     * @return The product of the two numbers
     * @throws ArithmeticException if the result would exceed integer bounds
     */
    public int multiplyTwoIntegerNumbers(int num1, int num2) {
        long resultTestValue = (long) num1 * num2;
        if (resultTestValue > Integer.MAX_VALUE || resultTestValue < Integer.MIN_VALUE) {
            throw new ArithmeticException("Overflow/Underflow error.");
        }
        return (int) resultTestValue;
    }
}