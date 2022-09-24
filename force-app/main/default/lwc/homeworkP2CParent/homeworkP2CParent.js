import { LightningElement,wire } from 'lwc';
import getAllAccounts from '@salesforce/apex/accountHandlerLWC.getAllAccounts';
import LightningAlert from 'lightning/alert';

export default class HomeworkP2CParent extends LightningElement {

    selectedaccount;
    accountOptions = []; 
    info;  

    @wire(getAllAccounts)
    accountHandler({data,error}){
        if(data){
            console.log(data);
            this.accountOptions = this.picklistGenerator(data);
            console.log(this.accountOptions);
        }
        if(error){
            console.error(error);
        }
    }

    picklistGenerator(data){
        return data.map(item => ({
            label: item.Name,
            value: item.Id
        }))
    }

    /*THIS CAN BE DIRECTLY CALLED FROM COMBOBOX
    changeHandler(event){
        this.selectedAccount = event.target.value;        
    }*/

    changeHandler(event){
        var selected=this.template.querySelector("lightning-combobox");
        this.selectedaccount=selected.value;
    }

    messageHandler(event){ 
        console.log(event.detail);
        this.info = event.detail;
        LightningAlert.open({
            message: this.info,
            theme: 'success', // a red theme intended for success states
            label: 'Success!', // this is the header text
        });
        //Alert has been closed           
    }
}