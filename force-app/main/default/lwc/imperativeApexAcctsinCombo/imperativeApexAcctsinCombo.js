import { LightningElement, wire, track } from 'lwc';
import getAllAccounts from '@salesforce/apex/accountHandlerLWC.getAllAccounts';
import countContacts from '@salesforce/apex/accountHandlerLWC.countContacts';
/*
UC:
Get all the accounts and display them as combo box options. 
Every time, we make an account selection, display the number of contacts available on that account
SOLUTION DESIGN:
1. Write an apex method to get all the accounts
2. take that accounts and prepare combo box options (label: "", value: "")
3. using those combo box options, we can display a combo box
4. Every time there is a selection of combo box options, get the value (account id)
5. we can pass that account id to an apex method, get the number of contacts on that acc.
6. get it and display the same
*/

export default class ImperativeApexAcctsinCombo extends LightningElement {
    selectedAccount;
    accountOptions = [];
    @track contactsSize;

    @wire(getAllAccounts)
    //data =>Account records
    accountHandler({data,error}){
        if(data){
            console.log(data);
            this.accountOptions = this.picklistGenerator(data);
            console.log(this.accountOptions);
        }
        if(error){
            console.error(error);
        }

    }

    //data- List of Accounts
    //Acc1, label :Account1 / value - 0018.....
    //Acc2, label :Account2 / value -0009991....
    //Acc1 - name,id
    //Acc2- name,type
    picklistGenerator(data){
        //Arrow function .map
        return data.map(item => ({
            label: item.Name,
            value: item.id
        }))
    }

    changeHandler(event){
        this.selectedAccount = event.target.value;
        countContacts({accId: this.selectedAccount})
        .then(result => {
            console.log(result);
            this.contactsSize = result;
        })
        .catch(error => {
            console.log(error);
        })
    }
}