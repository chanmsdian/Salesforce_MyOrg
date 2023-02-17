public class CreateContact 
{
    @AuraEnabled
	public static String CreateContact(contact contObj)
    {
        System.debug('Contact :'+contObj.firstName);
        insert contObj;
        return contObj.Id;
    }
    @AuraEnabled
	public static List<contact> getContactRecords()
    {
        return [SELECT Id, FirstName, LastName, phone, Email from Contact];
    }
}