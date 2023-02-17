public class AccountHandler 
{
	public static Account insertNewAccount(String AccName)
    {
        try 
        {
            Account Acc = new Account(Name=AccName);
        	insert Acc;
        	return [SELECT Id, Name, BillingAddress, Description, Rating FROM Account Where Name=: AccName];
		} 
        catch (DmlException e) 
        {
    		System.debug('A DML exception has occurred: ' +
                e.getMessage());
            return null;
		}        
    }
    
    public static void insertAccount(Integer numOfAcc)
    {
        Integer N=1;
        List<Account> addAccounts = new List<Account>();
        while(N <=numOfAcc)
        {
            Account acc = new Account();
			acc.Name = 'Acme Inc '+N;
            acc.AccountNumber='A000'+N;
            addAccounts.add(acc);
            N++;
        }
        insert addAccounts;
        System.debug('Successfully added '+addAccounts);
        
    }
}