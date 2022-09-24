public class ThrowCustomError {

    public class CustomException extends Exception {}
    
	@InvocableMethod
    public static void throwCustomFlow(FlowInput[] input){       
        throw new CustomException(input[0].errorMessage);
    }

    //Wrapper Class
    public class FlowInput{
        @InvocableVariable(label='Error message')
        public string errorMessage;
    }  

    
}