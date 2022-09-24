import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import OPP_OBJECT from'@salesforce/schema/Opportunity';

export default class GetPicklistValuesByRecordTypeOpp extends LightningElement {
    oppRtId;
    stageOptions;
    typeOptions;
    forecastCategoryOptions;
    forecastCategoryNamesOptions;
    leadSourceOptions;
    deliveryInstallationStatusOptions;

    selectedStage;
    selectedType;
    selectedforecastCategory;
    selectedforecastCategoryNames;
    selectedleadSource;
    selecteddeliveryInstallationStatus;

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
            this.forecastCategoryOptions = data.picklistFieldValues.ForecastCategory.values;
            this.forecastCategoryNamesOptions = data.picklistFieldValues.ForecastCategoryName.values;
            this.leadSourceOptions = data.picklistFieldValues.LeadSource.values;
            this.deliveryInstallationStatusOptions = data.picklistFieldValues.DeliveryInstallationStatus__c.values;
        }
    }

    changeHandler(event){
        if(event.target.name === "stage"){
            this.selectedStage = event.target.value;
        }else if(event.target.name === "type"){
            this.selectedType = event.target.value;
        }else if(event.target.name === "foreCategory"){
            this.selectedforecastCategory = event.target.value;
        }else if(event.target.name === "foreCategoryNames"){
            this.selectedforecastCategoryNames = event.target.value;
        }else if(event.target.name === "leadsource"){
            this.selectedleadSource = event.target.value;
        }else if(event.target.name === "delInsStatus"){
            this.selecteddeliveryInstallationStatus = event.target.value;
        }
    }
}