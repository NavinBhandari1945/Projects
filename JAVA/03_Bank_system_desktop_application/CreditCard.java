package JAVACoursework2;


/**
 * Write a description of class CreditCard here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class CreditCard extends BankCard
{
    private int cvcNumber;
    private double creditLimit;
    private double interestRate;
    private String expirationDate;
    private int gracePeriod;
    private boolean isGranted;
    //making constructor of class CreditCard
    public CreditCard(int cardId,String bankAccount,int balanceAmount,String clientName,String issuerBank,int cvcNumber,
    double interestRate,String expirationDate)
    {
        super(cardId,bankAccount,balanceAmount,issuerBank);
        setClientName(clientName);
        this.cvcNumber=cvcNumber;
        this.interestRate=interestRate;
        this.expirationDate=expirationDate;
        this.isGranted=false;
    }
    //making accessor method of all instance variable of CreditClass
    public int getCvcNumber()
    {
        return this.cvcNumber;
    }   
    public double getCreditLimit()
    {
        return this.creditLimit;
    }   
    public double getInterestRate()
    {
        return this.interestRate;
    }   
    public String getExpirationDate()
    {
        return this.expirationDate;
    }   
    public int getGracePeriod()
    {
        return this.gracePeriod;
    }   
    public boolean getIsGranted()
    {
        return this.isGranted;
    }   
    //making mutator method for creditLimit variable
    public void setCreditLimit(double newCreditLimit,int newGracePeriod)
    {
        if(newCreditLimit<=2.5*super.getBalanceAmount()){
            this.creditLimit=newCreditLimit;
            this.gracePeriod=newGracePeriod;
            this.isGranted=true;
            System.out.println("Your credit limit has been set.");
        }
        else{
            System.out.println("Sorry we cannot issued your credit limit");
        }
    }
    //making method to cancel credit card of client
    public void cancelCreditCard()
    {
        this.cvcNumber=0;
        this.creditLimit=0;
        this.gracePeriod=0;
        this.isGranted=false;
        System.out.println("Your credit card has been cancel");
    }
    //making method display of class CreditCard 
    @Override
    public void display()
    {
        System.out.println("Your interest rate is "+this.interestRate);
        System.out.println("Your credit card expired date is "+this.expirationDate);
        if(this.isGranted==true){
            super.display();
            System.out.println("Your cvc number is "+this.cvcNumber);
            System.out.println("Your credit card limit is "+this.creditLimit);
            System.out.println("Your grace period is "+this.gracePeriod);
        }
    }
}
