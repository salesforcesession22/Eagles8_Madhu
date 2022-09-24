import { LightningElement,track } from 'lwc';
import get10Contacts from '@salesforce/apex/contactCtrlLWC.get10Contacts'

export default class P2cNonPrimitivesParent2 extends LightningElement {

    @track contacts;   

    changeHandler(event){
        get10Contacts()
            .then(result => {
                this.contacts = result;
                console.log(result);                
            })
            .catch(error => {
                this.error=error;
                console.error(error);                              
            })                
    }   


}