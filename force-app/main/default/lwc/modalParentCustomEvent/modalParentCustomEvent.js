import { LightningElement,track } from 'lwc';
import get10Contacts from '@salesforce/apex/contactCtrlLWC.get10Contacts'
const COLUMNS = [
    {label: "First Name", fieldName: "FirstName", type: "text"},
    {label: "Last Name", fieldName: "LastName", type: "text"},
    {label: "Title", fieldName: "Title", type: "text"},
    {label: "Department", fieldName: "Department", type: "text"}
];

export default class ModalParentCustomEvent extends LightningElement {
    showModal = false;
    info;
    contacts;
    columns = COLUMNS;

    modalHandler(){
        this.showModal = true;        
    }

    closeHandler(event){
        this.showModal = false;
        console.log(event.detail);
        this.info = event.detail;        
    }

    contactHandler(event){
        //Calling the Apex Method to display
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