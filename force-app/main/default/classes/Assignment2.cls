public with sharing class Assignment2 {
    public static void addAccountAndContact()
    {
        Account acc = new Account(Name='ApexHour Ass');
        Database.insert(acc);
        List<Contact> conList = new List<Contact>();
        {
            for(Integer i=1;i<=5;i++)
            {
                Contact con = new Contact();
                con.FirstName='ApexHour';
                con.LastName='Ass con'+i;
                con.AccountId=acc.Id;
                conList.add(con);
            }
            Database.insert(conList);
        }
        
    }
    public static void showCreatedAccountWithContacts()
    {
        List<Account> AccList = [SELECT Id, Name, (SELECT FirstName,LastName from Contacts) from Account where Name='ApexHour Ass'];
        System.debug(AccList);
    }
    public static void showCreatedContactwithAccounts()
    {
        List<Contact> contList = [SELECT Id, FirstName, LastName, Account.Name from Contact where Account.Name='ApexHour Ass'];
    }
}