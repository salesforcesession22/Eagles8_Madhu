import { LightningElement, wire, track } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import ACC_OBJECT from '@salesforce/schema/Account';
import ACCNAME_FIELD from '@salesforce/schema/Account.Name';
import ACCANNUALREV_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import ACCNUMBER_FIELD from '@salesforce/schema/Account.AccountNumber';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
const FIELDS = [ACCNAME_FIELD,ACCANNUALREV_FIELD,INDUSTRY_FIELD,ACCNUMBER_FIELD,PHONE_FIELD]

export default class GetRecordAccount extends LightningElement {
    @track accRecord;  
    recordId = "0015i000006FWsVAAW";

    @wire(getRecord, {recordId : '$recordId', fields : FIELDS})
    displayRecord({data,error}){
        if(data){
            console.log(data);
            this.accRecord = data;          
        }
        if(error){
            console.error(error);
        }
    }

    get name() {
        return this.accRecord.fields.Name.value;
    }

    get accRevenue(){
        return this.accRecord.fields.AnnualRevenue.displayValue;
    }

    get accNum(){
        return this.accRecord.fields.AccountNumber.value;
    }

    get industry(){
        return this.accRecord.fields.Industry.value;
    }

    get phone(){
        return this.accRecord.fields.Phone.value;
    }
}