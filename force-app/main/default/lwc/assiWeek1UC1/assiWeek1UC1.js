import { LightningElement, track } from 'lwc';

export default class AssiWeek1_UC1 extends LightningElement {
    @track username;
    @track role;

    get options() {
        return [
            { label: 'Salesforce Admin', value: 'Admin' },
            { label: 'Salesforce Developer', value: 'Developer' },
            { label: 'Salesforce Architect', value: 'Architect' },
            { label: 'Salesforce Lead', value: 'Lead' }
        ];
    }

    handleRoleChange(event) {
        this.role = event.detail.value;
    }

    handleChangeName(event) {
        this.username = event.detail.value;
    }

}