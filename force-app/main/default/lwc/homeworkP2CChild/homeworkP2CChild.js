import { LightningElement,api } from 'lwc';
//Import the Object
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
//Import the fields
import ACCOUNTNAME_FIELD from '@salesforce/schema/Account.Name';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import RATING_FIELD from '@salesforce/schema/Account.Rating';
import ACCOUNTNUMBER_FIELD from '@salesforce/schema/Account.AccountNumber';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import ANNUALREVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';

export default class HomeworkP2CChild extends LightningElement {

    @api selectedFields = [
        ACCOUNTNAME_FIELD,
        ACCOUNTNUMBER_FIELD,
        ANNUALREVENUE_FIELD,
        TYPE_FIELD,
        RATING_FIELD,
        PHONE_FIELD];    
    @api objectName = ACCOUNT_OBJECT;
    @api recordid;

    successHandler(){        
            console.log("Before dispatch");
            const successEvent = new CustomEvent('recordsuccess',{detail: "Record Saved Successfully :)"});
            this.dispatchEvent(successEvent);        
    }


}