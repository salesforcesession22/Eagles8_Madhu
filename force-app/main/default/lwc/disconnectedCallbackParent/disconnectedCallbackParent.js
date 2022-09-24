import { LightningElement } from 'lwc';

export default class DisconnectedCallbackParent extends LightningElement {
    name = "World";
    showChild = false;

    changeHandler(event) {
        this.name = event.target.value;
    }

    renderedCallback() {
        console.log("RenderedCallback has been called!");
        //this.name += " test";
    }

    showHandler() {
        this.showChild = !this.showChild;
    }

    disconnectedCallback() {
        console.log("Parent - DisconnectedCallback");
    }
}