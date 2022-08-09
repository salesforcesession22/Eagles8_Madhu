import { LightningElement, track } from 'lwc';

export default class HomeworkBasics1 extends LightningElement { 
    @track name = "Madhu";
    @track age=31;
    course = ["Admin","Apex","Web Development","LWC"];

    instructor = {
        firstname : "Bala",
        lastname : "Krishna"
    };

    get fullname(){
        return this.instructor.firstname + this.instructor.lastname;
    }
    get courseValue(){
        return this.course[3];
    }
    handleChangeName(event){
        this.name = event.target.value;             
    }
    handleChangeAge(event){
        this.age = event.target.value;      
    }
}