Uses SysUtils;
Var firstname, lastname, firstlineaddress, secondlineaddress, city, postcode, country, phone : String;
Var variety, carcode, deliverychoice, deliverytype, i, quantity, preplantotal, planchoice, vehiclecost : integer;
Var interest, afterplantotal, deliverycost, deposit, total : real;
{create all program variables}

procedure userdata; {collection of all personal user data}
begin
writeln('************************************');
writeln('*                                  *');
writeln('*    Terry Tibbs Car Dealership    *');
writeln('*                                  *');
writeln('************************************');
writeln('');
writeln('First off, please enter your first name and press enter.');{tells the user what to enter}
readln(firstname);{allows the user to input and stores it}
writeln('Next, please enter your last name and press enter.');
readln(lastname);
writeln('Please enter the house number and street name of the delivery location and press enter. For example, 5 Elm Way');
readln(firstlineaddress);
writeln('Now, please enter the area of the delivery location and press enter. For example, Lindley');
readln(secondlineaddress);
writeln('Next, please enter the city of the delivery location and press enter. For example, Leeds');
readln(city);
writeln('Please enter the postcode of the delivery location and press enter. For example, HD3 4GL');
readln(postcode);
writeln('Please enter the name of the country in which the delivery location is. For example, United Kingdom');
readln(country);
writeln('Finally, please enter a contact telephone number including country code for the delivery. For example +447123456789');
readln(phone);
writeln('');
writeln('Thank you for the information!');
writeln('')
end;

procedure invoice;{displays the costs of the order and displays users information}
begin
total := preplantotal + interest + deliverycost;{calculates total of order}
writeln('');
writeln('The following is an invoice of your order:');
writeln('');
writeln('***************************************************');
writeln('*           Terry Tibbs Car Dealership            *');
writeln('*                                                 *');
writeln('* The following are the charges from todays order *');
writeln('***************************************************');
writeln('For your vehicle(s), you will be charged �',preplantotal);{outputs each of the costs that are stored in variables}
writeln('Your payment plan will add �',interest:2:2);
writeln('Your delivery option will add �',deliverycost:2:2);
writeln('Making the total of the order �',total:2:2);
writeln('');
writeln('The following are your details that we will use to contact');
writeln('and deliver to if delivery was chosen.');
writeln(lastname, ', ', firstname);{outputs user data}
writeln(firstlineaddress);
writeln(secondlineaddress);
writeln(city);
writeln(postcode);
writeln(country);
writeln(phone);
writeln('');
writeln('Thank you for choosing Terry Tibbs!');
end;

procedure deliveryplan;
begin
writeln('');
writeln('Would you like your order to be delivered? Enter 1 for yes or 2 for no');
readln(deliverychoice);

case deliverychoice of {checks the users input to determine their choice}
  1 : Begin {user wants delivery so does the following}
  writeln('');
  writeln('The following table shows the delivery charges depending on the distance away from the dealership:');
  writeln('Area           Range of delivery     Tariff   Choice number');{displays delivery types}
  writeln('Local          < 20 Kilometres       �79.99   1');
  writeln('Regional       < 120 Kilometres      �99.99   2');
  writeln('National       < 500 Kilometres      �189.99  3');
  writeln('International  Outside UK            �399.99  4');
  writeln('');
  writeln('Please enter the choice number for the delivery option you wish to select.');
  writeln('Please note that the payment plan does not have an effect on the delivery charge.');
  writeln('You must pay the delivery charge in full upfront.');
  readln(deliverytype);{allows the user to select a delivery type}

  case deliverytype of{determines what type of the delivery is selected}
    1 : Begin {user selects this delivery so does the following}
    writeln('');
    writeln('You have chosen local delivery. This will add �79.99 to your total.');{tells the user their choice}
    deliverycost := 79.99;{sets variable to price of this delivery choice}
    end;

    2 : begin
    writeln('');
    writeln('You have chosen regional delivery. This will add �99.99 to your total.');
    deliverycost := 99.99;
    end;

    3 : begin
    writeln('');
    writeln('You have chosen national delivery. This will add �189.99 to your total.');
    deliverycost := 189.99;
    end;

    4 : begin
    writeln('');
    writeln('You have chosen international delivery. This will add �399.99 to your total.');
    deliverycost := 399.99;
    end;

  end;
  end;

  2 : begin{user doesnt want delivery so does nothing}
  writeln('');
  writeln('You have chosen no delivery.');{only tells the user about their choice}
  end
End;
end;


procedure paymentplan;{allows the user to select a payment plan}
begin
writeln('');
writeln('The total for the order is �', preplantotal);{displays cost of vehicle choices}
writeln('');
writeln('We have the following payment plans available:');{displays payment plans}
writeln('1. Pay a 50% deposit on the total now and add 5% interest to the total price;');
writeln('2. Pay 0% now and add 10% interest to the total price;');
writeln('3. Pay the total price now in cash.');
writeln('Please select a plan. Enter 1, 2 or 3');
readln(planchoice);{user inputs desired payment plan}
writeln('');
case planchoice of{determines which plan the user selected}
 1 : Begin {user wants this plan so does the following}
 interest := preplantotal / 20; {finds 5% of the current total}
 afterplantotal := preplantotal + interest; {adds 5% to the total as interest}
 deposit := afterplantotal / 2; {calculates 50% deposit}
 writeln('You have selected the first plan. You will now pay 50% of the order price now and pay the rest later.');
 writeln('This will add 5% interest to the order price');
 writeln('This will add �',interest:2:2, ' to the order price');{tells the user how much has been added to order}
 writeln('The order price is now �',afterplantotal:2:2);{tells the user of the updated order price}
 End;

 2 : Begin
 interest := preplantotal / 10;
 afterplantotal := preplantotal + interest;
 writeln('You have selected the second plan. You will now pay 0% of the order price and pay the rest later.');
 writeln('This will add 10% interest to the order price');
 writeln('This will add �' ,interest:2:2, ' to the order price');
 writeln('The order price is now �',afterplantotal:2:2);
 End;

 3 : Begin {user wants to pay in cash upfront/no payment plan so does the following}
 writeln('You have chosen to pay �' ,preplantotal, ' in cash upfront');{only tells the user of their choice and how much they must pay now}
 End;
end;
end;

procedure carselection; {allows the user to select the vehicles they wish to order}
begin
writeln('We have the following vehicles available:'); {displays the available vehicles}
writeln('Car make    Car model    Car price    Item code');
writeln('Ford        Fiesta       �13,000      130');
writeln('Ford        Ka           �10,000      100');
writeln('Vauxhall    Corsa        �15,000      150');
writeln('Vauxhall    Vectra       �18,000      180');
writeln('Fiat        500          �16,995      169');
writeln('Fiat        Punto        �13,995      139');
writeln('Volkswagen  Golf         �22,995      229');
writeln('Volkswagen  Polo         �12,995      129');
writeln('');
writeln('How many different vehicles would you like to purchase? Please enter a value between 1 and 8');{asks the user how many different vehicles (models) they wish to order}

readln(variety);{allows the user to input their choice}

for i := 1 to variety do {begins a loop that runs until the user has ordered all the models they want}
  begin
    writeln('');
    writeln('Please enter the item code for the vehicle you wish to order');
    readln(carcode); {user enters the code of the vehicle they want to add to the order}
    writeln('');
    case carcode of  {determines which vehicle the user has selected}
     130 : Begin {user selects this vehicle so the following happens}
       writeln('You have chosen the Ford Fiesta. How many would you like to purchase?');{tells the user which vehicle they have selected}
       readln(quantity);{allows the user to enter how many of these vehicles they want}
       writeln('');
       vehiclecost := quantity * 13000; {calculates how much to add to the order cost}
       writeln('This will add �' ,vehiclecost ,' to your order'); {tells the user how much will be added}
       preplantotal := preplantotal + vehiclecost; {adds the cost to the total}
       end;

     100 : Begin
       writeln('You have chosen the Ford Ka. How many would you like to purchase?');
       readln(quantity);
       writeln('');
       vehiclecost := quantity * 10000;
       writeln('This will add �' ,vehiclecost ,' to your order');
       preplantotal := preplantotal + vehiclecost;
       end;

      150 : Begin
       writeln('You have chosen the Vauxhall Corsa. How many would you like to purchase?');
       readln(quantity);
       writeln('');
       vehiclecost := quantity * 15000;
       writeln('This will add �' ,vehiclecost ,' to your order');
       preplantotal := preplantotal + vehiclecost;
       end;

      180 : Begin
       writeln('You have chosen the Vauxhall Vectra. How many would you like to purchase?');
       readln(quantity);
       writeln('');
       vehiclecost := quantity * 18000;
       writeln('This will add �' ,vehiclecost ,' to your order');
       preplantotal := preplantotal + vehiclecost;
       end;

      169 : Begin
       writeln('You have chosen the Fiat 500. How many would you like to purchase?');
       readln(quantity);
       writeln('');
       vehiclecost := quantity * 16995;
       writeln('This will add �' ,vehiclecost ,' to your order');
       preplantotal := preplantotal + vehiclecost;
       end;

      139 : Begin
       writeln('You have chosen the Fiat Punto. How many would you like to purchase?');
       readln(quantity);
       writeln('');
       vehiclecost := quantity * 13995;
       writeln('This will add �' ,vehiclecost ,' to your order');
       preplantotal := preplantotal + vehiclecost;
       end;

      229 : Begin
       writeln('You have chosen the Volkswagen Golf. How many would you like to purchase?');
       readln(quantity);
       writeln('');
       vehiclecost := quantity * 22995;
       writeln('This will add �' ,vehiclecost ,' to your order');
       preplantotal := preplantotal + vehiclecost;
       end;

      129 : Begin
       writeln('You have chosen the Volkswagen Polo. How many would you like to purchase?');
       readln(quantity);
       writeln('');
       vehiclecost := quantity * 12995;
       writeln('This will add �' ,vehiclecost ,' to your order');
       preplantotal := preplantotal + vehiclecost;
       end;
     End;
    end;
end;

begin {the code that runs the program}
userdata; {procedure that collects user data}
carselection; {procedure that allows the user to select the vehicles they want}
paymentplan; {procedure that allows the user to select payment plan}
deliveryplan; {procedure that allows the user to select delivery plan}
invoice; {procedure that displays the invoice for the order}
readln; {allows the program to stop so that the user can read their invoice. program will close when enter is pressed}
end. {end of program}
