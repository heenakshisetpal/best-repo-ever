public class accountup {
    public static void updateContact(Map<Id,Account> oldAccMap, Map<Id,Account> newAccMap){
        List<Id> acccID=new List<ID>();
        for(Id i: oldAccMap.keySet()){
            Account oldAcc= oldAccMap.get(i);
            Account newAcc= newAccMap.get(i);
            if(newAcc.Website!=null)
            {
                acccId.add(i);
            }
        }
        List<Contact> conLst =[select Id,FirstName,LastName, AccountId,Profile__c FROM Contact Where AccountId IN :acccId];
        for(Contact con: conLst){
            con.Profile__c= oldAccMap.get(con.AccountId).Website +'/'+con.FirstName.substring(0,1)+con.LastName;
        }
        update conLst;
    }

}