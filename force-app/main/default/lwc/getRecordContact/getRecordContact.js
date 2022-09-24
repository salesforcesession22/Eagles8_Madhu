import { LightningElement, wire } from 'lwc';
import { getFieldDisplayValue, getRecord, getFieldValue } from 'lightning/uiRecordApi';
/*APPROACH 1 - IMPORT FIELDS ONE BY ONE*/
import ACCOUNTNAME_FIELD from '@salesforce/schema/Contact.Account.Name';
import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import PHONE_FIELD from '@salesforce/schema/Contact.Phone';
import DEPARTMENT_FIELD from '@salesforce/schema/Contact.Department';
const FIELDS = [ACCOUNTNAME_FIELD,FIRSTNAME_FIELD,LASTNAME_FIELD,EMAIL_FIELD,PHONE_FIELD,DEPARTMENT_FIELD];

/*APPROACH 2 - BOTH IMPORT FIELDS AND DIRECT FIELD NAMES WORK*/
/*const FIELDS = ['Contact.Account.Name',
                'Contact.FirstName',
                'Contact.LastName',
                'Contact.Email',
                'Contact.Phone',
                'Contact.Department']*/
              

export default class GetRecordContact extends LightningElement {
    

    /*WIRE APPROACH 1 - Without Getters */
    /*recordId = "0035i000005Nv5wAAC";
    accName;
    firstName;
    lastName;
    email;
    phone;
    dept;*/
    /*@wire(getRecord,{recordId :'$recordId', fields : FIELDS})
    displayFields({data,error}){
        if(data){
            console.log(data);
            /*APPROACH 2 - Get the field Values/DisplayValue */
            /*this.firstName = data.fields.FirstName.value;
            this.lastName = data.fields.LastName.value;
            this.email = data.fields.Email.value;
            this.phone = data.fields.Phone.value;
            this.dept = data.fields.Department.value;
            this.accName = data.fields.Account.displayValue;*/

            /*APPROACH 3 - getFieldDisplayValue & getFieldValue*/
           /*this.firstName = getFieldValue(data, FIRSTNAME_FIELD);
            this.lastName = getFieldValue(data, LASTNAME_FIELD);
            this.email = getFieldValue(data, EMAIL_FIELD);
            this.phone = getFieldValue(data, PHONE_FIELD);
            this.dept = getFieldValue(data, DEPARTMENT_FIELD);
            this.accName = getFieldDisplayValue(data,'Contact.Account');*/
        /*}
    }*/

    /*WIRE APPROACH 2 - With Getters */
    recordId = "0035i000005Nv5wAAC";
    @wire(getRecord,{recordId :'$recordId', fields : FIELDS})
    contact;
    
    get accName(){
        return getFieldDisplayValue(this.contact.data,'Contact.Account');
    }

    get firstName(){
        return getFieldValue(this.contact.data, FIRSTNAME_FIELD);
    }

    get lastName(){
        return getFieldValue(this.contact.data, LASTNAME_FIELD);
    }

    get email(){
        return getFieldValue(this.contact.data, EMAIL_FIELD);
    }

    get phone(){
        return getFieldValue(this.contact.data, PHONE_FIELD);
    }

    get dept(){
        return getFieldValue(this.contact.data, DEPARTMENT_FIELD);
    }
}