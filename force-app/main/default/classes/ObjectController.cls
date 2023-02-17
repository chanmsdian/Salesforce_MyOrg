public class ObjectController {
    @AuraEnabled 
    public static List<SObject> showObjectRecords(string objname)
    {
        List<SObject> slist = Database.query('select Id,Name,CreatedDate from '+objName);
        return slist;
    }

}