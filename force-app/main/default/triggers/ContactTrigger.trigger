trigger ContactTrigger on Contact (after insert) {
    if(trigger.isafter && trigger.isinsert) {
		acc1.updateCheckboxOnAccount(Trigger.new);
    }
}