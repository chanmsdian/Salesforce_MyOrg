public class PizzaProblem {
final Integer ONE_SLICE = 8;
final Integer TWO_SLICE = 7;
final Integer MORE_THAN_2_SLICE = 6;
    
    Public Integer getBill(Integer numSlice)
    {
        Integer TotalAmount  = numSlice == 1 ? numSlice*ONE_SLICE 
            					: numSlice == 2 ? numSlice*TWO_SLICE 
                                   : numSlice >2 ?numSlice*MORE_THAN_2_SLICE
                                       : 0;
        
        return TotalAmount;
    }
}