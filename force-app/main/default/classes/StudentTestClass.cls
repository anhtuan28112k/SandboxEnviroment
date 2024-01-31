@isTest
public class StudentTestClass {
    //List<Students__c> lstPoint = [SELECT TotalYearPoint__c FROM Students__c];
	@isTest
    public static void TotalYearPointTest(){
        Integer TotalYearPoint;
        if (TotalYearPoint < 0 || TotalYearPoint >10){
         	System.debug('Invalid total year point');   
        }
    }
}