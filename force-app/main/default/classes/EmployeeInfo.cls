public class EmployeeInfo {
//AccessModifier returnType methodName(parameters)
   public String showInfo(Integer empID){
    //Key DataType - Integer
    //Value DataType - String
    Map<Integer,String> employeeMap = new Map<Integer,String>();
    employeeMap.put(123,'Madhu');
    employeeMap.put(234,'Sri');
    employeeMap.put(345,'Huseyin');
    employeeMap.put(456,'Sara');
    employeeMap.put(567,'Ben');
    String empName = employeeMap.get(empID);
    return empName;
   }

   public void demoIf(){
    String value = '';
    if(value.length() >0){
        system.debug('Valid String');
    }
    else{
        system.debug('Empty String');
    }
   }
}