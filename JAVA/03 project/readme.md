Bank Card Management System (GUI Version)  

Overview  
This project extends the previously developed Bank Card Management System by introducing a Graphical User Interface (GUI) using Java Swing. The system allows users to store and manage bank card details using an ArrayList and provides functionalities for adding debit and credit cards, withdrawing funds, setting credit limits, and canceling credit cards. 
Features  

1. BankCard Class (Base Class)  
- Stores card details such as Card ID, Client Name, Issuer Bank, Bank Account, and Balance Amount.  
- Provides methods to set and retrieve client information and balance.  
- Displays card details.  

2. DebitCard Class (Inherits from BankCard)  
- Includes attributes such as PIN number, Withdrawal Amount, Date of Withdrawal, and Transaction Status.  
- Allows withdrawals only if the correct PIN and sufficient balance are provided.  
- Displays transaction details after a withdrawal.  

3. CreditCard Class (Inherits from BankCard)  
- Stores attributes like CVC number, Credit Limit, Interest Rate, Expiration Date, and Grace Period.  
- Allows setting credit limits based on balance constraints.  
- Provides a method to cancel a credit card if all outstanding dues are cleared.  
- Displays credit card details only if a credit limit has been granted.  

4. BankGUI Class (Graphical User Interface)  
- Implements a Java Swing-based UI for managing bank cards.  
- Stores an ArrayList of BankCard objects, supporting both DebitCard and CreditCard types.  
- Provides input fields for:  
  - Card ID, Client Name, Issuer Bank, Bank Account, Balance Amount  
  - PIN Number, Withdrawal Amount, CVC Number, Credit Limit, Interest Rate, Grace Period  
  - Dropdowns for Withdrawal Date and Expiration Date  
- Includes buttons to:  
  - Add Debit Card  
  - Add Credit Card  
  - Withdraw from Debit Card  
  - Set Credit Limit  
  - Cancel Credit Card  
  - Display Card Information  
  - Clear Input Fields  
- Implements error handling using try-catch blocks to manage incorrect user input.  

Technologies Used  
- Programming Language: Java  
- GUI Framework: Swing  
- IDE: BlueJ  
- Object-Oriented Principles: Inheritance, Encapsulation, Polymorphism, and Abstraction  

Deliverables  
- Source Files: BankCard.java, DebitCard.java, CreditCard.java, and BankGUI.java.  

Conclusion  
This project successfully integrates a user-friendly GUI to manage debit and credit cards while demonstrating key OOP concepts. It enhances usability by allowing users to interact with banking features visually. Challenges such as validations, error handling, and user interactions were tackled effectively. This project serves as a practical learning experience in Java GUI development and Object-Oriented Programming.  