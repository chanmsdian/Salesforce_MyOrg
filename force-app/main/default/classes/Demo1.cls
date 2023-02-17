public class Demo1 
{
    public void mainValueMethod()
    {
    String webUrl = 'www.google.com';
    System.debug('Before value call' + webUrl);
    passByValmethod(webUrl);
    System.debug('After value call' + webUrl);
    }
    public void passByValmethod(String websiteUrl)
    {
        websiteUrl='www.apexhours.com';
    }
  	
        
}