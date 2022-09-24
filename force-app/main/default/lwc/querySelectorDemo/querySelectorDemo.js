import { LightningElement } from 'lwc';

export default class QuerySelectorDemo extends LightningElement {
    fruits = ["Banana", "Orange", "Apple", "Mango"];

    clickHandler() {
        //querySelector demo
        const elem = this.template.querySelector('h1');
        console.log(elem.innerText);
        elem.style.backgroundColor = "yellow";
        elem.style.border = "2px solid green";

        //querySelectorAll demo
        const elems = this.template.querySelectorAll('.child');
        elems.forEach(item => {
            console.log(item.innerText);
            item.style.color = "red";
            item.setAttribute("class", "slds-align_absolute-center");
            item.style.border = "3px solid green";
        });

        //lightning button
        const elembutton = this.template.querySelector('lightning-button');
        elembutton.setAttribute("variant", "brand");
    }
}