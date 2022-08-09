import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import CASE_OBJECT from '@salesforce/schema/Case';
import SUBJECT_FIELD from '@salesforce/schema/Case.Subject';
import PRIORITY_FIELD from '@salesforce/schema/Case.Priority';
import STATUS_FIELD from '@salesforce/schema/Case.Status';
import DESCRIPTION_FIELD from '@salesforce/schema/Case.Description';
import ORIGIN_FIELD from '@salesforce/schema/Case.Origin';

export default class AssiWeek1UC4 extends LightningElement {

    selectedFields = [SUBJECT_FIELD,PRIORITY_FIELD,STATUS_FIELD,DESCRIPTION_FIELD,ORIGIN_FIELD];
    recordID = '5005i000006MObjAAG';
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

}