trigger ContactTrigger on Contact (after insert, after update, after delete, after undelete) 
{
    switch on Trigger.operationType {
        when AFTER_INSERT
        {
            ContactTriggerHandler.afterInsertHandler(Trigger.new);
        }
        when AFTER_UPDATE
        {
            ContactTriggerHandler.affterUpdateHandler(Trigger.new, Trigger.oldMap);
        }
        when AFTER_DELETE
        {
            ContactTriggerHandler.afterDeleteHandler(Trigger.old);
        }
        when AFTER_UNDELETE
        {
            ContactTriggerHandler.afterUnDeleteHandler(Trigger.new);
        }
    }
}