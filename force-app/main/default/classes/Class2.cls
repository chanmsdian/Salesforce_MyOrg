public class Class2 {
public String helloWorldString;
    private static final String DEFAULT_STRING;
    
    static
    {
        DEFAULT_STRING='Hello World';
    }
    public Class2()
    {
        this(DEFAULT_STRING);
    }
    public Class2(String stringToDispay)
    {
        this.helloWorldString=stringToDispay;
    }
    public void printOutput()
    {
        System.debug('Display Text: ' + helloWorldString);
    }
    public static void printOutput1()
    {
        System.debug('Display From Static variable Text: '+DEFAULT_STRING);
    }
}