import { api,LightningElement } from 'lwc';

export default class DisplayResultsRecordsChild extends LightningElement {
    @api records;
    @api columns;
    @api error;
    
}