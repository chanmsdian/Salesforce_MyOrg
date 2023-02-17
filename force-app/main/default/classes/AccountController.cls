public class AccountController {
    
    @AuraEnabled
    public static List<Account> showAllAccounts()
    {
        List<Account> rlist = [select Name, BillingCity, AnnualRevenue from Account order by Name];
        return rlist;
        
    }
    
    @AuraEnabled 
    public static List<Account> showAccountsByCity(string cname)
    {
        string cpat=cname+'%';
        List<Account> rlist = [select Name, BillingCity, AnnualRevenue from Account where BillingCity LIKE :cpat order by Name];
        return rlist;
    }
    
    public static List<Account> insertAccounts(List<Account> accountToInsert)
    {
        insert accountToInsert;
        System.debug('Records Inserted :'+accountToInsert.size());
        return accountToInsert;
        
    }
    
    public static Account insertAccount(Account accountToInsert)
    {
        insert accountToInsert;
        System.debug('Records Inserted :'+accountToInsert);
        return accountToInsert;
    }
    
    public static List<Account> getAllAccounts()
    {
        List<Account> allAccount = [Select Name, AccountNumber, Rating from Account];
        return allAccount;
    }
    
    public static void printAllAccounts()
    {
        List<SObject> allAccount = getAllAccounts();
        for(SObject acc : allAccount)
        {
            System.debug('Name: '+(String) (acc.get('Name'))+', AccountNumber: '+String.valueOf(acc.get('AccountNumber'))+', Rating: '+String.valueOf(acc.get('Rating')));
        }
    }
    public static Integer getAccountSize()
    {
        List<Account> allAccount = getAllAccounts();
        System.debug('Accounts SIze: '+allAccount.size());
        return allAccount.size();
    }
    
    public static List<Account> UpdateAccount(List<Account> accountToUpdate)
    {
        update accountToUpdate;
        System.debug('Account Updated: '+accountToUpdate);
        return accountToUpdate;
    }
    
    public static List<Account> deleteAccount(List<Account> accountToDelete)
    {
        delete accountToDelete;
        System.debug('Account Deleted: '+accountToDelete);
        return accountToDelete;
    }
    
    public static List<Account> unDeleteAccount(List<Account> accountsToUnDelete)
    {
        undelete accountsToUnDelete;
        System.debug('Account un Deleted: '+accountsToUnDelete);
        return accountsToUnDelete;
    }
    public static void updateAvgCaseResolutionDays(List<Id> accountIds)
    {
        Integer totalDays = 0, totalCases = 0;
        Map<Id, Integer> totalDaysMap = new Map<Id, Integer>();
        Map<Id, Integer> totalCasesMap = new Map<Id, Integer>();
        // retrive all the cases for this account
        // get resolution days for each account (ClosedDate - CreatedDate)
        for(Case caseObj : [SELECT Id, AccountId, CreatedDate, ClosedDate FROM Case WHERE IsClosed=true AND AccountId IN: accountIds])
        {
            if (!totalCasesMap.containsKey(caseObj.AccountId)) 
            {
                totalCasesMap.put(caseObj.AccountId,totalCases);
                totalDaysMap.put(caseObj.AccountId,totalDays);
            }

            // increase number of cases
            totalCases = totalCasesMap.get(caseObj.AccountId);
            totalCases++;
            totalCasesMap.put(caseObj.AccountId,totalCases);
            // get duration in days and add it to totalDays
            totalDays = totalDaysMap.get(caseObj.AccountId);
            totalDays += caseObj.CreatedDate.date().daysBetween(caseObj.ClosedDate.date());
            totalDaysMap.put(caseObj.AccountId,totalDays);
        }
        List<Account> AccountsToUpdate = new List<Account>();
        for (Id accountId : totalCasesMap.keySet()) 
        {
            Decimal resolutionDays = totalDaysMap.get(accountId)/totalCasesMap.get(accountId);
            AccountsToUpdate.add(new Account(Id=accountId, Avg_Case_Resolution_Days__c = resolutionDays));
        }        
        // update account object        
        update AccountsToUpdate;
    }

}