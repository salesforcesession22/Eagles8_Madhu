import { LightningElement } from 'lwc';

export default class ModalParent extends LightningElement {
    showModal = false;

    modalHandler(){
        this.showModal = true;
    }

    closeHandler(){
        this.showModal = false;
    }
}