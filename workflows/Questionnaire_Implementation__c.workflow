<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_Email_to_Sales_Team_when_Questionnaire_is_created</fullName>
        <description>Send  Email to Sales Team when Questionnaire is created</description>
        <protected>false</protected>
        <recipients>
            <recipient>bhargavi.v@autorabit.com.devsb</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Questionnaire_Information</template>
    </alerts>
    <rules>
        <fullName>Send Email on Questionnarie</fullName>
        <actions>
            <name>Send_Email_to_Sales_Team_when_Questionnaire_is_created</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>ISNEW()</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
