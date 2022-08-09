import { LightningElement } from 'lwc';

export default class HelloWorld extends LightningElement {

    name;
    fullname = "Salesforce Developer";
    age = 30;
    location = {
        city: "Houston",
        country: "United States",
        postalCode: "78240"
    };
    fruits = ["Orange","Banana","Apple","Grape"];

    num1 = 10;
    num2 = 20;
    num3 = this.num1 + this.num2;

    sum(num1,num2){
        this.fullname = "";
        return num1+num2;
    }

    convertToUpperCase(fullname){
        return this.fullname = fullname.toUpperCase();
    }



}