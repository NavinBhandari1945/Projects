package JAVACoursework2;


public class BankCard
{
    //declaration of five attributes
   private int cardId;
   private String bankAccount;
   private int balanceAmount;
   private String clientName;
   private String issuerBank;
   /*making paramaterized constructor of BankCard class that has four formal parameters which assign value to respective four attributes*/
   public BankCard(int cardId,String bankAccount,int balanceAmount,String issuerBank)
   {
       this.cardId=cardId;
       this.bankAccount=bankAccount;
       this.balanceAmount=balanceAmount;
       this.issuerBank=issuerBank;
       this.clientName="";
   }
   //creating accessor method for all BankCard class instance variable.
   public int getCardId()
   {
       return this.cardId;
   }
   
   public String getBankAccount()
   {
       return this.bankAccount;
   }
   
   public int getBalanceAmount()
   {
       return this.balanceAmount;
   }
   
   public String getIssuerBank()
   {
       return this.issuerBank;
   }
   
   public String getClientName()
   {
       return this.clientName;
   }
   //making mutator method to assign value to clientName attribute;
   public  void setClientName(String clientName)
   {
       this.clientName=clientName;
   }
   //making mutator method for balanceAmount
   public void setBalanceAmount(int balanceAmount)
   {
       this.balanceAmount=balanceAmount;
   }
   //making non return type method to display output according to condition
   public void display(){
       if(this.clientName==""){
           System.out.println("clientName is not set yet");
       }
       else{
       System.out.println("Your cardid is "+this.cardId);
       System.out.println("Your bank account number is "+this.bankAccount);
       System.out.println("Your current balance amount is "+this.balanceAmount);
       System.out.println("Your respective bank name is "+this.issuerBank);
       System.out.println("Your registered name is "+ this.clientName);
       }
   }
}
