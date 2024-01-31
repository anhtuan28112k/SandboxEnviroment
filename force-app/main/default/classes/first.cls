public class first {
    public static void print(){
        List<Account> accounts = [Select name, Field1__c, Field2__c, Field3__c from Account where name='first'];
        For (Account c:accounts){
            System.debug('Ban ghi'+c.name+'co Field1 = '+c.Field1__c+'co Field2 = '+c.Field2__c+'co Field3 = '+c.Field3__c);
        }
    }
}