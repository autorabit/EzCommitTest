public class AccountDatatabl{
//Adding some new changes to this class
public void getAccounts(){

List<Account> acclist = [select id,name from account limit 10];

}
public void selectedaccounts(){}
//Wrapper Class added by bhargavi
public class selectAccount{

public Account acc{get;set;}
public boolean isselected{get;set;}
public boolean intvar{get;set;}
public selectAccount(Account accObj,Boolean selectedAcc)
{
this.acc = accobj;
this.isselected = selectedAcc;
}







}
}