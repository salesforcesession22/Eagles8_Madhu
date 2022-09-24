public with sharing class CovidWrapper {
   
    public Integer date_Z {get;set;} 
	public Integer states {get;set;} 
    /* Positive & Negative count needed for the Assignment UseCase*/
	public Integer positive {get;set;} 
	public Integer negative {get;set;} 
    /*****************/
	public Integer pending {get;set;} 
	public Integer hospitalizedCurrently {get;set;} 
	public Integer hospitalizedCumulative {get;set;} 
	public Integer inIcuCurrently {get;set;} 
	public Integer inIcuCumulative {get;set;} 
	public Integer onVentilatorCurrently {get;set;} 
	public Integer onVentilatorCumulative {get;set;} 
	public String dateChecked {get;set;} 
	public Integer death {get;set;} 
	public Integer hospitalized {get;set;} 
	public Integer totalTestResults {get;set;} 
	public String lastModified {get;set;} 
	public Object recovered {get;set;} 
	public Integer total {get;set;} 
	public Integer posNeg {get;set;} 
	public Integer deathIncrease {get;set;} 
	public Integer hospitalizedIncrease {get;set;} 
	public Integer negativeIncrease {get;set;} 
	public Integer positiveIncrease {get;set;} 
	public Integer totalTestResultsIncrease {get;set;} 
	public String hash {get;set;}
  
}