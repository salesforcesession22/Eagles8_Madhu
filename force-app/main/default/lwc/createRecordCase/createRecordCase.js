import { LightningElement, wire } from 'lwc';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import CASE_OBJECT from '@salesforce/schema/Case'
import PRIORITY_FILED from '@salesforce/schema/Case.Priority'
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CreateRecordCase extends LightningElement {
    formdata = {}
    priorityOptions;
    selectedPiority;
    defaultCaseRtId

    changeHandler(event){
        const {name,value} = event.target;
        this.formdata[name] = value;
    }


    @wire(getObjectInfo,{objectApiName:CASE_OBJECT})
    objectHandler({data,error}){
        if(data){
            console.log(data);
            this.defaultCaseRtId = data.defaultRecordTypeId;
        }
        if(error){
            console.log(error);
        }
    }
    
    @wire(getPicklistValues,{fieldApiName:PRIORITY_FILED,recordTypeId:'$defaultCaseRtId'})
    picklistHandler({data,error}){
        if(data){
            console.log(data);
            this.priorityOptions = data.values;
        }
        if(error){
        }
    }
   


    resetForm(){
        //ON RESET, ERASE FORMDATA OBJECT ALSO
        this.template.querySelector('form.case').reset();
        this.formdata = {};
        this.priorityOptions = [];
    }

    saveCase(){
        const recordInput ={
            apiName: CASE_OBJECT.objectApiName,
            fields: this.formdata
        };
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