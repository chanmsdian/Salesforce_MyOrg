public class Demo2 
{
public void mainReferrenceMethod()
    {
    Account a = new Account();
    a.Name='person1';
    a.Website='www.yahoo.com';
    System.debug('Before value call' + a);
    passByRefmethod(a);
    System.debug('After value call' + a);
    }
    public void passByRefmethod(Account acc)
    {
        acc.Name='personone';
        acc.Website='www.apexhours.com';
    }
}