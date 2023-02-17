public class Assignment1 
{
    public Integer i=1;
    public Integer Sum=0;
	public List<Integer> numbers = new List<Integer>();
    public void addNum()
    {
      while (i<=20)
    {        
        numbers.add(i);
        i++;
    }
       for(Integer a: numbers)  
       {
           if(Math.mod(a, 2)==0)
           {
               Sum+=a;
           }
       }
        System.debug('The sum of the numbers in even position:' + Sum);
    }

}