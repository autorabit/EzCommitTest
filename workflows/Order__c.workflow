<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Send_to_Approval</fullName>
        <field>Status__c</field>
        <literalValue>Submitted</literalValue>
        <name>Send to Approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Status Update</fullName>
        <actions>
            <name>Send_to_Approval</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Order__c.Quantity__c</field>
            <operation>greaterOrEqual</operation>
            <value>6</value>
        </criteriaItems>
        <description>Demo Time</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
