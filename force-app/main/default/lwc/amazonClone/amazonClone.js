import { LightningElement, api } from 'lwc';

export default class AmazonClone extends LightningElement 
{
    email;
    password;
    handleUserName(event)
    {
        this.email=event.target.value;
    }
    handlePasswordChange(event)
    {
        this.password=event.target.value;
    }
    handleLogin()
    {
        console.log('Inside Login');
        console.log('Email Value: ',this.email);
        console.log('PAssword: ', this.password);
    }
}