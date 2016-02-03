global class AccountPage
{
    public Account account{get;set;}
    
    // constructor
    public AccountPage(){
        account = new Account();
    }
    
    // get sobject fields of account object
    public static List<String> getSobjectFields() 
       {
            List<String> fields = new List<String>();
            
            Map<String,Schema.SObjectType> gd = Schema.getGlobalDescribe();
            Schema.SObjectType sobjType = gd.get('account');
            Schema.DescribeSObjectResult r = sobjType.getDescribe();
            Map<String,Schema.SObjectField> M = r.fields.getMap();
            
            for(String fieldName : M.keyset())
                {
                    Schema.SObjectField field = M.get(fieldName);                                                    
                    Schema.DescribeFieldResult fieldDesc = field.getDescribe();
                    fields.add(fieldName.toLowerCase());
                }
            return fields;
       }  
       
       webservice static void mywebserv(){
       
       system.debug('la la lalal akal');
       } 
}