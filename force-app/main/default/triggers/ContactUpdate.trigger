trigger ContactUpdate on Account (after update) 
{
	list<account> accList = [select id,name, billingCity,(select id, MailingCity from contacts) 
                             from account where id in :Trigger.newMap.keyset()];
    list<contact> conList = new list<contact>();
    for(account acc: accList)
    {          
        if(Trigger.oldMap.containskey(acc.id) && Trigger.newMap.containskey(acc.id) && 
           Trigger.oldMap.get(acc.id).billingCity != Trigger.newMap.get(acc.id).billingCity)
        {
            for(contact c:acc.contacts)
            {
                c.MailingStreet = Trigger.newMap.get(acc.id).billingStreet;
                c.MailingCity = Trigger.newMap.get(acc.id).billingCity;
                c.MailingState = Trigger.newMap.get(acc.Id).billingState;
                c.MailingPostalCode  = Trigger.newMap.get(acc.Id).billingPostalCode;
                c.MailingCountry = Trigger.newMap.get(acc.Id).billingCountry;
                conList.add(c);
            }           
        }
    }
    update conList;
}