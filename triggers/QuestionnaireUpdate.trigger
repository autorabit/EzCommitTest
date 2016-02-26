trigger QuestionnaireUpdate on Lead (after update) {
    
  List<Questionnaire_Implementation__c> updateQuestions = new List<Questionnaire_Implementation__c>();
  List<Questionnaire_Implementation__c> questionObjList = [select id,Lead__c,Lead__r.isconverted,Lead__r.ConvertedOpportunityId from Questionnaire_Implementation__c where Lead__c in : Trigger.new]; 
  system.debug('@@'+questionObjList); 
    for(Questionnaire_Implementation__c questObj: questionObjList){
        
        if(questObj.Lead__r.isconverted && (questObj.Lead__r.ConvertedOpportunityId!=null && questObj.Lead__r.ConvertedOpportunityId!=''))
        {
            system.debug('@@'+questObj.Lead__r.ConvertedOpportunityId); 
           questObj.Opportunity__c = questObj.Lead__r.ConvertedOpportunityId;
           updateQuestions.add(questObj);
            }
        }
        update updateQuestions;
    }