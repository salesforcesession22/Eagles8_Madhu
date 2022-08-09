public  class NumberRecords {
    public void validateNumbers(Integer inputNum){
        List<Integer> numberList = new List<Integer>();
        numberList.add(10);
        numberList.add(38);
        numberList.add(88);
        numberList.add(21);
        numberList.add(32);
        if(numberList.contains(inputNum)){
            system.debug('Number exists');
        }
        else{
            system.debug('Number does NOT exist');
        }
    }

    public void compareSets(Set<Integer> inputSet){
        Set<Integer> values = new Set<Integer>();
        values.add(111);
        values.add(222);
        values.add(333);
        if(values.equals(inputSet)){
            system.debug('Both sets are identical');
        }
        else{
            system.debug('Both sets are not identical');
        }
    }
}