import { LightningElement, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import CASE_OBJECT from '@salesforce/schema/Case';
import SUBJECT_FIELD from '@salesforce/schema/Case.Subject';
import PRIORITY_FIELD from '@salesforce/schema/Case.Priority';
import STATUS_FIELD from '@salesforce/schema/Case.Status';
import DESCRIPTION_FIELD from '@salesforce/schema/Case.Description';
import ORIGIN_FIELD from '@salesforce/schema/Case.Origin';
import ACCOUNT_FIELD from '@salesforce/schema/Case.AccountId';
import CONTACT_FIELD from '@salesforce/schema/Case.ContactId';

export default class AssiWeek1UC5 extends LightningElement {

@track isReadOnly = false;

fields = {
    subject : SUBJECT_FIELD,
    priority : PRIORITY_FIELD,
    status : STATUS_FIELD,
    desc : DESCRIPTION_FIELD,
    origin : ORIGIN_FIELD,
    account : ACCOUNT_FIELD,
    contact : CONTACT_FIELD
};
recordId = '5005i000006MObjAAG';
objectName = CASE_OBJECT;
    
       
        showSuccessToast() {
            const event = new ShowToastEvent({
                title: 'Success',
                message: 'Updated sucessful',
                variant: 'success',
                mode: 'dismissable'
            });
            this.dispatchEvent(event);
        }
    
        showErrorToast(){
            const eventError = new ShowToastEvent({
                title: 'Error',
                message: 'Sorry! Try again later.',
                variant: 'Error',
                mode: 'dismissable'
            });
            this.dispatchEvent(eventError);
        }

        handleChange(event){
            if(event.detail.value === 'Working'){
                this.isReadOnly = true;
            }            
        }
}