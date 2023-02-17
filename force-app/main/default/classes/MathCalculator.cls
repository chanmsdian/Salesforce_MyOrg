public class MathCalculator
{
    private static Integer add(Integer a, Integer b)
    {
        return a+b;
    }
    private static Integer multiply(Integer a, Integer b)
    {
        return a*b;
    }
    private static void printResult(Integer a, Integer b)
    {
        System.debug('Summation : '+add(a,b));
        System.debug('Product : '+multiply(a,b));
    }
    public void doMath(Integer a, Integer b)
    {
        printResult(a,b);
    }
}