# Bank Card Management System

## Overview
This project is a Java-based Bank Card Management System developed using Object-Oriented Programming OOP principles. The system includes three classes BankCard, DebitCard, and CreditCard, with functionalities for handling banking operations like withdrawals and credit limits. 

## Features
- BankCard Class
  - Stores card details such as card ID, client name, issuer bank, bank account, and balance amount.
  - Provides methods to set and retrieve client information and balance.
  - Displays card details.

- DebitCard Class Subclass of BankCard
  - Includes attributes such as PIN number, withdrawal amount, date of withdrawal, and transaction status.
  - Provides a withdrawal method that checks the PIN and available balance before processing a transaction.
  - Displays transaction details if a withdrawal has occurred.

- CreditCard Class Subclass of BankCard
  - Includes attributes such as CVC number, credit limit, interest rate, expiration date, and grace period.
  - Allows setting credit limits based on balance constraints.
  - Provides a method to cancel a credit card if outstanding dues are cleared.
  - Displays credit card details only if credit is granted.

## Technologies Used
- Programming Language Java
- IDE BlueJ
- Object-Oriented Principles Inheritance, Encapsulation, Polymorphism, and Abstraction

## Deliverables
- BankCard.java, DebitCard.java, and CreditCard.java source files.

## Conclusion
This project successfully demonstrates the implementation of OOP principles in Java through a bank card management system. By developing and testing the BankCard, DebitCard, and CreditCard classes, we have applied key concepts such as inheritance, encapsulation, and polymorphism. The project provided valuable hands-on experience in designing and structuring Java classes, handling real-world banking operations, and managing user transactions securely. Challenges such as ensuring correct withdrawal and credit limit functionality were overcome through systematic debugging and testing. Overall, this coursework reinforced the importance of OOP principles in software development.