import datetime;
#creating method to read available stock and insert in nested dictionary
def stock_data():
    #creating empty dictionary
    laptop_data={};
    with open("laptop_stock.txt","r") as file:
        for data in file:
            name,brand,price,quantity,processor,graphic_card=data.strip().split(", ");
            laptop_data[name.upper()]={"brand":brand,"price":float(price.strip("$")), "quantity":int(quantity),"processor":processor,"graphic":graphic_card};
    file.close();
    return laptop_data;
#creating method to display stock_data
def show_stock():
    #calling stock_data method and storing it in laptop_stock variable
    laptop_stock=stock_data();
    print("{a:<10} {b:<25} {c:<25} {d:<25} {e:<25} {f:<25} {g:<25}".format(a="No",b="Name of laptop",c="Brand Name",d="Price",e="Quantity",f="Processor",g="Graphic Card"));
    No=1;
    for keys_val,values_val in laptop_stock.items():
        print("{a:<10} {b:<25} {c:<25} {d:<25} {e:<25} {f:<25} {g:<25}".format(a=No,b=keys_val,c=values_val["brand"],d=values_val["price"],e=values_val["quantity"],f=values_val["processor"],g=values_val["graphic"]));
        No+=1;
#creating method to sell laptop and update in stock after selling
def sell_laptop():
     #calling stock_data method and storing it in laptop_stock variable
    laptop_stock=stock_data();
    customer_name=input("Enter your name = ");
    print("✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️,✒️");
    print("{a:<30} {b:<30} {c:<30} {d:<30}".format(a="No",b="Name",c="Price",d="Quantity"));
    No=1;
    for keys_v,values_v in laptop_stock.items():
        print("{a:<30} {b:<30} {c:<30} {d:<30}".format(a=No,b=keys_v,c=values_v["price"],d=values_v["quantity"]));
        No+=1;
    laptop_name=input("Enter the name of laptop you want to purchase = ");
    if laptop_name.upper() not in laptop_stock:
        print(f"Sorry we dont't have {laptop_name} in stock.");
        return;
    stock_keys=laptop_stock[laptop_name.upper()];
    #Throwing ValueError exception
    try:
        quantity=int(input(f"Enter quantity of {laptop_name} laptop to buy = "));
        if quantity<1:
            print("Please enter the valid quantity");
            return;
    except ValueError:
        print("Please provide quantity value integer type.");
        return;
    if stock_keys["quantity"]<quantity:
        print(f"Sorry at the moment we don't have {quantity} {laptop_name} laptop in stock to sell.");
        return;
    #Decreasing quantity after selling laptop
    stock_keys["quantity"]-=quantity;
    price_wo_s_c=stock_keys["price"]*quantity;
    shipping=input('''Do you want your laptop shipped?\nYes or No = ''');
    
    if(shipping.upper()=="YES"):
        shipping_cost=100;  
    else:
        shipping_cost=0;
    price_w_s_c= price_wo_s_c+shipping_cost;
    #Generating payment slip
    payment_slip=f'''
                    New Era Laptop Shop
    $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
                        Receipt
    $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
    Customer Name={customer_name.upper()}  
    $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
    Brand Name={stock_keys["brand"]}
    Product Name={laptop_name.upper()}
    $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
    Per piece Price=${stock_keys["price"]:.2f}
    Quantity={quantity}
    $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
    Total price without shipping cost=${price_wo_s_c:.2f}
    Shipping Charge=${shipping_cost:.2f}
    Total=${price_w_s_c:.2f}
    $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
            {datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")}
            Thank you for choosing us.''';
    print(payment_slip);
    with open("sell_slip.txt","w") as file:
        file.write(payment_slip);
    file.close();
    print("You can also check sell_slip.txt file for your transaction slip.");
    #Updating stock after selling laptop
    with open("laptop_stock.txt","w") as file:
        for laptop_name, laptop_data in laptop_stock.items():
            name=laptop_name;
            brand=laptop_data["brand"];
            price=laptop_data["price"];
            quantity=laptop_data["quantity"];
            processor=laptop_data["processor"];
            graphic_card=laptop_data["graphic"];
            file.write(f"{name}, {brand}, ${price}, {quantity}, {processor}, {graphic_card}\n");  
    file.close();
#Creating function to buy goods from manufacturer and update stock after buying
def buy_laptop():
     #calling stock_data method and storing it in laptop_stock variable
    laptop_stock=stock_data();
    producer_name=input("Enter the name of producer = ");
    print("{a:<30} {b:<30} {c:<30} {d:<30}".format(a="No",b="Name",c="Price",d="Quantity"));
    No=1;
    for keys_v,values_v in laptop_stock.items():
        print("{a:<30} {b:<30} {c:<30} {d:<30}".format(a=No,b=keys_v,c=values_v["price"],d=values_v["quantity"]));
        No+=1;
    laptop_name=input("Enter the name of laptop = ");
    if laptop_name.upper() not in laptop_stock:
        print("At the moment we don't have laptop of your choice to sell.");
        return;
    stock_keys=laptop_stock[laptop_name.upper()];
    #Throwing ValueError exception 
    try:
        quantity=int(input("Enter the required number of laptops = "));
        if quantity<1:
            print("Please enter the valid quantity");
            return;
    except ValueError:
        print("Please provide quantity value integer type.");
        return;
    #Increasing quantity after adding laptop
    stock_keys["quantity"]+=quantity;
    price_wo_VAT=stock_keys["price"] * quantity;
    VAT_amount=(price_wo_VAT*0.13);
    price_w_VAT=VAT_amount+price_wo_VAT;
    #Generating payment_slip
    payment_slip=f'''
                    New Era Laptop Shop
    $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
                        Receipt
    $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
    Producer Name={producer_name.upper()}  
    $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
    Brand Name={stock_keys["brand"]}
    Product Name={laptop_name.upper()}
    $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
    Per Piece Price=${stock_keys["price"]:.2f}
    Quantity={quantity}
    $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
    Price without VAT=${price_wo_VAT:.2f}
    Vat Amount Charge=${VAT_amount:.2f}
    Total=${price_w_VAT:.2f}
    $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
            {datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")}
            Thank you for choosing us.''';
    print(payment_slip);
    with open("purchase_slip.txt","w") as file:
        file.write(payment_slip);
    print("You can also check purchase_slip.txt file for transaction slip.");
    #updating stock after adding laptop
    with open("laptop_stock.txt","w") as file:
        for laptop_name,laptop_data in laptop_stock.items():
            name=laptop_name;
            brand=laptop_data["brand"];
            price=laptop_data["price"];
            quantity=laptop_data["quantity"];
            processor=laptop_data["processor"];
            graphic_card=laptop_data["graphic"];
            file.write(f"{name}, {brand}, ${price}, {quantity}, {processor}, {graphic_card}\n");
    file.close();
#created method for shoppin"
def start_shopping():
    while True:
        print(" "); 
        print("🛒🛒🛒🛒🛒🛒🛒🛒🛒🛒🛒🛒 Welcome to New Era Laptop shop🛒🛒🛒🛒🛒🛒🛒🛒🛒🛒🛒🛒🛒🛒🛒");
        print(" ");
        print('''Please select option and continue your shopping ahead.
            1.Show available stock
            2.Buy
            3.Sell
            4.Exit''');
        option=input("Enter your choice = ");
        if option=="1":
            show_stock();
        elif option=="2":
            buy_laptop();
        elif option=="3":
            sell_laptop();     
        elif option=="4":
             print("Thank you for choosing us");
             break;
        else:
            print("Select choice according to provided option");
#calling start_shopping() method
start_shopping();
