@isTest
public with sharing class DeactivateUsersBatchTest {
   public static testMethod void testScheduler() {
        
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User']; 
        User u = new User(Alias = 'standt', Email='standarduser@testorg.com', 
            EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
            LocaleSidKey='en_US', ProfileId = p.Id, isActive=true,
            TimeZoneSidKey='America/Los_Angeles', UserName='standarduser@testorg.com', Deactivation_Date__c = System.today().addDays(-1));

        Test.startTest();
        DeactivateUsersBatch scheduler = new DeactivateUsersBatch();
        scheduler.execute(null);
        Test.stopTest();
    }
    public static testMethod void testBatch() {
        
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User']; 
        User u = new User(Alias = 'standt', Email='standarduser@testorg.com', 
            EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
            LocaleSidKey='en_US', ProfileId = p.Id, isActive=true,
            TimeZoneSidKey='America/Los_Angeles', UserName='standarduser@testorg.com', Deactivation_Date__c = System.today().addDays(-1));

        Test.startTest();
        DeactivateUsersBatch bactch = new DeactivateUsersBatch();
        bactch.execute(null, new List<User>{u});
        Test.stopTest();
    }
}