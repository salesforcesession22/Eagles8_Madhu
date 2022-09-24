import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';

export default class GetAccountObjectInfo extends LightningElement {
    rtId;
    @wire(getObjectInfo,{objectApiName:ACCOUNT_OBJECT})
    objectHandler({data,error}){
        if(data){
            console.log(data);
            this.rtId = data.defaultRecordTypeId;
        }
        if(error){
            console.log(error);
        }
    }
}