import { LightningElement, wire } from 'lwc';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import getAccountsByIndustry from '@salesforce/apex/accountHandlerLWC.getAccountsByIndustry';

import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';

const COLUMNS = [
    {label: "Account Name", fieldName: "Name", type: "text"},
    {label: "Account Type", fieldName: "Type", type: "text"},
    {label: "Industry", fieldName: "Insutry", type: "text"},
    {label: "Annual Revenue", fieldName: "AnnualRevenue", type: "currency"}
];

export default class P2cActionAtParentParent3 extends LightningElement {

    industryOptions = [];
    selectedIndustry;
    accounts;
    error;
    columns = COLUMNS;

    @wire(getObjectInfo, {objectApiName: ACCOUNT_OBJECT})
    accountInfo;

    @wire(getPicklistValues, {fieldApiName: INDUSTRY_FIELD, recordTypeId: '$accountInfo.data.defaultRecordTypeId'})
    picklistHandler({data, error}) {
        if(data) {
            this.industryOptions = data.values;
        }
    }

    changeHandler(event) {
        this.selectedIndustry = event.target.value;
        getAccountsByIndustry({industry: this.selectedIndustry})
            .then(result => {
                this.accounts = result;
                this.error = undefined;
                if(this.accounts.length == 0) {
                    this.accounts = undefined;
                    this.error = "No matching accounts found for the selected industry!";
                }
            })
            .catch(error => {
                this.error = error;
                this.accounts = undefined;
            })
    }
}