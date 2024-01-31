public class CreateUserScript{
    public static void CreateNewUserAccount(){  
        // A List saves information of users
        List<CreateUser.UserParam> usr_list = new List<CreateUser.UserParam>(); 
        CreateUser.UserParam usr1 = new CreateUser.UserParam('Nguyen','Van A','A','nguyenvana@abc.com','nguyenvana@abc.com','Asia/Ho_Chi_Minh','en_US','UTF-8','vi_VN');
        CreateUser.UserParam usr2 = new CreateUser.UserParam('Nguyen','Thi B','B','nguyenthib@human.com','nguyenthib@human.com','Asia/Ho_Chi_Minh','en_US','UTF-8','vi_VN');
        usr_list.add(usr1);
        usr_list.add(usr2);
        CreateUser.CreateNewUser(usr_list);
    }
}