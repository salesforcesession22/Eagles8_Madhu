import { LightningElement } from 'lwc';

export default class RenderedCallbackDemo extends LightningElement {
    name = "World";

    changeHandler(event) {
        this.name = event.target.value;
    }

    renderedCallback() {
        console.log("RenderedCallback has been called!");
    }
}