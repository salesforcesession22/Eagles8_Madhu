import { LightningElement } from 'lwc';

export default class P2cCallingCMethodP1 extends LightningElement {

    clickHandler(){
        //To instantiate the child component and call the emthod
        this.template.querySelector('c-slider-component').resetSlider();
    }
}