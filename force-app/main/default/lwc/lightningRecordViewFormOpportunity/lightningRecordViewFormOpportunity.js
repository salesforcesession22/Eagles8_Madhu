import { LightningElement } from 'lwc';
import OPP_OBJECT from '@salesforce/schema/Opportunity';
import NAME_FIELD from '@salesforce/schema/Opportunity.Name';
import AMOUNT_FIELD from '@salesforce/schema/Opportunity.Amount';
import STAGENAME_FIELD from '@salesforce/schema/Opportunity.StageName';
import TYPE_FIELD from '@salesforce/schema/Opportunity.Type';
import CLOSEDDATE_FIELD from '@salesforce/schema/Opportunity.CloseDate';
import ACCOUNTNAME_FIELD from '@salesforce/schema/Opportunity.AccountId';


export default class LightningRecordViewFormOpportunity extends LightningElement {

    objectName = OPP_OBJECT;
    fields = {
        name : NAME_FIELD,
        amount : AMOUNT_FIELD,
        stage : STAGENAME_FIELD,
        type : TYPE_FIELD,
        closedate : CLOSEDDATE_FIELD,
        accname : ACCOUNTNAME_FIELD
    };
    recordId = "0065i00000445POAAY";
    
}