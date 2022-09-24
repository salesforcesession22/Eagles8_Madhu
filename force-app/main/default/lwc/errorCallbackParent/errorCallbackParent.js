import { LightningElement } from 'lwc';

export default class ErrorCallbackParent extends LightningElement {
    errorCallback(error, stack) {
        console.log("Parent - ErrorCallback");
        console.log(error.message);
        console.log(stack);
    }
}