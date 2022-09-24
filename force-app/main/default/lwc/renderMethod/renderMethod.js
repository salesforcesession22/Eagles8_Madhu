import { LightningElement } from 'lwc';
import loginTemplate from './loginTemplate.html';
import signupTemplate from './signupTemplate.html';
import renderTemplate from './renderMethod.html';

export default class RenderMethod extends LightningElement {
    selectedOption;

    render() {
        return this.selectedOption === "Login" ? loginTemplate
            : this.selectedOption === "Signup" ? signupTemplate
            : renderTemplate;
    }

    clickHandler(event) {
        this.selectedOption = event.target.label;
    }
}

/*
//ternary operator/condition
if(length == 4) {
    outcome = "4";
} else {
    outcome = "other"
}

outcome = (length==4) ? "4" : "other";

if(length == 4) {
    //block 4
} else if(length == 5) {
    //block 5
} else if(length == 6) {
    //block 6
} else {
    //other block
}

outcome = (length==4) ? "4" : (length==5) ? "5" : (length==6) ? "6" : "other";
*/