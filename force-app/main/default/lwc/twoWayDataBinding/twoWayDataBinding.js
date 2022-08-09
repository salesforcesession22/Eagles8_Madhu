import { LightningElement } from 'lwc';

export default class TwoWayDataBinding extends LightningElement {

    fullname = "Madhumitha";
    title = "Salesforce Developer";

    handleChange(event){
        this.title = event.target.value;
    }

}