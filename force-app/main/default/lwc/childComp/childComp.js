import { LightningElement } from 'lwc';

export default class ChildComp extends LightningElement {
    clickHandler() {
        console.log("Child Comp: Show event gets originated!");
        const showEvent = new CustomEvent('show', {bubbles: true, composed: false});
        this.dispatchEvent(showEvent);
    }
}