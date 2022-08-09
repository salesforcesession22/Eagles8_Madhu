public class LoopsDemoPractice {
    
    public integer sumOfInteger(List<Integer> inputList){
        Integer sum = 0;
        if(!inputList.isEmpty()){
            for(Integer i=0 ; i<inputList.size() ; i++){
                sum = sum + inputList.get(i);
                //0+10 = 10
                //10+20 = 30
                //30+30 = 60
            }             
        }
        return sum;
    }

}