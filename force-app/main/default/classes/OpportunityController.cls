public class OpportunityController {
    
    @AuraEnabled
    public static List<Opportunity> showOppRecords()
    {
        List<Opportunity> opplist = [select Name, Amount from Opportunity order by Name];
        return opplist;
    }
    public static void updateProfile(List<Id> oppIds)
    {
       List <Opportunity> opps = [Select Id, Amount, Profile__c from Opportunity where Id In :oppIds];
        for(Opportunity opp : opps)
        {
            if(opp.Amount == null)
            {
                opp.profile__c='Low';
            }
            else if(opp.Amount <10000)
            {
                opp.profile__c='Low';
            }
            else if(opp.Amount > 50000)
            {
                opp.profile__c='High';
            }
            else
            {
                opp.profile__c='Medium';
            }
          
        }
          update opps;
    }

}