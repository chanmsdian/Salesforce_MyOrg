public class CompanyDetails {
    public String companyName;
    public String ceo;
    public Long revenue;
    
   private List<Client> customers = new List<Client>();
    
    public void addCustomers(String custName, String custLocation, Long contactNumber)
    {
        Client customer = new Client(custName,custLocation,contactNumber);
        customers.add(customer);
    }
    public void printCustomers()
    {
        for(Client customer : customers)
        {
            System.debug('Customer Name :'+customer.custName+', Customer Location :'+customer.custLocation+', Contact Number :'+customer.contactNumber);
        }
    }
    
    
    private class Client {
        public String custName;
        public String custLocation;
        public Long contactNumber;
        client(String custName, String custLocation, Long contactNumber)
        {
            this.custName=custName;
            this.custLocation=custLocation;
            this.contactNumber=contactNumber;
        }
    }

}