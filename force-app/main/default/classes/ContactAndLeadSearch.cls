public class ContactAndLeadSearch 
{
	public static List<List<SObject>> searchContactsAndLeads(String Name)
    {
        List<List<SObject>> searchResult = [FIND :Name IN ALL FIELDS RETURNING Contact(Name), Lead(Name)];
        return searchResult;
    }
}