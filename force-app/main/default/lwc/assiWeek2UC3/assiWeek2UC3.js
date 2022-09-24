import { LightningElement } from 'lwc';
import LEAD_OBJECT from '@salesforce/schema/Lead'
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class AssiWeek2UC3 extends LightningElement {
    formdata = {};

    changeHandler(event){
        //const name = event.target.name;
        //const value = event.target.value;
        const {name,value} = event.target;
        this.formdata[name] = value;
    }

    resetForm(){
        //ON RESET, ERASE FORMDATA OBJECT ALSO
        this.template.querySelector('form.lead').reset();
        this.formdata = {};
    }

    saveLead(){
        //apiName => give explicitly, coz the import is not apiName
        const recordInput ={
            apiName: LEAD_OBJECT.objectApiName,
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