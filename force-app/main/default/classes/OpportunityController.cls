public class OpportunityController {

    public static void updateProfile(List<Id> oppIds){
        // query all records first
        List<Opportunity> opps = [SELECT Id, Amount, Profile__c FROM Opportunity WHERE Id IN: oppIds];
        // iterate over all the items
        for(Opportunity opp : opps){
            // get opp record
            if(opp.Amount == null){
                opp.Profile__c = 'Low';
            } else if(opp.Amount <10000){
                opp.Profile__c = 'Low';
            } else if (opp.Amount > 50000){
                opp.Profile__c = 'High';
            } else{
                opp.Profile__c = 'Medium';
            }
        }
        update opps;
    }
}