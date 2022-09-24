import { LightningElement,wire } from 'lwc';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import OPP_OBJECT from '@salesforce/schema/Opportunity'
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName'
import getOppsByStage from '@salesforce/apex/opportunityHandlerLWC.getOppsByStage';
const COLUMNS = [
    {label: "Name", fieldName: "Name", type: "text"},
    {label: "Type", fieldName: "Type", type: "text"},
    {label: "Stage Name", fieldName: "StageName", type: "text"},
    {label: "Amount", fieldName: "Amount", type: "currency"}
];

export default class WiredApexMethod4 extends LightningElement {
    selectedStage;
    stageOptions;
    defaultCaseRtId;
    columns = COLUMNS;

    @wire(getOppsByStage, {stageName: '$selectedStage'})
    oppsbyStage;

    changeHandler(event){
        this.selectedStage = event.target.value;        
    }


    @wire(getObjectInfo,{objectApiName:OPP_OBJECT})
    objectHandler({data,error}){
        if(data){
            console.log(data);
            this.defaultCaseRtId = data.defaultRecordTypeId;
        }
        if(error){
            console.log(error);
        }
    }
    
    @wire(getPicklistValues,{fieldApiName:STAGE_FIELD,recordTypeId:'$defaultCaseRtId'})
    picklistHandler({data,error}){
        if(data){
            console.log(data);
            this.stageOptions = data.values;
        }
        if(error){
        }
    }
}