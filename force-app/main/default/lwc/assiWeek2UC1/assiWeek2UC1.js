import { LightningElement,wire,track } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import OPP_OBJECT from'@salesforce/schema/Opportunity';

export default class AssiWeek2UC1 extends LightningElement {

    oppRtId;
    stageOptions;
    typeOptions;    
    @track showConfirmation = false;

    @wire(getObjectInfo, {objectApiName : OPP_OBJECT})
    oppInfoHandler({data,error}){
        if(data){
            this.oppRtId = data.defaultRecordTypeId;
        }
    }

    @wire(getPicklistValuesByRecordType, {objectApiName : OPP_OBJECT, recordTypeId :'$oppRtId'})
    picklistHandler({data,error}){
        if(data){
            console.log(data);
            this.stageOptions = data.picklistFieldValues.StageName.values;
            this.typeOptions = data.picklistFieldValues.Type.values;
        }
    }

    @track formdata = {};
    //To save the data for createRecord
    changeHandler(event){
        const {name,value} = event.target;
        this.formdata[name] = value;
    }

    resetForm(){
        //ON RESET, ERASE FORMDATA OBJECT ALSO
        this.template.querySelector('form.Opportunity').reset();
        this.formdata = {};
        this.stageOptions = [];
        this.typeOptions = [];
    }

    saveOpp(){
        const recordInput ={
            apiName: OPP_OBJECT.objectApiName,
            fields: this.formdata
        };
        createRecord(recordInput)
        .then(result => {
            console.log(result);
            this.createToast('Success','Created successfully!','success');
            //this.resetForm();
            this.showConfirmation = true;            
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