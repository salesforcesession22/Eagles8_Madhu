public class future_MixedDMLHandling {
    
    /*------------------Setup Object - Create User Record----------------------*/    
        public void createUser(){
            profile profileID =[select id from profile where name='Standard Platform User' LIMIT 1];
            userrole userroleID =[select id from userrole where name='CEO' LIMIT 1];
            user userMixedDML = new user();
            userMixedDML.FirstName = 'TestUser';
            userMixedDML.LastName = 'MixedDML';
            userMixedDML.alias='batch822';
            userMixedDML.Email='salesforcesession22@gmail.com';
            userMixedDML.emailencodingkey='UTF-8';
            userMixedDML.LanguageLocaleKey='en_US';
            userMixedDML.Localesidkey='en_US';
            userMixedDML.ProfileId=profileID.id;
            userMixedDML.userroleid=userroleID.id;
            userMixedDML.timezonesidkey='America/Los_Angeles';
            userMixedDML.username='batch8_102@SoftInnovas.com';        
            insert userMixedDML;            
            futurecall_createAccount();
        }
    /*------------------Non-Setup Object - Create Account Record----------------------*/
    
        @future
        public static void futurecall_createAccount(){
            Account acc = new Account();
            acc.name='AccountMixedDML';       
            insert acc;
        }
    
    }