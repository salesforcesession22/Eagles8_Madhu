import { LightningElement } from 'lwc';

export default class RecordDetailParent extends LightningElement {
    selectedObject;
    selectedRecord;
    showModal = false;

    showHandler() {
        this.showModal = true;
    }

    closeHandler() {
        this.showModal = false;
    }

    changeHandler(event) {
        if(event.target.name === "Object") {
            this.selectedObject = event.target.value
        } else {
            this.selectedRecord = event.target.value;
        }
    }

    get objectOptions() {
        return [
            {label: "Account", value: "Account"},
            {label: "Contact", value: "Contact"},
            {label: "Case", value: "Case"},
            {label: "Opportunity", value: "Opportunity"},
            {label: "Student", value: "Student__c"}
        ];
    }
}