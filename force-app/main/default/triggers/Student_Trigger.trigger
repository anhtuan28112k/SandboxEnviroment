trigger Student_Trigger on Students__c (after insert) {
    if (trigger.isInsert && Trigger.isAfter){
        StudentHandleClass.sendEmailNotifi(trigger.new);
    }
}