import { LightningElement,api } from 'lwc';

export default class RecordDetailModal extends LightningElement {
    @api recordId;
    @api objectName;

    closeHandler() {
        const closeEvent = new CustomEvent('close');
        this.dispatchEvent(closeEvent);
    }
}