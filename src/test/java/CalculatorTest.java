import org.junit.jupiter.api.*;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import org.junit.jupiter.params.provider.ValueSource;
import static org.junit.jupiter.api.Assertions.*;

/**
 * Test class for Calculator using JUnit 5.
 * Contains parameterized tests for each calculator operation.
 */
public class CalculatorTest {

    private Calculator calculatorTestObject;

    @BeforeEach
    void setUp() {
        calculatorTestObject = new Calculator();
    }

    @AfterEach
    void tearDown() {
        System.out.println("Method resources released.");
    }

    @DisplayName("Test square of a number with valid values")
    @ParameterizedTest
    @ValueSource(ints = {1, 12, 10, -1})
    void testSquareOfSingleIntegerNumber(int numberPassed) {
        int expectedResult = numberPassed * numberPassed;
        int actualResult = calculatorTestObject.squareOfSingleIntegerNumber(numberPassed);
        assertEquals(expectedResult, actualResult);
    }

    @Test
    @DisplayName("Test addition of int within range returns success")
    void testAddingOfTwoIntegerNumbersWithinIntegerRange() {
        int resultReturned = calculatorTestObject.addTwoIntegerNumbers(5, 10);
        assertEquals(15, resultReturned);
    }

    @DisplayName("Test square of a number with invalid values has exception")
    @ParameterizedTest
    @ValueSource(ints = {Integer.MAX_VALUE, Integer.MIN_VALUE})
    void testSquareOfSingleIntegerNumberOutsideIntegerRangeHasException(int numberPassed) {
        assertThrows(ArithmeticException.class, () -> {
            calculatorTestObject.squareOfSingleIntegerNumber(numberPassed);
        });
    }

    @DisplayName("Test square of a number with valid values but changed actual is not equal")
    @ParameterizedTest
    @ValueSource(ints = {2, 45, 66, 77})
    void testSquareOfSingleIntegerNumberInRangeDeviatesResult(int numberPassed) {
        int expectedResult = numberPassed * numberPassed;
        int actualResult = calculatorTestObject.squareOfSingleIntegerNumber(numberPassed) + 1;
        assertNotEquals(expectedResult, actualResult);
    }

    @DisplayName("Test division of int within range returns success")
    @ParameterizedTest
    @CsvSource({
            "6, 3, 2",
            "12, 5, 2",
            "15, 3, 5"
    })
    void testDivideTwoIntegerNumbersWithinRangeReturnsSuccesss(int number1, int number2, int expectedResult) {
        int actualResult = calculatorTestObject.divideTwoIntegerNumbers(number1, number2);
        assertEquals(expectedResult, actualResult);
    }
    
    @DisplayName("Test division by zero throws exception")
    @Test
    void testDivideByZeroThrowsException() {
        assertThrows(ArithmeticException.class, () -> {
            calculatorTestObject.divideTwoIntegerNumbers(10, 0);
        });
    }
    
    @DisplayName("Test addition with large numbers throws exception")
    @Test
    void testAdditionWithOverflowThrowsException() {
        assertThrows(ArithmeticException.class, () -> {
            calculatorTestObject.addTwoIntegerNumbers(Integer.MAX_VALUE, 1);
        });
    }
    
    @DisplayName("Test multiplication within range returns success")
    @ParameterizedTest
    @CsvSource({
            "3, 4, 12",
            "5, 5, 25",
            "-3, 5, -15",
            "-2, -7, 14"
    })
    void testMultiplyTwoIntegerNumbersWithinRangeReturnsSuccess(int number1, int number2, int expectedResult) {
        int actualResult = calculatorTestObject.multiplyTwoIntegerNumbers(number1, number2);
        assertEquals(expectedResult, actualResult);
    }
    
    @DisplayName("Test multiplication with large numbers throws exception")
    @Test
    void testMultiplicationWithOverflowThrowsException() {
        assertThrows(ArithmeticException.class, () -> {
            calculatorTestObject.multiplyTwoIntegerNumbers(Integer.MAX_VALUE, 2);
        });
    }
}