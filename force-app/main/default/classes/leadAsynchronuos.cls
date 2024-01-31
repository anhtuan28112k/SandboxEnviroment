public class leadAsynchronuos {
	@future
    public static void updateLeadRecords(Set<Id> existingRecordIds){
        List<Lead> existingRecords = [SELECT Id, LeadSource FROM Lead WHERE Id IN :existingRecordIds];
        for (Lead record:existingRecords){
            record.LeadSource = 'Web';
        }
        update existingRecords;
    }
    @future
    public static void createLeadRecords(){
        Lead anotherLead = new Lead(LastName='Test Lead Single', Status='Open - Not Contacted',Company='SFDCFacts',Industry='Finance');
        insert anotherLead;
    }
}