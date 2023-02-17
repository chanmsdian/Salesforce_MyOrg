trigger ContactDelete on Contact (before delete) 
{
    if(Trigger.IsBefore && Trigger.IsDelete)
    {
     for(Contact con : Trigger.old)
     	{
            if(con.AccountId!=null)
            {
                con.addError('You cannot delete this Contact as this is associated with an Account');
            }
     	}  
         
    }
}