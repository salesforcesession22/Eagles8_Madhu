import { LightningElement } from 'lwc';
import searchContacts from '@salesforce/apex/contactCtrlLWC.searchContacts';

const COLUMNS = [
    {label: "First Name", fieldName: "FirstName", type: "text"},
    {label: "Last Name", fieldName: "LastName", type: "text"},
    {label: "Title", fieldName: "Title", type: "text"},
    {label: "Department", fieldName: "Department", type: "text"}
];

export default class P2cActionAtParentParent2 extends LightningElement {

    searchWord;
    contacts;
    error;
    columns = COLUMNS;

    changeHandler(event) {
        this.searchWord = event.target.value;
        searchContacts({searchKey: this.searchWord})
            .then(result => {
                this.contacts = result;
                this.error = undefined;
                if(this.contacts.length == 0) {
                    this.contacts = undefined;
                    this.error = "No results found for the inputted search word!";
                }
            })
            .catch(error => {
                this.error = error;
                this.contacts = undefined;
            })
    }
}