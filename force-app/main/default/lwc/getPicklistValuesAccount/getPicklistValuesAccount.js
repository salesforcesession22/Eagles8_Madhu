import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import RATING_FIELD from '@salesforce/schema/Account.Rating';
import TYPE_FIELD from '@salesforce/schema/Account.Type';

export default class GetPicklistValuesAccount extends LightningElement {
    defaultAccRtId;
    industryOptions;
    ratingOptions;
    typeOptions;
    @wire(getObjectInfo,{objectApiName:ACCOUNT_OBJECT})
    objectHandler({data,error}){
        if(data){
            console.log(data);
            this.defaultAccRtId = data.defaultRecordTypeId;
        }
        if(error){
            console.log(error);
        }
    }
    selectedIndustry;
    @wire(getPicklistValues,{fieldApiName:INDUSTRY_FIELD,recordTypeId:'$defaultAccRtId'})
    picklistHandler1({data,error}){
        if(data){
            console.log(data);
            this.industryOptions = data.values;
        }
        if(error){
        }
    }
    changeHandler1(event){
        this.selectedIndustry = event.target.value;
    }

    selectedRating;
    @wire(getPicklistValues,{fieldApiName:RATING_FIELD,recordTypeId:'$defaultAccRtId'})
    picklistHandler2({data,error}){
        if(data){
            console.log(data);
            this.ratingOptions = data.values;
        }
        if(error){
        }
    }
    changeHandler2(event){
        this.selectedRating = event.target.value;
    }

    selectedType;
    @wire(getPicklistValues,{fieldApiName:TYPE_FIELD,recordTypeId:'$defaultAccRtId'})
    picklistHandler3({data,error}){
        if(data){
            console.log(data);
            this.typeOptions = data.values;
        }
        if(error){
        }
    }
    changeHandler3(event){
        this.selectedType = event.target.value;
    }

}