trigger CreateAccountContact on Account (after insert, after update){
 if(trigger.isafter && trigger.isinsert) {
		acc1.createcon(Trigger.newMap);
    }
    }