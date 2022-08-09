public class futureMethodDemo {
    
    public static void getReady(){
        system.debug('Get Ready');
    }
    
    public static void breakfast(){
        system.debug('Breakfast');
    }

    
    public static void movie(){
        system.debug('Movie');
    }
    
    @future
    public static void carServicing(){
        system.debug('carServicing');
    }
}