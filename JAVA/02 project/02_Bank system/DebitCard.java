package coursework1;
public class DebitCard extends BankCard
{
    private int pinNumber; 
    private int withdrawalAmount;
    private String dateOfWithdrawal;
    private boolean hasWithdrawn;
    //making constructor that has six parameters
    public DebitCard(int cardId,String bankAccount,int balanceAmount,String issuerBank,String clientName,int pinNumber)
    {
        super(cardId,bankAccount,balanceAmount,issuerBank);
        setClientName(clientName);
        this.withdrawalAmount=0;
        this.dateOfWithdrawal="";
        this.pinNumber=pinNumber;
        this.hasWithdrawn=false;
    }
    //making accessor method of DebitCard class instance variable
    public int getPinNumber()
    {
        return this.pinNumber;
    }
    public int getWithdrawalAmount()
    {
        return this.withdrawalAmount;
    }
    public String getDateOfWithdrawal()
    {
        return this.dateOfWithdrawal;
    }
    public boolean getHasWithdrawn()
    {
        return this.hasWithdrawn;
    }
    //Mutator method for withdrawlAmount
    public void setWithdrawalAmount(int withdrawalAmount)
    {
        this.withdrawalAmount=withdrawalAmount;
    }
    //making method withdraw
    public void withdraw(int withdrawalAmount,int pinNumber,String dateOfWithdrawal)
    {
        if(this.pinNumber!=pinNumber){
            System.out.println("You have entered wrong pin number,please enter valid pin number and try again");
        }
        else{
            if(super.getBalanceAmount()>=withdrawalAmount){
            this.dateOfWithdrawal=dateOfWithdrawal;
            this.hasWithdrawn=true;
            setWithdrawalAmount(withdrawalAmount);
            setBalanceAmount(super.getBalanceAmount()-withdrawalAmount);
            }
            else{
            System.out.println("You don't have sufficient balance,sorry we can't process your transaction and Your current balance amount is "+super.getBalanceAmount()); 
            }
        }
    }
    @Override
    //making display non return type method which is override with BankCard class display method
        public void display()
        {
            if(this.hasWithdrawn==true){
                super.display();
                System.out.println("Your pin number of debitcard is "+this.pinNumber);
                System.out.println("Your amount is withdrawan at "+this.dateOfWithdrawal);
                System.out.println("The withdrawal amount is "+this.withdrawalAmount);
            }
            else{
                System.out.println("Your current balance amount is "+super.getBalanceAmount());
            }
        }
}

 
