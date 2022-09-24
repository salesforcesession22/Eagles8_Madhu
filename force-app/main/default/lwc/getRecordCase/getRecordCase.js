import { getRecord,getFieldValue} from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';
import ACCOUNT_NAME_FIELD from '@salesforce/schema/Case.Account.Name';
const FIELDS = [ACCOUNT_NAME_FIELD];

export default class GetRecordCase extends LightningElement {
    recordId ="5005i000006MObxAAG";    
    type;
    reason;
    caseNumber;
    priority;
    status;
    subject;

    @wire(getRecord,{recordId: '$recordId', layoutTypes: ['Full'], modes: ['View']})
    caseDisplay({data,error}){
        if(data){
            console.log(data);
            this.caseNumber = data.fields.CaseNumber.value;
            this.priority = data.fields.Priority.value;
            this.status = data.fields.Status.value;
            this.subject = data.fields.Subject.value;
            this.type = data.fields.Type.value;
            this.reason = data.fields.Reason.value;            
        }
        if(error){
            console.error(error);
        }
    }

    @wire(getRecord,{recordId: '$recordId', fields:FIELDS})
    caseRecord;

    get accName(){
        return getFieldValue(this.caseRecord.data,ACCOUNT_NAME_FIELD);
    }
}