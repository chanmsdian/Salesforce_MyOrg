@isTest
public class ContactUpdateTest {
    static testMethod void testTrigger() {
        Account testAccount = new Account(Name='Chan Account', BillingCity='Chennai');
        insert testAccount;
        Contact testContact = new Contact(LastName='Test', MailingCity='Madurai', AccountId=testAccount.Id);
        insert testContact;
        testAccount.BillingCity = 'Pondy';
        update testAccount;
        Contact updatedContact = [SELECT MailingCity FROM Contact WHERE Id = :testContact.Id];
        System.assertEquals(updatedContact.MailingCity, 'Pondy');
    }
}