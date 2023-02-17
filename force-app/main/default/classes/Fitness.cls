public class Fitness {
public Decimal BMI=0;
public Decimal Pace=0;
Public Decimal calculateBMI(Decimal bodyWeight, Decimal Height)
{
    if(bodyWeight <=0 || Height<=0)
    {
        BMI = -1;//-1 is considered as Invalid
    }
    else{
    BMI = Math.round(bodyWeight/(Math.sqrt(Height)));
    
    }
    return BMI;
}
Public Decimal calculatePace(Decimal kilometerCovered, Decimal timeInMin)
{
    if(kilometerCovered <=0 || timeInMin <=0)
    {
        Pace = -1;//-1 is considered as Invalid
    }
    else
    {
        pace = kilometerCovered / timeInMin;
    }    
    return pace;
}
}