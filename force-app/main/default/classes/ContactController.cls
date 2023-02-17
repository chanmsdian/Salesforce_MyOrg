public class ContactController {
    
    @AuraEnabled
    public static Contact showContactAccount(string conid)
    {
        Contact con = [select Account.Name, Account.AnnualRevenue, Account.NumberOfEmployees from Contact 
                       where ID = :conid LIMIT 1];
        return con;
    }
    
    @AuraEnabled
    public static string insertNewRecord(string confname, string conlname, string conemail)
    {
        try
        {
            Contact conrec = new Contact();
            conrec.FirstName = confname;
            conrec.LastName = conlname;
            conrec.Email = conemail;
            insert conrec;
            return conrec.Id;
        }
        catch(System.DmlException ex)
        {
            return ex.getMessage();
        }
    }
    

}