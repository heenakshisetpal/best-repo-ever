trigger gold on Opportunity (after insert,after update) {
    Set<id> AccountIds = new Set<id>();
    List<account> accLIst= new List<account>();
    for (Opportunity opp : Trigger.new)
    {
        if(opp.Amount>20000)
        {
            AccountIds.add(opp.AccountId);
            
        }
    }
    list<account> acclist2= [Select Id,is_gold__c From Account where Id IN : AccountIds];
    if(acclist2 != null){
        for(Account acc: acclist2){
            acc.is_gold__c=true;
            accLIst.add(acc);
        }
      update accLIst;
    }
    
         }