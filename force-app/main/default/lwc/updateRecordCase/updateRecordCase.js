import { updateRecord } from 'lightning/uiRecordApi';
import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class UpdateRecordCase extends LightningElement {

    recordId = "5005i000006MObjAAG";
    formdata = {};

    //prepare an object of inputted data
    changeHandler(event) {
        const {name, value} = event.target;
        this.formdata[name] = value;
    }

    //reset the form and erase form data
    resetForm() {
        this.template.querySelector('form.case').reset();
        this.formdata = {};
    }

    //update the case record and show a toast message
    saveCase() {
        this.formdata["Id"] = this.recordId;
        const recordInput = {fields: this.formdata};
        updateRecord(recordInput)
            .then(result => {
                console.log(result);
                this.createToast("Success", "Case has been updated successfully!", "success");
                //resetForm(); - throws error
            })
            .catch(error => {
                console.error(error);
                this.createToast("Error", "Error occurred while updating the case!", "error");                
            })
    }

    createToast(title, message, variant) {
        const toast = new ShowToastEvent({title, message, variant});
        this.dispatchEvent(toast);
    }

}