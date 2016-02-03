public class QuestionaireImplementationController
{

    public document document { get; set; }
    public Attachment attach {get;set;}
    public Questionnaire_Implementation__c quesObj{get;set;}
    Public string companyName{get;set;}
    public string Emailval {get;set;}
    Public string almTools{get;set;}
    public string challenges{get;set;}
    Public string currentversionControl{get;set;}
    public string deploymentUser{get;set;}
    Public string hoursEffort{get;set;}
    public string longTermGoals{get;set;}
    Public string noOfSandbox{get;set;}
    public string releaseDuration{get;set;}
    //Public string noOfSandbox{get;set;}
    public string shortTermGoals{get;set;}
    Public string sizeOfSandbox{get;set;}
    public string testAutomation{get;set;}
    public boolean isclick{get;set;}
    
    List<id> OptyIdlist = new list<id>();
    List<Lead> leadIdList = new List<LEad>();
    List<id> ContactEmail = new list<id>();
    List<Opportunity> opptyList = new List<Opportunity>();
    public List<Lead> leadList{get;set;}
    
    public QuestionaireImplementationController() {
        isclick = false;
        attach = new Attachment();
        
    }
    public void searchdata()
    {
        
        If(string.isnotempty(companyName)||string.isnotempty(Emailval))
        {
            leadList = [select id,name,company,isconverted,ConvertedOpportunityId from lead where company = :companyName or email = :Emailval];
            if(leadList.size()>0 && !leadlist.isempty())
            {
                for(Lead leadObj : leadList)
                {
                    if(leadObj.isconverted == true)
                    {
                        OptyIdlist.add(leadObj.ConvertedOpportunityId);
                    }
                    else
                    {
                        leadIdList.add(leadObj);
                    }
                }
                
                opptyList = [select id,name,account.name from opportunity where id in : OptyIdlist];
            }
            system.debug('@@@@@'+opptyList + 'and leadlist is'+leadIdList );
            /*  else
            {
            opptyList = [select id,name,accountid,account.name from opportunity where account.name = :companyName];
            }*/
        }
        
        //return opptyList;
    }
    
    public PageReference Save()
    {
        system.debug('@@@@@'+companyName);
        searchdata();
        system.debug('@@@@@'+opptyList + 'and leadlist is'+leadIdList );
        isclick = true;
        Id LeadRecordTypeId = Schema.SObjectType.Questionnaire_Implementation__c.getRecordTypeInfosByName().get('Lead Questionnaire').getRecordTypeId();
        Id OptyTypeId = Schema.SObjectType.Questionnaire_Implementation__c.getRecordTypeInfosByName().get('Opportunity Questionnaire').getRecordTypeId();
        
        try {
            quesObj = new Questionnaire_Implementation__c();
            quesObj.ALM_Tools__c = almTools;
            quesObj.Challenges__c= challenges;
            quesObj.Current_Version_Control_Tool_If_Exists__c = currentversionControl;
            quesObj.Deployment_User__c = deploymentUser;
            quesObj.Hours_of_effort__c = hoursEffort;
            quesObj.Email__c = Emailval;
            quesObj.Company_Name__c = companyName;
            quesObj.Long_Term_Goals__c = longTermGoals;
            quesObj.No_of_Sanbox_in_Release__c = noOfSandbox;
            quesObj.Release_Duration__c = releaseDuration;
            quesObj.Short_Term_Goals_with_current_RLM__c = shortTermGoals;
            quesObj.Size_of_Sanboxes__c = sizeOfSandbox;
            quesObj.Size_of_Sanboxes__c = testAutomation;
            
            if(opptyList  !=null && opptyList.size()>0)
            {
                for(Opportunity oppObj : opptyList )
                {
                    if(oppObj.Account.name.equalsIgnoreCase(companyName))
                    {
                        quesObj.recordtypeId = OptyTypeId;
                        quesObj.OpportunityAcc__c = oppObj.accountid;
                    } 
                }
            }
            else if(leadIdList!=null && leadIdList.size()>0)
            {
                for(lead leadobjvar: leadIdList)
                {
                    if(leadobjvar.company.equalsIgnoreCase(companyName))
                    {
                    quesObj.recordtypeId = LeadRecordTypeId;
                    quesObj.Lead__c = leadobjvar.id;
                    }
                }
            }
          
        insert quesObj;
        if(attach.name!=null && attach.body!=null){
            attach.ParentId = quesObj.id;
            insert attach;}
    } catch(System.DMLException e) {
        ApexPages.addMessages(e);
        return null;
    }
    PageReference pg = page.ThankYouPage;
    pg.setRedirect(true);
    return pg;

}

}