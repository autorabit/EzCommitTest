global class AccountREceivablespage
{

/*
Adding  some dexcription
<apex:page standardController="Account" extensions="GenerateAccountReceivablesController" sidebar="false" showHeader="false" tabStyle="Account">
 <apex:pageBlock title="Account Receivables">
 <apex:repeat value="{!thousandBlocks}" var="block">
 <apex:pageBlockTable value="{!block.Invoices}" var="i" > 
        
   <apex:column >
     <apex:facet name="header"><b>Franchise</b></apex:facet>
      {!i.Franchise__c}
    </apex:column> 
     
     <apex:column >
      <apex:facet name="header"><b>TOM-ID</b></apex:facet>
      {!i.Account__r.TOM_ID__c} 
      </apex:column>
    
    <apex:column >
      <apex:facet name="header"><b>iScala Invoice #</b></apex:facet>
      {!i.iScala_Invoice__c}
    </apex:column>
    
    <apex:column >
      <apex:facet name="header"><b>Invoice Date</b></apex:facet>
       <apex:outputText value="{0,date,yyyy/MM/dd}">
           <apex:param value="{!i.Invoice_Date__c}" />
       </apex:outputText>
    </apex:column>
    
    <apex:column >
      <apex:facet name="header"><b>Due Date</b></apex:facet>
      <apex:outputText value="{0,date,yyyy/MM/dd}">
        <apex:param value="{!i.Due_Date__c}"/>
      </apex:outputText>
    </apex:column>
    
    <apex:column >
      <apex:facet name="header"><b>Invoice Amount</b></apex:facet>
      {!i.Invoice_Amount__c}
    </apex:column>
    
    <apex:column >
      <apex:facet name="header"><b>Currency</b></apex:facet>
      {!i.CurrencyIsoCode}
    </apex:column>
    
    <apex:column >
      <apex:facet name="header"><b>IC #</b></apex:facet>
      {!i.IC_Number__c}
    </apex:column>
    
    <apex:column >
      <apex:facet name="header"><b>Calculus Invoice #</b></apex:facet>
      {!i.Calculus_Invoice_No__c}
    </apex:column>
    
    <apex:column >
      <apex:facet name="header"><b>Paid Amount</b></apex:facet>
      {!i.Paid_Amount__c}
    </apex:column>
    
    
    <apex:column >
      <apex:facet name="header"><b>Paid Date</b></apex:facet>
      <apex:outputText value="{0,date,yyyy/MM/dd}">
        <apex:param value="{!i.Paid_Date__c}"/>
      </apex:outputText>
    </apex:column>
    
      
   </apex:pageBlockTable> 
   </apex:repeat>
 </apex:pageBlock> 
      
</apex:page>
*/

}