import { LightningElement } from 'lwc';
import CONTACT_OBJECT from '@salesforce/schema/Contact'
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CreateRecordContact extends LightningElement {

    /*TO GET THIS formdata object - DYNAMIC ASSIGNMENT
    formdata ={
        FirstName : "Madhu",
        LastName : "K",
        Email : "test@gmail.com",
        Title : "Salesforce Lead",
        Department : "Sales"
    }*/
    formdata = {};

    changeHandler(event){
        //const name = event.target.name;
        //const value = event.target.value;
        const {name,value} = event.target;
        this.formdata[name] = value;
    }

    resetForm(){
        //ON RESET, ERASE FORMDATA OBJECT ALSO
        this.template.querySelector('form.contact').reset();
        this.formdata = {};
    }

    saveContact(){
        //apiName => give explicitly, coz the import is not apiName
        const recordInput ={
            apiName: CONTACT_OBJECT.objectApiName,
            fields: this.formdata
        };
        //DONT NEED TO ASSIGN FOR SAME VARIABLENAME - createRecord({recordInput : recordInput})
        //LIKE TRY/CATCH USE THEN/CATCH
        createRecord(recordInput)
        .then(result => {
            console.log(result);
            this.createToast('Success','Created successfully!','success');
            this.resetForm();
        })
        .catch(error => {
            console.error(error);
            this.createToast('Error','Sorry!Try again later.','error');
        })
    }

    createToast(title,message,variant){
        const toast = new ShowToastEvent({title,message,variant});
        this.dispatchEvent(toast);
    }
}