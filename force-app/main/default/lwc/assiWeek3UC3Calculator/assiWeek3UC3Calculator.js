import { LightningElement,track } from 'lwc';

export default class AssiWeek3UC3Calculator extends LightningElement {

    @track sum;
    @track num1;
    @track num2;

    handleAdd(event){
        if(event.target.name == "input1"){
            this.num1 = event.target.value;
        }
        if(event.target.name == "input2"){
            this.num2 = event.target.value;
        }
        if(this.num1 == undefined || this.num2 == undefined){
            this.sum = 0;
        }else{
            this.sum = Number(this.num1) + Number(this.num2);
        }
    }

}