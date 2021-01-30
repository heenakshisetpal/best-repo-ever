public class acc1 {
    public static void createcon(map<ID,Account> newAccMap)
    {
        List <account> acc12 =[select only_default_contact__c,Name from Account where Id In:newAccMap.keySet()];
        List <contact> con = new List<contact>();
        for(Account acc : acc12) {
			  Contact con1 = new Contact(AccountId = acc.Id);
			  List<String> nameStr = acc.Name.split('info default');
			  if(nameStr.size()>0)
				 con1.LastName = nameStr[0];
			  if(nameStr.size()>1)
				  con1.FirstName = nameStr[1];
				  
			con1.Email = 'info@websitedomain.tld';
			acc.only_default_contact__c = TRUE;
			con.add(con1);
		}
		insert con;		
	}
    
public static void updateCheckboxOnAccount(List<Contact> contactList){
		Set<Id> accountIds = new Set<Id>();
		for(Contact con : contactList) {
			 accountIds.add(con.AccountId);
		}
		
		List<Account> updatedAccounts = new List<Account>();
		for(AggregateResult ar : [select count(id) , AccountId from Contact where AccountId IN :accountIds group by AccountId having count(id)  >1 ]){
			updatedAccounts.add(new Account(Id = (Id)ar.get('AccountId'), Only_Default_Contact__c=false));    
		}
		
		if(!updatedAccounts.isEmpty())
			update updatedAccounts;
	}
}
    

