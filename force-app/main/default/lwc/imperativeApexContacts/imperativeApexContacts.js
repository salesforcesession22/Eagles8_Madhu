import { LightningElement } from 'lwc';
import searchContacts from '@salesforce/apex/contactCtrlLWC.searchContacts'

export default class ImperativeApexContacts extends LightningElement {
    searchWord;
    contacts;
    error;

    searchHandler(event){
        this.searchWord = event.target.value;
        searchContacts({searchKey: this.searchWord})
            .then(result => {
                console.log(result);
                this.contacts = result;
            })
            .catch(error => {
                console.error(error);
                this.error = error;
            })
    }

    
}