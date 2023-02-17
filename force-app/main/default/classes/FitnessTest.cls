@isTest
public class FitnessTest {
    
    @isTest public static void calculateBMITest()
        {
            Fitness fitOne = new Fitness();
            System.assertEquals(26, fitOne.calculateBMI(60,5.3), 'Values does not match');
            
            System.assertEquals(2.5, fitOne.calculatePace(5,2), 'Values does not match');
        }

}