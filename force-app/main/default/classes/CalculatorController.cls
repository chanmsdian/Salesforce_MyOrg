public class CalculatorController 
{
    @AuraEnabled
	public static decimal calculateValues(decimal firstNumber, decimal secondNumber)
    {
        return firstNumber+secondNumber;
    }
}