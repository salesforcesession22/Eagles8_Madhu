import { LightningElement } from 'lwc';

export default class ModalChildCustomEvent extends LightningElement {

    closeEventHandler(){
        console.log("Before dispatch");
        const closeEvent = new CustomEvent('close',{detail: "You are AWESOME!!!!"});
        this.dispatchEvent(closeEvent);
    }
}