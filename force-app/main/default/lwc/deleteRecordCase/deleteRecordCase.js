import { deleteRecord } from 'lightning/uiRecordApi';
import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class DeleteRecordCase extends LightningElement {
    recordId;

    //collect the entered record id
    changeHandler(event) {
        this.recordId = event.target.value;
    }

    //using the deleteRecord function, delete the record
    deleteRec() {
        deleteRecord(this.recordId)
            .then(result => {
                console.log(result);
                this.createToast("Success", "The record has been deleted successfully!", "success");
            })
            .catch(error => {
                console.error(error);
                this.createToast("Error", "Please enter a valid record id!", "error");
            })
    }

    createToast(title, message, variant) {
        const toast = new ShowToastEvent({title, message, variant});
        this.dispatchEvent(toast);
    }

}