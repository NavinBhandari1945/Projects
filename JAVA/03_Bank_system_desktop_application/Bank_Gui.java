package JAVACoursework2;

import java.awt.*;
import javax.swing.*;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.TitledBorder;
import javax.swing.JButton;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;

public class Bank_Gui{

    private JFrame bankframe,debitframe,creditframe;
    private JPanel bankpanel,debitpanel,creditpanel;

    private JLabel cardId_jlb,bankAccount_jlb,balanceAmount_jlb,clientName_jlb,issuerBank_jlb;
    private JTextField cardId_tfb,bankAccount_tfb,balanceAmount_tfb,clientName_tfb,issuerBank_tfb;
    private JButton b_debitShow,b_creditShow,b_clear;

    private JLabel cardId_jld,withdrawalAmount_jld,pinNumber_jld,withdrawalDate_jld;
    private JTextField cardID_tfd, withdrawalAmount_tfd,pinNumber_tfd;
    private JComboBox d_year,d_month,d_day;
    private JButton d_display,d_clear,d_withdraw,d_back,d_add;

    private JLabel cardId_jlc,cvcNumber_jlc,creditLimit_jlc,interestRate_jlc,gracePeriod_jlc,expirationDate_jlc;
    private JTextField cardId_tfc,cvcNumber_tfc,creditLimit_tfc,interestRate_tfc,gracePeriod_tfc;
    private JComboBox c_year,c_month,c_day;
    private JButton c_back,c_clear,c_display,c_add,c_setCreditLimit,c_cancelCreditCard;

    //creating arraylist of bank card generic type
    ArrayList<BankCard> arraylist_obj_b=new ArrayList<BankCard>();

    //getter method of bank card panel component
    public int getCardId_b()
    {
        String cardId_tfb_result_s=cardId_tfb.getText().trim();
        int cardId_tfb_result_i=0;
        try
        {
            cardId_tfb_result_i=Integer.parseInt(cardId_tfb_result_s);
            if(cardId_tfb_result_i<=0){
                JOptionPane.showMessageDialog(bankpanel,"Please fill the cardid input field of bank greater than 0.","Check Inputed Data",JOptionPane.ERROR_MESSAGE);
            }
            
        }
        catch(Exception cardId_b_exception_o)
        {
            JOptionPane.showMessageDialog(bankpanel,"Please fill the card id  input field of bank with integer","Check Inputed Data",JOptionPane.ERROR_MESSAGE);
        }
        return cardId_tfb_result_i;
    }
    public String getBankAccount_b()
    {
        if( bankAccount_tfb.getText().trim().isEmpty())
        {
            JOptionPane.showMessageDialog(bankpanel,"The input field of bank account in bank card must not be empty","Check Inputed Data",JOptionPane.ERROR_MESSAGE);
        }
        return bankAccount_tfb.getText().trim();       
    }
    public int getBalanceAmount_b()
    {
        String balanceAmount_tfb_rsult_s=balanceAmount_tfb.getText().trim();
        int balanceAmount_tfb_rsult_i=0;
        try{
            if(balanceAmount_tfb_rsult_s.isEmpty())
            {
                 balanceAmount_tfb_rsult_i=-1;
            }
            balanceAmount_tfb_rsult_i=Integer.parseInt(balanceAmount_tfb_rsult_s);
            if(balanceAmount_tfb_rsult_i<0)
            {
                JOptionPane.showMessageDialog(bankpanel,"Please fill the balance Amount input field of bank not less than 0.","Check Inputed Data",JOptionPane.ERROR_MESSAGE);
            } 
        }
        catch(Exception balanceAmount_b_exception_o)
        {
            balanceAmount_tfb_rsult_i=-1;
            JOptionPane.showMessageDialog(bankpanel,"Please fill the balance amount input field of bank with integer","Check Inputed Data",JOptionPane.ERROR_MESSAGE);
        }
        return balanceAmount_tfb_rsult_i;
    }
    public String getClientName_b()
    {
        if( clientName_tfb.getText().trim().isEmpty()){
            JOptionPane.showMessageDialog(bankpanel,"The input field of clientname in bank card must not be empty","Check Inputed Data",JOptionPane.ERROR_MESSAGE);
        }
        return clientName_tfb.getText().trim();
    }
    public String getIssuerBank_b()
    {
        if( issuerBank_tfb.getText().trim().isEmpty())
        {
            JOptionPane.showMessageDialog(bankpanel,"The input field of issuer Bank in bank card must not be empty","Check Inputed Data",JOptionPane.ERROR_MESSAGE);
        }
        return issuerBank_tfb.getText().trim();
    }
    //getter method of debit card panel componenet
    public int getCardId_d()
    {
        String cardID_tfd_result_s=cardID_tfd.getText().trim();
        int cardID_tfd_result_i=0;
        try{
            cardID_tfd_result_i=Integer.parseInt(cardID_tfd_result_s);
            if(cardID_tfd_result_i<=0){
                JOptionPane.showMessageDialog(bankpanel,"Please fill the card id input field of debit  greater than 0.","Check Inputed Data",JOptionPane.ERROR_MESSAGE);
            } 
        }
        catch(Exception cardId_d_exception_o)
        {
            JOptionPane.showMessageDialog(bankpanel,"Please fill the card id input field of debit with integer","Check Inputed Data",JOptionPane.ERROR_MESSAGE);
        }
        return cardID_tfd_result_i;
    }
    public int getWithdrawalAmount_d()
    {
        String WithdrawalAmount_tfd_result_s=withdrawalAmount_tfd.getText().trim();
        int WithdrawalAmount_tfd_result_i=0;
        try{
            if(WithdrawalAmount_tfd_result_s.isEmpty())
            {
                WithdrawalAmount_tfd_result_i=-1;
            }
            WithdrawalAmount_tfd_result_i=Integer.parseInt(WithdrawalAmount_tfd_result_s);
            if(WithdrawalAmount_tfd_result_i<=0)
            {
                JOptionPane.showMessageDialog(bankpanel,"Please fill the withdrawalamount input field of debit greater than 0.","Check Inputed Data",JOptionPane.ERROR_MESSAGE);
            } 
        }catch(Exception withdrawalAmount_d_exception_o)
        {
            JOptionPane.showMessageDialog(bankpanel,"Please fill the withdrawalamount input field of debit  with integer","Check Inputed Data",JOptionPane.ERROR_MESSAGE);
        }
        return WithdrawalAmount_tfd_result_i;
    }
    public int getPinNumber_d()
    {
        String pinNumber_tfd_result_s=pinNumber_tfd.getText().trim();
        int pinNumber_tfd_result_i=0;
        try{
            pinNumber_tfd_result_i=Integer.parseInt(pinNumber_tfd_result_s);
            if(pinNumber_tfd_result_i<=0)
            {
                JOptionPane.showMessageDialog(bankpanel,"Please fill the pin number input field of debit greater than 0.","Check Inputed Data",JOptionPane.ERROR_MESSAGE);
            } 
        }catch(Exception pinNumber_d_exception_o)
        {
            JOptionPane.showMessageDialog(bankpanel,"Please fill the pin number  input field of debit with integer","Check Inputed Data",JOptionPane.ERROR_MESSAGE);
        }
        return pinNumber_tfd_result_i;
    }
    public String getD_year()
    {
        String d_year_r=(String)d_year.getSelectedItem();
       if(d_year_r.isEmpty() || d_year_r.equals("Year")){
        JOptionPane.showMessageDialog(debitpanel,"Please select the appropriate year","Check Inputed Data",JOptionPane.ERROR_MESSAGE);
       }
        return d_year_r;
    }
    public String getD_month()
    {
        String d_month_r=(String)d_month.getSelectedItem();
        if(d_month_r.isEmpty() || d_month_r.equals("Month")){
            JOptionPane.showMessageDialog(debitpanel,"Please select the appropriate month","Check Inputed Data",JOptionPane.ERROR_MESSAGE);
           }

        return d_month_r;
    }
    public String getD_day()
    {
        String d_day_r=(String)d_day.getSelectedItem();
        if(d_day_r.isEmpty() || d_day_r.equals("Day")){
            JOptionPane.showMessageDialog(debitpanel,"Please select the appropriate day","Check Inputed Data",JOptionPane.ERROR_MESSAGE);
           }
        return d_day_r;
    }
    //withdraw date getter method
    public String getWithdrawDate()
    {
        String withdrawdate_d=getD_year()+"-"+getD_month()+"-"+getD_day();
        return withdrawdate_d;
    }
    //getter method of credit card panel component
    public int getCardId_c()
    {
        String cardId_tfc_result_s=cardId_tfc.getText().trim();
        int cardId_tfc_tfd_result_i=0;
        try{
            cardId_tfc_tfd_result_i=Integer.parseInt(cardId_tfc_result_s);
            if(cardId_tfc_tfd_result_i<=0)
            {
                JOptionPane.showMessageDialog(bankpanel,"Please fill the card id input field of credit greater than 0.","Check Inputed Data",JOptionPane.ERROR_MESSAGE);
            } 
        }catch(Exception cardId_c_exception_o)
        {
            JOptionPane.showMessageDialog(bankpanel,"Please fill the card id  input field of credit with integer","Check Inputed Data",JOptionPane.ERROR_MESSAGE);
        }
        return cardId_tfc_tfd_result_i;
    }
    public int getCvcNumber_c()
    {
        String cvcNumber_tfc_result_s=cvcNumber_tfc.getText().trim();
        int cvcNumber_tfc_tfd_result_i=0;
        try{
            cvcNumber_tfc_tfd_result_i=Integer.parseInt(cvcNumber_tfc_result_s);
            if(cvcNumber_tfc_tfd_result_i<=0)
            {
                JOptionPane.showMessageDialog(bankpanel,"Please fill the cvc number input field of credit greater than 0.","Check Inputed Data",JOptionPane.ERROR_MESSAGE);
            } 
        }catch(Exception cvcNumber_c_exception_o)
        {
            JOptionPane.showMessageDialog(bankpanel,"Please fill the cvc number  input field of credit with integer","Check Inputed Data",JOptionPane.ERROR_MESSAGE);
        }
        return cvcNumber_tfc_tfd_result_i ;
    }
    public int getCreditLimit_c()
    {
        String creditLimit_tfc_result_s=creditLimit_tfc.getText().trim();
        int creditLimit_tfc_tfd_result_i=0;
        try{
            if(creditLimit_tfc_result_s.isEmpty())
            {
                creditLimit_tfc_tfd_result_i=-1;

            }
            creditLimit_tfc_tfd_result_i=Integer.parseInt(creditLimit_tfc_result_s);
            if(creditLimit_tfc_tfd_result_i<0)
            {
                JOptionPane.showMessageDialog(bankpanel,"Please fill the credit limit input field of credit not less than 0","Check Inputed Data",JOptionPane.ERROR_MESSAGE);
            } 
        }catch(Exception creditLimit_c_exception_o)
        {
            creditLimit_tfc_tfd_result_i=-1;
            JOptionPane.showMessageDialog(bankpanel,"Please fill the credit limit  input field of credit with integer","Check Inputed Data",JOptionPane.ERROR_MESSAGE);
        }

        return creditLimit_tfc_tfd_result_i;
    }
    public int getInterestRate_c()
    {
        String interestRate_tfc_result_s=interestRate_tfc.getText().trim();
        int interestRate_tfc_result_i=0;
        try{
            if(interestRate_tfc_result_s.isEmpty())
            {
                interestRate_tfc_result_i=-1;

            }
            interestRate_tfc_result_i=Integer.parseInt(interestRate_tfc_result_s);
            if(interestRate_tfc_result_i<0)
            {
                JOptionPane.showMessageDialog(bankpanel,"Please fill the interest rate input field of credit not less than 0","Check Inputed Data",JOptionPane.ERROR_MESSAGE);
            } 
        }catch(Exception interestRate_c_exception_o)
        {
            interestRate_tfc_result_i=-1;
            JOptionPane.showMessageDialog(bankpanel,"Please fill the interest rate  input field of credit with integer","Check Inputed Data",JOptionPane.ERROR_MESSAGE);
        }

        return interestRate_tfc_result_i;
    }
    public int getGracePeriod_c()
    {
        String gracePeriod_tfc_result_s=gracePeriod_tfc.getText().trim();
        int gracePeriod_tfc_result_i=0;
        try{
            if(gracePeriod_tfc_result_s.isEmpty())
            {
                gracePeriod_tfc_result_i=-1;
            }
            gracePeriod_tfc_result_i=Integer.parseInt(gracePeriod_tfc_result_s);
            if(gracePeriod_tfc_result_i<0)
            {
                JOptionPane.showMessageDialog(bankpanel,"Please fill the grace period input field of credit not less than 0","Check Inputed Data",JOptionPane.ERROR_MESSAGE);
            } 
        }catch(Exception gracePeriod_c_exception_o)
        {
            gracePeriod_tfc_result_i=-1;
            JOptionPane.showMessageDialog(bankpanel,"Please fill the grace period  input field of credit with integer","Check Inputed Data",JOptionPane.ERROR_MESSAGE);
        }
        return gracePeriod_tfc_result_i;
    }
    public String getC_year()
    {
        String c_year_r=(String)c_year.getSelectedItem();
        if(c_year_r.isEmpty() || c_year_r.equals("Year"))
        {
            JOptionPane.showMessageDialog(debitpanel,"Please select the appropriate year","Check Inputed Data",JOptionPane.ERROR_MESSAGE);
           }
        return c_year_r;
    }
    public String getC_month()
    {
        String c_month_r=(String)c_month.getSelectedItem();
        if(c_month_r.isEmpty() || c_month_r.equals("Month"))
        {
            JOptionPane.showMessageDialog(debitpanel,"Please select the appropriate month","Check Inputed Data",JOptionPane.ERROR_MESSAGE);
           }
        return c_month_r;
    }
    public String getC_day()
    {
        String c_day_r=(String)c_day.getSelectedItem();
        if(c_day_r.isEmpty() || c_day_r.equals("Day"))
        {
            JOptionPane.showMessageDialog(debitpanel,"Please select the appropriate day","Check Inputed Data",JOptionPane.ERROR_MESSAGE);
           }
        return c_day_r;
    }
    //getter method of expiration date
    public String getExpirationDate()
    {
        String expirationdate_c=getC_year()+"-"+getC_month()+"-"+getC_day();
        return expirationdate_c;
    }
    //creating getter method to check unique value of debit cardId
    public boolean getCheckCardId_d()
    {
        boolean found=false;
        for(BankCard b_obj_7:arraylist_obj_b)
        {
            if(b_obj_7 instanceof DebitCard)
            {
                DebitCard d_obj_7=(DebitCard) b_obj_7;
                if(d_obj_7.getCardId()==getCardId_b())
                {
                    found=true;
                }
            }
            else
            {
                found=false;
            }
          
        }
        return found;
    }
    //creating getter method to check unique value of debit cardId
    public boolean getCheckCardId_c()
    {
        
        boolean found=false;
        for(BankCard b_obj_7:arraylist_obj_b)
        {
            if(b_obj_7 instanceof CreditCard)
            {
                CreditCard c_obj_7=(CreditCard) b_obj_7;
                if(c_obj_7.getCardId()==getCardId_b())
                {
                    found=true;
                }
            }
            else
            {
                found=false;
            }
          
        }
        return found;

        //creating constructor of class Bank_Gui
    }
    public Bank_Gui()
    {
        //creating bank card frame 
        bankframe=new JFrame();
        bankframe.setTitle("Bank Card");
        bankframe.setLayout(null);
        bankframe.setSize(600,600);
        bankframe.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        bankframe.setLocationRelativeTo(null);

        //Creating bank panel
        bankpanel=new JPanel();
        bankpanel.setSize(500,500);
        bankpanel.setLocation(50, 25);
        bankpanel.setLayout(null);
        bankpanel.setBackground(Color.GRAY);
        TitledBorder titledBorderbank =BorderFactory.createTitledBorder("Bank card panel");
        titledBorderbank.setTitleJustification(TitledBorder.CENTER);
        bankpanel.setBorder(titledBorderbank);
        bankframe.add(bankpanel);

        //adding component in bank panel

        //cardID
        cardId_jlb=new JLabel("CardId");
        cardId_jlb.setBounds(5,10,150,100);
        cardId_jlb.setFont(new Font("Verdana",Font.BOLD,15));
        bankpanel.add(cardId_jlb);
        cardId_tfb=new JTextField();
        cardId_tfb.setBounds(150,40,200,30);
        bankpanel.add(cardId_tfb);

        //bankAccount
        bankAccount_jlb=new JLabel("BankAccount");
        bankAccount_jlb.setBounds(5,50,150,100);
        bankAccount_jlb.setFont(new Font("Verdana",Font.BOLD,15));
        bankpanel.add(bankAccount_jlb);
        bankAccount_tfb=new JTextField();
        bankAccount_tfb.setBounds(150,80,200,30);
        bankpanel.add(bankAccount_tfb);

        //balanceAmount
        balanceAmount_jlb=new JLabel("BalanceAmount");
        balanceAmount_jlb.setBounds(5,95,150,100);
        balanceAmount_jlb.setFont(new Font("Verdana",Font.BOLD,15));
        bankpanel.add(balanceAmount_jlb);
        balanceAmount_tfb=new JTextField();
        balanceAmount_tfb.setBounds(150,125,200,30);
        bankpanel.add(balanceAmount_tfb);

        //clientName
        clientName_jlb=new JLabel("ClientName");
        clientName_jlb.setBounds(5,140,150,100);
        clientName_jlb.setFont(new Font("Verdana",Font.BOLD,15));
        bankpanel.add(clientName_jlb);
        clientName_tfb=new JTextField();
        clientName_tfb.setBounds(150,170,200,30);
        bankpanel.add(clientName_tfb);

        //issuerBank
        issuerBank_jlb=new JLabel("IssuerBank");
        issuerBank_jlb.setBounds(5,185,150,100);
        issuerBank_jlb.setFont(new Font("Verdana",Font.BOLD,15));
        bankpanel.add(issuerBank_jlb);
        issuerBank_tfb=new JTextField();
        issuerBank_tfb.setBounds(150,215,200,30);
        bankpanel.add(issuerBank_tfb);

        //adding button in bank card pannel

        //bank card panel  show button to open debit card frame
        b_debitShow=new JButton("Debit");
        b_debitShow.setBounds(45, 295, 100, 50);
        b_debitShow.setFocusPainted(false);
        bankpanel.add(b_debitShow);
        b_debitShow.addActionListener(new ActionListener()
         {
            @Override
            public void actionPerformed(ActionEvent b_debitButton)
            {
                String b_debitButtonResult=b_debitButton.getActionCommand();
                if(b_debitButtonResult.equals("Debit"))
                {
                    if(getCardId_b()>0 && getBalanceAmount_b()>-1 && !getBankAccount_b().isEmpty() && !getIssuerBank_b().isEmpty() && !getClientName_b().isEmpty())
                    {
                        bankframe.setVisible(false);
                        debitframe.setVisible(true);

                    }
                    else
                    {
                        JOptionPane.showMessageDialog(bankpanel,"Please provide appropriate data in bank card field to go to debit card","Information",JOptionPane.ERROR_MESSAGE);
                    }
                }
              
            }
        });

        //bank card panel show button to open credit card frame
        b_creditShow=new JButton("Credit");
        b_creditShow.setBounds(350, 295, 100, 50);
        b_creditShow.setFocusPainted(false);
        bankpanel.add(b_creditShow);
        b_creditShow.addActionListener(new ActionListener()
         {
            @Override
            public void actionPerformed(ActionEvent creditButton) 
            {
                String b_creditButtonResult=creditButton.getActionCommand();
                if(b_creditButtonResult.equals("Credit"))
                {
                    if(getCardId_b()>0 && getBalanceAmount_b()>-1 && !getBankAccount_b().isEmpty() && !getIssuerBank_b().isEmpty() && !getClientName_b().isEmpty())
                    {
                        bankframe.setVisible(false);
                        creditframe.setVisible(true);
                    }
                    else
                    {
                        JOptionPane.showMessageDialog(bankpanel,"Please provide appropriate data in bank card field to go to ctredit card","Information",JOptionPane.ERROR_MESSAGE);
                    }        
                }
            }
        });

        //bank card panel clear button
        b_clear=new JButton("Clear");
        b_clear.setBounds(200, 355, 100, 50);
        b_clear.setFocusPainted(false);
        bankpanel.add(b_clear);
        b_clear.addActionListener(new ActionListener()
         {
            @Override
            public void actionPerformed(ActionEvent b_clearButton)
             {
                String b_clearButtonResult=b_clearButton.getActionCommand();
                if(b_clearButtonResult.equals("Clear"))
                {
                    cardId_tfb.setText("");
                    bankAccount_tfb.setText("");
                    balanceAmount_tfb.setText("");
                    clientName_tfb.setText("");
                    issuerBank_tfb.setText("");
                }      
            }
        });
        
        //creating debit card frame 
        debitframe=new JFrame();
        debitframe.setTitle("Debit Card");
        debitframe.setLayout(null);
        debitframe.setSize(700,600);
        debitframe.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        debitframe.setLocationRelativeTo(null);

        //creating debit card panel
        debitpanel=new JPanel();
        debitpanel.setSize(600,500);
        debitpanel.setLocation(50, 25);
        debitpanel.setLayout(null);
        debitpanel.setBackground(Color.GRAY);
        TitledBorder titledBorderDebit =BorderFactory.createTitledBorder("Debit card panel");
        titledBorderDebit.setTitleJustification(TitledBorder.CENTER);
        debitpanel.setBorder(titledBorderDebit);
        debitframe.add(debitpanel);

        //Adding components in debit card panel

        //Withdrawal Amount
        withdrawalAmount_jld=new JLabel("Withdrawal Amount");
        withdrawalAmount_jld.setBounds(5,10,200,100);
        withdrawalAmount_jld.setFont(new Font("Verdana",Font.BOLD,15));
        debitpanel.add(withdrawalAmount_jld);
        withdrawalAmount_tfd=new JTextField();
        withdrawalAmount_tfd.setBounds(215,40,200,30);
        debitpanel.add(withdrawalAmount_tfd);

        //Pin Number
        pinNumber_jld=new JLabel("Pin Number");
        pinNumber_jld.setBounds(5,60,150,100);
        pinNumber_jld.setFont(new Font("Verdana",Font.BOLD,15));
        debitpanel.add(pinNumber_jld);
        pinNumber_tfd=new JTextField();
        pinNumber_tfd.setBounds(215,95,200,30);
        debitpanel.add(pinNumber_tfd);

        //Withdrawal Date
        withdrawalDate_jld=new JLabel("Withdrawal Date");
        withdrawalDate_jld.setBounds(5,125,150,100);
        withdrawalDate_jld.setFont(new Font("Verdana",Font.BOLD,15));
        debitpanel.add(withdrawalDate_jld);
     
        //adding combobox in debit card panel
        String year[]={"Year","2023","2024","2025","2026","2027","2028","2029","2030"};
        String month[]={"Month","jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec"};
        String day[]={"Day","1","2","3","4","5","6","7","8", "9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32"};
        
        d_year=new JComboBox<>(year);
        d_year.setBounds(215, 150, 100, 50);
        debitpanel.add(d_year);

        d_month=new JComboBox<>(month);
        d_month.setBounds(325, 150, 100, 50);
        debitpanel.add(d_month);

        d_day=new JComboBox<>(day);
        d_day.setBounds(435, 150, 100, 50);
        debitpanel.add(d_day);

        //card id
        cardId_jld=new JLabel("Card Id");
        cardId_jld.setBounds(5,190,150,100);
        cardId_jld.setFont(new Font("Verdana",Font.BOLD,15));
        debitpanel.add(cardId_jld);
        cardID_tfd=new JTextField();
        cardID_tfd.setBounds(215,220,200,30);
        debitpanel.add(cardID_tfd);
        //adding button in debit card panel

        //debit card panel withdraw button to withdraw money
        d_withdraw=new JButton("Withdraw");
        d_withdraw.setBounds(20, 295, 100, 50);
        d_withdraw.setFocusPainted(false);
        debitpanel.add(d_withdraw);
        d_withdraw.addActionListener(new ActionListener() 
        {
            @Override
            public void actionPerformed(ActionEvent e) 
            {
                boolean is_found=false;
                if(getCardId_d()>0 && getWithdrawalAmount_d()>0 && getPinNumber_d()>0 && !getD_year().equals("Year") && !getD_month().equals("Month") && !getD_day().equals("Day"))
                {
                    JOptionPane.showMessageDialog(debitpanel,"Your provided CardId is "+getCardId_d()+".\n"+"The request WithDrawal amount is "+getWithdrawalAmount_d()+".\n"+"The provided pin number is "+getPinNumber_d()+".\n"+"The  date to request to withdraw  money is "+getWithdrawDate() ,"Check Inputed Data",JOptionPane.INFORMATION_MESSAGE);
                        for(BankCard b_obj_1:arraylist_obj_b)
                        {
                            if(b_obj_1 instanceof DebitCard)
                            {
                                DebitCard d_obj_1=(DebitCard) b_obj_1;
                                if(d_obj_1.getCardId()==getCardId_d())
                                {
                                    is_found=true;
                                    d_obj_1.withdraw(getWithdrawalAmount_d(), getPinNumber_d(), getWithdrawDate());
                                    break;
                                }
                            }
                        }
                        if(is_found==false)
                        {
                            JOptionPane.showMessageDialog(debitpanel,"The provided card id to withdraw money did not match.","Check Inputed Data", JOptionPane.ERROR_MESSAGE);
                        }
                        
                }
                else
                {
                    JOptionPane.showMessageDialog(debitpanel," The data entered in debit card field was not appropriate,please refill and try again","Check Inputed Data",JOptionPane.ERROR_MESSAGE);
                }               
            }
        });
     
        //debit card panel back button
        d_back=new JButton("Back");
        d_back.setBounds(480, 355, 100, 50);
        d_back.setFocusPainted(false);
        debitpanel.add(d_back);
        d_back.addActionListener(new ActionListener()
         {
            @Override
            public void actionPerformed(ActionEvent d_backButton)
            {
                String d_backButtonResult=d_backButton.getActionCommand();
                if(d_backButtonResult.equals("Back")){
                    bankframe.setVisible(true);
                    debitframe.setVisible(false);
                }    
            }
        });
        
        //debit card panel display button
        d_display=new JButton("Display");
        d_display.setBounds(20, 355, 100, 50);
        d_display.setFocusPainted(false);
        debitpanel.add(d_display);
        d_display.addActionListener(new ActionListener() 
        {
            @Override
            public void actionPerformed(ActionEvent e) 
            {
                for(BankCard b_obj_6:arraylist_obj_b)
                {
                    if(b_obj_6 instanceof DebitCard)
                    {
                        DebitCard d_obj_6=(DebitCard) b_obj_6;
                        d_obj_6.display();
                    }         
                  
                }           
            }
        });
        
        //debit card panel clear button
        d_clear=new JButton("Clear");
        d_clear.setBounds(480, 295, 100, 50);
        d_clear.setFocusPainted(false);
        debitpanel.add(d_clear);
        d_clear.addActionListener(new ActionListener()
         {
            @Override
            public void actionPerformed(ActionEvent d_clearButton)
             {
                String d_clearButtonResult=d_clearButton.getActionCommand();
                if(d_clearButtonResult.equals("Clear"))
                {
                 cardID_tfd.setText("");
                 withdrawalAmount_tfd.setText("");
                 pinNumber_tfd.setText(""); 
                d_year.setSelectedItem("Year");
                d_month.setSelectedItem("Month");
                d_day.setSelectedItem("Day");
                }      
            }
        });

        //debit card panel add button
        d_add=new JButton("Add");
        d_add.setBounds(240,415,100,50);
        debitpanel.add(d_add);
        d_add.addActionListener(new ActionListener() 
        {
            @Override
            public void actionPerformed(ActionEvent e) 
            {
                if(getCardId_b()>0 && getBalanceAmount_b()>-1 && !getBankAccount_b().isEmpty() && !getIssuerBank_b().isEmpty() && !getClientName_b().isEmpty() && getPinNumber_d()>0)
                {
                    if(getCheckCardId_d()==false)
                    {
                        DebitCard dcard_o = new DebitCard(getCardId_b(),getBankAccount_b(), getBalanceAmount_b(), getIssuerBank_b(), getClientName_b(), getPinNumber_d());
                        arraylist_obj_b.add(dcard_o);
                        JOptionPane.showMessageDialog(debitpanel,"All the data was added successful in debit card" ,"Result Output",JOptionPane.INFORMATION_MESSAGE);
                    }
                    else
                    {
                        JOptionPane.showMessageDialog(debitpanel,"Provide unique caard id in card id field of bank card and try again","Check Inputed Data",JOptionPane.ERROR_MESSAGE);
                    }            
                }
                else
                {
                    JOptionPane.showMessageDialog(debitpanel," Data was not added in debit card,please provide appropriate data","Result Output",JOptionPane.ERROR_MESSAGE);
                }
            }
        });
        //creating frame of credit card
        creditframe=new JFrame();
        creditframe.setTitle("Credit Card");
        creditframe.setLayout(null);
        creditframe.setSize(700,700);
        creditframe.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        creditframe.setLocationRelativeTo(null);

        //creating credit card panel
         creditpanel=new JPanel();
         creditpanel.setSize(600,600);
         creditpanel.setLocation(50, 25);
         creditpanel.setLayout(null);
         creditpanel.setBackground(Color.GRAY);
         TitledBorder titledBordercredit =BorderFactory.createTitledBorder("Credit card panel");
         titledBordercredit.setTitleJustification(TitledBorder.CENTER);
         creditpanel.setBorder(titledBordercredit);
         creditframe.add(creditpanel);

         //adding components in credit card panel
         //cvc number
        cvcNumber_jlc=new JLabel("CVC Number");
        cvcNumber_jlc.setBounds(5,10,200,100);
        cvcNumber_jlc.setFont(new Font("Verdana",Font.BOLD,15));
        creditpanel.add(cvcNumber_jlc);
        cvcNumber_tfc=new JTextField();
        cvcNumber_tfc.setBounds(215,40,200,30);
        creditpanel.add(cvcNumber_tfc);

        //creditLimit
        creditLimit_jlc=new JLabel("New Credit Limit");
        creditLimit_jlc.setBounds(5,60,150,100);
        creditLimit_jlc.setFont(new Font("Verdana",Font.BOLD,15));
        creditpanel.add(creditLimit_jlc);
        creditLimit_tfc=new JTextField();
        creditLimit_tfc.setBounds(215,95,200,30);
        creditpanel.add(creditLimit_tfc);

        //Expiration  Date
        expirationDate_jlc=new JLabel("Expiration Date");
        expirationDate_jlc.setBounds(5,125,150,100);
        expirationDate_jlc.setFont(new Font("Verdana",Font.BOLD,15));
        creditpanel.add(expirationDate_jlc);
     
        //adding combobox in debit card panel
        c_year=new JComboBox<>(year);
        c_year.setBounds(215, 150, 100, 50);
        creditpanel.add(c_year);

        c_month=new JComboBox<>(month);
        c_month.setBounds(325, 150, 100, 50);
        creditpanel.add(c_month);

        c_day=new JComboBox<>(day);
        c_day.setBounds(435, 150, 100, 50);
        creditpanel.add(c_day);

        //card id
        cardId_jlc=new JLabel("Card Id");
        cardId_jlc.setBounds(5,190,150,100);
        cardId_jlc.setFont(new Font("Verdana",Font.BOLD,15));
        creditpanel.add(cardId_jlc);
        cardId_tfc=new JTextField();
        cardId_tfc.setBounds(215,220,200,30);
        creditpanel.add(cardId_tfc);

        //new Grace Period
        gracePeriod_jlc=new JLabel("New Grace Period");
        gracePeriod_jlc.setBounds(5,240,170,100);
        gracePeriod_jlc.setFont(new Font("Verdana",Font.BOLD,15));
        creditpanel.add(gracePeriod_jlc);
        gracePeriod_tfc=new JTextField();
        gracePeriod_tfc.setBounds(215,275,200,30);
        creditpanel.add(gracePeriod_tfc);

        //Interest Rate
        interestRate_jlc=new JLabel("Interest Rate");
        interestRate_jlc.setBounds(5,290,150,100);
        interestRate_jlc.setFont(new Font("Verdana",Font.BOLD,15));
        creditpanel.add(interestRate_jlc);
        interestRate_tfc=new JTextField();
        interestRate_tfc.setBounds(215,330,200,30);
        creditpanel.add(interestRate_tfc);

        //adding button in credit card pannel
        //debit card panel back button
        c_back=new JButton("Back");
        c_back.setBounds(20, 400, 100, 50);
        c_back.setFocusPainted(false);
        creditpanel.add(c_back);
        c_back.addActionListener(new ActionListener() 
        {
            @Override
            public void actionPerformed(ActionEvent c_backButton)
            {
                String c_backButtonResult=c_backButton.getActionCommand();
                if(c_backButtonResult.equals("Back")){
                    bankframe.setVisible(true);
                    creditframe.setVisible(false);
                }    
            }
        });

        //credit card panel display button
        c_display=new JButton("Display");
        c_display.setBounds(480, 400, 100, 50);
        c_display.setFocusPainted(false);
        creditpanel.add(c_display);
        c_display.addActionListener(new ActionListener() 
        {
            @Override
            public void actionPerformed(ActionEvent e) 
            {
            for(BankCard b_obj_6:arraylist_obj_b)
            {
                if(b_obj_6 instanceof CreditCard)
                {
                    CreditCard c_obj_6=(CreditCard)b_obj_6;
                    c_obj_6.display();
                } 
            }
            }
        });
        
        //credit card panel clear button
        c_clear=new JButton("Clear");
        c_clear.setBounds(20, 460, 100, 50);
        c_clear.setFocusPainted(false);
        creditpanel.add(c_clear);
        c_clear.addActionListener(new ActionListener() 
        {
            @Override
            public void actionPerformed(ActionEvent c_clearButton) {
                String c_clearButtonResult=c_clearButton.getActionCommand();
                if(c_clearButtonResult.equals("Clear"))
                {
                 cardId_tfc.setText("");
                 cvcNumber_tfc.setText("");
                 creditLimit_tfc.setText("");
                 interestRate_tfc.setText("");
                 gracePeriod_tfc.setText("");
                c_year.setSelectedItem("Year");
                c_month.setSelectedItem("Month");
                c_day.setSelectedItem("Day");
                }      
            }
        });
        

        //credit card panel add button
        c_add=new JButton("Add");
        c_add.setBounds(480,460,100,50);
        c_add.setFocusPainted(false);
        creditpanel.add(c_add);
        c_add.addActionListener(new ActionListener() 
        {
            @Override
            public void actionPerformed(ActionEvent e)
             {
                if(getCardId_b()>0 && getBalanceAmount_b()>-1 && !getBankAccount_b().isEmpty() && !getIssuerBank_b().isEmpty() && !getClientName_b().isEmpty() && getCvcNumber_c()>0 && getInterestRate_c()>-1 && !getC_year().equals("Year") && !getC_month().equals("Month") && !getC_day().equals("Day") )
                 {
                    if(getCheckCardId_c()==false)
                    {
                        CreditCard ccard_obj=new CreditCard(getCardId_b(), getBankAccount_b(), getBalanceAmount_b(), getClientName_b(), getIssuerBank_b(), getCvcNumber_c(), getInterestRate_c(),getExpirationDate());
                        arraylist_obj_b.add(ccard_obj);
                        JOptionPane.showMessageDialog(creditpanel,"All the data was added successful in credit card","Result Output",JOptionPane.INFORMATION_MESSAGE);
                    }
                    else
                    {
                        JOptionPane.showMessageDialog(debitpanel,"Provide unique card id in card id field of bank card and try again","Check Inputed Data",JOptionPane.ERROR_MESSAGE);
                    }
                }
                else
                {
                    JOptionPane.showMessageDialog(creditpanel," Data was not added in credit card,please provide appropriate data in credit card","Result Output",JOptionPane.ERROR_MESSAGE);
                }
            }
        });

        //credit card panel setCreditLimit button
        c_setCreditLimit=new JButton("SetCreditLimit");
        c_setCreditLimit.setBounds(20,520,200,50);
        c_setCreditLimit.setFocusPainted(false);
        creditpanel.add(c_setCreditLimit);
        c_setCreditLimit.addActionListener(new ActionListener() 
        {
            @Override
            public void actionPerformed(ActionEvent e) 
            {
                if(getCardId_c()>0 && getCvcNumber_c()>0 && getGracePeriod_c()>0)
                {
                    JOptionPane.showMessageDialog(creditpanel,"The provided CardId is "+getCardId_c()+"\n"+"Your credit limit is "+getCreditLimit_c()+".\n"+"The grace period is "+getGracePeriod_c()+".\n","Details",JOptionPane.INFORMATION_MESSAGE);
                    for(BankCard b_obj_2:arraylist_obj_b)
                    {
                        if(b_obj_2 instanceof CreditCard)
                        {
                            CreditCard c_obj_1=(CreditCard) b_obj_2;
                            if(c_obj_1.getCardId()==getCardId_c())
                            {
                                c_obj_1.setCreditLimit(getCreditLimit_c(), getGracePeriod_c());
                            }
                            else
                            {
                                JOptionPane.showMessageDialog(creditpanel,"The card id provided in credit card to set credit limit doesn't match and credit limit is not set.", "Check Inputed Data",JOptionPane.ERROR_MESSAGE);
                            }
                        }
                    }               
                }
                else
                {
                    JOptionPane.showMessageDialog(creditpanel,"The provided data in credit card field to set credit limit is not appropriate.", "Check Inputed Data", JOptionPane.ERROR_MESSAGE);
                }
               
            }
        });

        //credit card panel cancel credit card button
        c_cancelCreditCard=new JButton("Cancel Credit Card");
        c_cancelCreditCard.setBounds(380,520,200,50);
        c_cancelCreditCard.setFocusPainted(false);
        creditpanel.add(c_cancelCreditCard);
        c_cancelCreditCard.addActionListener(new ActionListener() 
        {
            @Override
            public void actionPerformed(ActionEvent e)
             {
                if(getCardId_c()>0)
                {
                    for(BankCard b_obj_3:arraylist_obj_b)
                    {
                        if(b_obj_3 instanceof CreditCard)
                        {
                        CreditCard c_obj_3=(CreditCard)b_obj_3;
                        if(c_obj_3.getCardId()==getCardId_c())
                        {
                            c_obj_3.cancelCreditCard();
                            JOptionPane.showMessageDialog(creditpanel,"Credit card has been successfully canceled.","Details", JOptionPane.INFORMATION_MESSAGE);
                        }
                        else
                        {
                            JOptionPane.showMessageDialog(creditpanel,"The card id provided in creditr card to cancel credit card doesn't match and credit card is not canceled.", "Check Inputed Data",JOptionPane.ERROR_MESSAGE);
                        }
                        }                  
                    }
                }
                else
                {
                    JOptionPane.showMessageDialog(creditpanel,"The provided data in credit card is not appropriate.", "Check Inputed Data", JOptionPane.ERROR_MESSAGE);          
                }
            }
        });
        //making bankframe visible
        bankframe.setVisible(true);
    }
    public static void main(String[] args) 
    {
    Bank_Gui bankgui=new Bank_Gui(); 
    }
}