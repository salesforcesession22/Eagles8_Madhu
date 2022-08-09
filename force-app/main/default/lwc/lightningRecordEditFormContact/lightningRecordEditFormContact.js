import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';
import TITLE_FIELD from '@salesforce/schema/Contact.Title';
import DEPARTMENT_FIELD from '@salesforce/schema/Contact.Department';
import PHONE_FIELD from '@salesforce/schema/Contact.Phone';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';


export default class LightningRecordEditFormContact extends LightningElement {

    objectName = CONTACT_OBJECT;
    fields = {
        firstname : FIRSTNAME_FIELD,
        lastname : LASTNAME_FIELD,
        title : TITLE_FIELD,
        dept : DEPARTMENT_FIELD,
        phone : PHONE_FIELD,
        email : EMAIL_FIELD
    };
    recordId = "";

    showSuccessToast() {
        const event = new ShowToastEvent({
            title: 'Success',
            message: 'Created sucessful',
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(event);
        const inputFields = this.template.querySelectorAll( 'lightning-input-field' );
        if ( inputFields ) {
            inputFields.forEach( field => {
                field.reset();
            } );
        }
    }

    showErrorToast() {
        const event = new ShowToastEvent({
            title: 'Error',
            message: 'Sorry, try again later!',
            variant: 'error',
            mode: 'dismissable'
        });
        this.dispatchEvent(event);
    }
}