trigger LeadTrigger1 on Lead (before insert, before update, after insert) 
{
    switch on Trigger.operationType {
        when BEFORE_INSERT 
        {
            LeadTriggerHandler.beforeInsertHandler(Trigger.new);
        }
        when AFTER_INSERT
        {
            LeadTriggerHandler.afterInsertHandler(Trigger.new);
        }
        when BEFORE_UPDATE
        {
            LeadTriggerHandler.beforeUpdateHandler(Trigger.new, Trigger.oldMap);
        }
    }
}