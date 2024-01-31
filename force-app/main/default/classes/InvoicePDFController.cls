public class InvoicePDFController {
    public Account account {get; set;}
    
    public List<Opportunity> wonOppList {get; set;}
    public List<Opportunity> notWonOppList {get; set;}
            
    public invoicePDFController(){
        String accountId = ApexPages.currentPage().getParameters().get('accountId');
        
        this.account = [SELECT Id, Name, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry
                        FROM Account
                        WHERE Id = :accountId
                       ];

      	this.wonOppList = [SELECT Id, Name, Amount, CloseDate 
                           FROM Opportunity 
                           WHERE AccountId =: account.Id AND StageName = 'Closed Won'
                          ];
        
      	this.notWonOppList = [SELECT Id, Name, Amount, StageName 
                              FROM Opportunity 
                              WHERE AccountId =: account.Id AND StageName = 'Closed Won'
                             ];
    }

    @InvocableMethod(label='Email Invoice PDF' description='Generates and Emails an Invoice PDF')
    public static void generatePDF(List<List<String>> args){
        List<String> nested = args[0];
        
        String email = nested[0];
        String recordId = nested[1];
        
        PageReference invoicePDF = new PageReference('/apex/InvoicePDFView?accountId=' + recordId);
        
        Messaging.EmailFileAttachment attachment = new Messaging.EmailFileAttachment();
        attachment.setContentType('application/pdf');
        attachment.setFileName('Invoice PDF');
        attachment.body = invoicePDF.getContent();
        // Test Methods do not allow getContent calls so pass a blob if test is executing this code
        /*if(!test.isRunningTest()){
            attachment.body = invoicePDF.getContent();
        } else {
           attachment.body = blob.valueOf('blob');
        }*/
        
        attachment.setInline(false);
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(new String[] {email});
        mail.setSubject('Invoice PDF');
        mail.setHtmlBody('Here\'s the Invoice PDF you requested.');
        mail.setFileAttachments(new Messaging.EmailFileAttachment[] { attachment });
        
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
       	
    }
}