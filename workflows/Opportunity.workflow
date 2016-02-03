<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>First_Week_of_Trial</fullName>
        <description>First Week of Trial</description>
        <protected>false</protected>
        <recipients>
            <recipient>simon.w@autorabit.devsb</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/First_Week_of_Trial</template>
    </alerts>
    <alerts>
        <fullName>Trial_Period_Ending_in_two_Days</fullName>
        <description>Trial Period Ending in two Days</description>
        <protected>false</protected>
        <recipients>
            <recipient>simon.w@autorabit.devsb</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Trial_Period_Ended</template>
    </alerts>
    <fieldUpdates>
        <fullName>ClosureLimit</fullName>
        <field>CloseDate</field>
        <formula>DATE( YEAR(TODAY()) , (MONTH(TODAY()) + 6), DAY(TODAY()))</formula>
        <name>ClosureLimit</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Opportunity_Stage</fullName>
        <field>StageName</field>
        <literalValue>Trial Expired</literalValue>
        <name>Update Opportunity Stage</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Trial Expired</fullName>
        <actions>
            <name>Update_Opportunity_Stage</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Trial_End_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Trial Period  Last Week</fullName>
        <actions>
            <name>Trial_Period_Ending_in_two_Days</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>Trial_End_Date__c-2 =TODAY()</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Trial Period %3A Last Week</fullName>
        <actions>
            <name>First_Week_of_Trial</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>Trial_Start_Date__c +7 = TODAY()</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
