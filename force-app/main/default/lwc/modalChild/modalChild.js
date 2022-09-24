import { LightningElement } from 'lwc';

export default class ModalChild extends LightningElement {

    closeEventHandler(){
        console.log("Before dispatch");
        const closeEvent = new CustomEvent('close');
        this.dispatchEvent(closeEvent);
    }
}