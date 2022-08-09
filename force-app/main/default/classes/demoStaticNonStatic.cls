public class demoStaticNonStatic {    
    /*Variables can be Static or Non-Static*/
    public String non_staticString = 'This is a Non-Static String';
    public static String staticString = 'This is a Static String';    
    /*Methods can be Static or Non-Static*/
    public static void staticMethod(){
        system.debug('This is a Static Method');
    }
    public void non_staticMethod(){
        system.debug('This is a Non-Static Method');
    }
}