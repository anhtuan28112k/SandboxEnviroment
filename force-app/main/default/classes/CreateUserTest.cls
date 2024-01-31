@isTest
public class CreateUserTest {
   	@isTest
    public static void Test(){ 
        List<CreateUser.UserParam> usr_list = new List<CreateUser.UserParam>(); 
        CreateUser.UserParam usr1 = new CreateUser.UserParam('Smith','Sam','Sam','samsmith@abc.com','samsmith@abc.com','Asia/Ho_Chi_Minh','en_US','UTF-8','vi_VN');
        usr_list.add(usr1);
        CreateUser.UserParam usr2 = new CreateUser.UserParam('Parker','Peter','Peter','peter.parker@human.com','peter.parker@human.com','Asia/Ho_Chi_Minh','en_US','UTF-8','vi_VN');
        usr_list.add(usr2);
        Test.startTest();
        CreateUser.CreateNewUser(usr_list);
        Test.stopTest();
    }
}