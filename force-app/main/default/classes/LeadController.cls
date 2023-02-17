public class LeadController {

    @AuraEnabled
    public static List<Lead> showNames()
    {
        List<Lead> rlist =[select LastName from Lead order by LastName];
        return rlist;
    }
}