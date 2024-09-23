public class DeactivateUsersBatch implements Database.Batchable<sObject>, Schedulable{

    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT Id,Deactivation_Date__c,isActive,Profile.Name,LastLoginDate FROM User WHERE isActive = true');
    }

    public void execute(Database.BatchableContext bc, List<sObject> scope){
        Map<String, Auto_User_Inactive__mdt> profileAUIMap = new Map<String, Auto_User_Inactive__mdt>();
        
        for(Auto_User_Inactive__mdt auI : [SELECT Label, Number_of_Days__c, From_Last_Login_Date__c FROM Auto_User_Inactive__mdt]){
            profileAUIMap.put(auI.Label, auI);
        }
        
        List<User> deactivatedUsers = new List<User>();
        User userRecord;
        for(sobject s : scope){
            userRecord = (User)s;
            if(profileAUIMap.containsKey(userRecord.Profile.Name)){
                if(!profileAUIMap.get(userRecord.Profile.Name).From_Last_Login_Date__c && userRecord.Deactivation_Date__c < Date.today()){
                    userRecord.isActive = false;
                    deactivatedUsers.add(userRecord);
                }else if(profileAUIMap.get(userRecord.Profile.Name).From_Last_Login_Date__c 
                    && (userRecord.LastLoginDate == null || 
                        userRecord.LastLoginDate < Date.today().addDays((Integer)profileAUIMap.get(userRecord.Profile.Name).Number_of_Days__c))){
                    userRecord.isActive = false;
                    deactivatedUsers.add(userRecord);
                }
            }
        }
        Database.update(deactivatedUsers, false);
    }
    
    public void execute(SchedulableContext ctx) {
        Database.executeBatch(new DeactivateUsersBatch(), 200);
    }

    public void finish(Database.BatchableContext bc){
    }
}