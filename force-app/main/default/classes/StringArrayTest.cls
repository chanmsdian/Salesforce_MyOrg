public class StringArrayTest 
{
	public static List<String> generateStringArray(Integer N)
    {
        List<String> returnList = new List<String>();
        for(Integer i =0; i<N;i++)
        {
           returnList.add('Test '+i); 
        }
        return returnList;
    }

}