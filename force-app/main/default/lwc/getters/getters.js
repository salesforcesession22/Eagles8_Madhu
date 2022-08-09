import { LightningElement } from 'lwc';

export default class Getters extends LightningElement {
    fruits = ["Orange","Apple","Fig"];
    num1=30;
    num2=20;

    get firstFruit(){
        return this.fruits[0];
    }

    get sumOfNums(){
        return this.num1 + this.num2;
    }

    get subOfNums(){
        return this.num1 - this.num2;
    }

    get multiplyOfNums(){
        return this.num1 * this.num2;
    }

    get divOfNums(){
        return this.num1 / this.num2;
    }
}