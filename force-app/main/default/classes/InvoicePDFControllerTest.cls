@isTest
public class InvoicePDFControllerTest {
    
    // Create test records in setup method
    // We only have one test method in this case so it's not necessary to create test data here.
    // We could create test records in the test method itself but this could be useful if you want to have
    // additional test methods to test other things
    @TestSetup static void setup(){
        Account testAccount = new Account();
        testAccount.Name = 'test Account';
        
        insert testAccount;
        
        // TODO: Should probably create some opp/opp line test records and associate them with the account too... 
    }
	
    // Test email is sent
    @isTest static void testEmailIsSent(){
        // Retrieve test account
        // I usually  retrieve records in a list since it protects against a QueryException (Probably not needed in this case
        // since you know that the test account record was created and inserted by the setup method.) Just check the list for data before using it
        List<Account> testAccountList = [Select Id FROM Account WHERE Name = 'test Account'];
        
        // Check that the test account was actually inserted by the setup method. Again, probably not necessary...
        System.assertEquals(false, testAccountList.isEmpty(), 'Test Account record does not exist.');
        
        // Create and populate args List of Lists
        List<List<String>> args = new List<List<String>>();
        
        // Email value is expected first
        // Account record Id value is expected second
        args.add(new List<String>{'test@test.com', testAccountList[0].Id});
        
        // This creates new set of gov limits and executes all async processes upon the stopTest function call.
        Test.startTest();
        
        // Add AccountId param for InvoicePDFController class
        ApexPages.currentPage().getParameters().put('accountId', testAccountList[0].Id);
        
        // Instantiate InvoicePDFController Class to ensure constructor is called
        InvoicePDFController iPDFController = new InvoicePDFController();
        
        // Call generatePDF method
        InvoicePDFController.generatePDF(args);
        
        Integer emailInvocations = Limits.getEmailInvocations();
        Test.stopTest();
        
        // Check that an email was sent
        System.assertEquals(1, emailInvocations, 'Email was not sent.');

    }
}