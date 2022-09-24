import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
//Import the Object
import CONTACT_OBJECT from '@salesforce/schema/Contact';
//Import the fields
import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';

export default class LightningRecordForm extends LightningElement {

    selectedFields = [FIRSTNAME_FIELD,LASTNAME_FIELD];
    recordID = '0035i000005Nv5wAAC';
    objectName = CONTACT_OBJECT;
   
    showSuccessToast() {
        const event = new ShowToastEvent({
            title: 'Success',
            message: 'Created/Updated sucessful',
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(event);
    }

    errorhandler(){
        const eventError = new ShowToastEvent({
            title: 'Error',
            message: 'Please correct the error',
            variant: 'Error',
            mode: 'dismissable'
        });
        this.dispatchEvent(eventError);
    }
    
}