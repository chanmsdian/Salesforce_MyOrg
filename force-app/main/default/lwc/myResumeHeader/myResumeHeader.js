import { LightningElement, api } from 'lwc';

export default class MyResumeHeader extends LightningElement 
{
    @api socialDetails;
    @api profileImg;
    @api userDetails;

    get phoneLink()
    {
        return `tel:${this.userDetails.PHONE}`;
    }
    get emailLink()
    {
        return `mailto:${this.userDetails.EMAIL}`;
    }
}