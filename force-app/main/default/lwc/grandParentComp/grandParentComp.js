import { LightningElement } from 'lwc';

export default class GrandParentComp extends LightningElement {

    showHandler(event) {
        console.log("Grand Parent Comp: onshow event in c-parent-comp");
        console.log(event.target.nodeName);
        console.log(event.currentTarget.nodeName);
    }
    
}