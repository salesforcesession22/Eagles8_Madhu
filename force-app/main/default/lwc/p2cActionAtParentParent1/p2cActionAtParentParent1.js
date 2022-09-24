import { LightningElement } from 'lwc';

export default class P2cActionAtParentParent1 extends LightningElement {

    progressValue;
    barSize;

    get barOptions() {
        return [
            {label: "small", value: "small"},
            {label: "medium", value: "medium"},
            {label: "large", value: "large"}
        ];
    }

    changeHandler(event) {
        if(event.target.name === "Bar Size") {
            this.barSize = event.target.value;
        } else {
            this.progressValue = event.target.value;
        }
    }
}