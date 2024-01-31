public class CreateUser {
    public class UserParam {
        public String lastname  {get; set;}
        public String firstname {get; set;}
        public String alias {get;set;}
        public String email {get;set;}
        public String username {get;set;}
        public String timeZoneSidKey {get;set;}
        public String languageLocaleKey {get;set;}
        public String emailEncodingKey {get;set;}
        public String localeSidKey {get;set;}
        public UserParam(String lastname1, String firstname1, String alias1, String email1, String username1, String timeZoneSidKey1, String languageLocaleKey1, String emailEncodingKey1, String localeSidKey1){
            this.lastname = lastname1;
            this.firstname = firstname1;
            this.alias = alias1;
            this.email = email1;
            this.username = username1;
            this.timeZoneSidKey = timeZoneSidKey1;
            this.languageLocaleKey = languageLocaleKey1;
            this.emailEncodingKey = emailEncodingKey1;
            this.localeSidKey = localeSidKey1;
        }
    }
    public static void CreateNewUser( List<UserParam> info){
        Profile profileId = [SELECT Id FROM Profile WHERE Name = 'System Administrator' LIMIT 1];
        List <User> usr_list = new List<User>();
        For (UserParam inf : info){
        	User usr = new User(
                LastName = inf.lastname, 
                FirstName=inf.firstname, 
                Alias = inf.alias, 
                Email = inf.email, 
                Username = inf.username, 
                ProfileId = profileId.id, 
                TimeZoneSidKey = inf.timeZoneSidKey, 
                LanguageLocaleKey = inf.languageLocaleKey, 
                EmailEncodingKey = inf.emailEncodingKey, 
                LocaleSidKey = inf.localeSidKey, 
                isActive = false);    
        	usr_list.add(usr);
        }
        insert usr_list;
    }   
}