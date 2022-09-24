import { LightningElement, api } from 'lwc';

export default class SliderComponent extends LightningElement {
range = 50;

@api 
resetSlider(){
    this.range = 50;
}

slideChange(event){
    this.range = event.target.value;
}

}