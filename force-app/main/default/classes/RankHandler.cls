public class RankHandler {
   //Rank 1 - Gold, 
   //Rank 2 - Silver, 
   //Rank 3 - Bronze, 
   //Rank 4-10 - Honorable Mention  

   public string returnPrice(Integer rank){
    string price ='';
    if(rank==1){
        price = 'Gold';
    }else if(rank==2){
        price = 'Silver';
    }else if(rank==3){
        price = 'Bronze';
    }else{
        if(rank>=4 && rank<=10){
            price = 'Honorable Mention';
        }
    }
    return price;
   }

   public string returnPriceSwitch(Integer rank){
    string price ='';
    switch on rank{
        when 1{
            price = 'Gold';
        }
        when 2{
            price = 'Silver';
        }
        when 3{
            price = 'Bronze';
        }
        when 4,5,6,7,8,10{
            price = 'Honorable mention';
        }
        when else{
            price = 'Participant_Else';
        }    
    }
    return price;
   }
}