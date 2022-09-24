import { LightningElement,api } from 'lwc';

export default class DisconnectedCallbackChild extends LightningElement {
    @api name;

    disconnectedCallback() {
        console.log("Child - DisconnectedCallback");
    }
}