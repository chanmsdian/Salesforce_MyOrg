public class ContactSearch 
{
	public static List<Contact> searchForContacts(String lastName, String mailingPostalCode)
    {
        try 
        {
            List<Contact> Contacts = [SELECT Id, Name, Email FROM Contact where LastName =:lastName and MailingPostalCode =:mailingPostalCode];
            return Contacts;
        }
        catch(Exception e) 
        {
    		System.debug('A exception has occurred: ' +e.getMessage());
            Return null;
        }   
    }
}