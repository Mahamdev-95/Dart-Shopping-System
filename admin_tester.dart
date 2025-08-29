import 'dart:io';
import 'user.dart';
import 'checkEmail_checkPass_and_correct.dart';

int loginFailed = 0;
admin() {
  stdout.write("enter your email");
  String? admin_Email = stdin.readLineSync();
  if (admin_Email != null) {
    if (loginCredentials.containsKey(admin_Email)) {
      //bool loginsuccesful = checkEmail(admin_Email);
      checkEmail(admin_Email);
      admin_Choice();
    } else {
      print("it is now running");
      correct_the_email(admin_Email);
      admin_Choice();

      //stdout.write("You did not eneter any option.Therefore we are quiting ");
    }
  } else {
    stdout.write("You did not eneter any option.Therefore we are quiting ");
  }
}

//8888888}
//000000}
//}
void main() {
  stdout.write(
    "Welcome to Home Appliance Storestore!\n\n Kindly select one out of the options mentioned below by entering the option Name.\n 1) Admin \n 2) User.",
  );
  String? option = stdin.readLineSync();
  if (option == "admin") {
    admin();
  } else {
    user();
  }
}

Map<String, Airconditioners> air_conditioners = {
  'Kenwood Blender': Airconditioners(
    price: 15000,
    size: "2 Liters",
    model: 2025,
    stock: 50,
  ),
  'Haier Top Load Washing Machine': Airconditioners(
    price: 115000,
    size: "12 kg",
    model: 2023,
    stock: 30,
  ),
  'Dawlance Refrigerator': Airconditioners(
    price: 115000,
    size: "12 cu. ft",
    model: 2025,
    stock: 30,
  ),
};

class Airconditioners {
  double price;
  String size;
  int model;
  double stock;

  Airconditioners({
    required this.price,
    required this.size,
    required this.model,
    required this.stock,
  });
  double updatePrice(double readprice) {
    this.price = readprice;

    return price;
  }

  dynamic addaproduct(double price, String size, int model, int stock) {}
}

dynamic edit_Airconditioners_price() {
  stdout.write(" Enter 'Complete' company Name whose price want to edit \n ");
  String? readCompanyName = stdin.readLineSync();

  if (air_conditioners.containsKey(readCompanyName)) {
    stdout.write(" The company exists .Enter the new price \n ");
    double? readprice = double.parse(stdin.readLineSync()!);
    //if (readprice != null) {
    //air_conditioners['key_name']?.property = new_value;
    air_conditioners[readCompanyName]!.price = readprice;
    air_conditioners.forEach((companyName, airconditiorobj) {
      print(
        '\n $companyName, Price: ${airconditiorobj.price}, Size: ${airconditiorobj.model},Model: ${airconditiorobj.model},Stock: ${airconditiorobj.stock}',
      );
    });
    //}
  }
}

dynamic add_a_Product() {
  stdout.write("\nEnter the name of Company  you want to add ");
  String? companyName = stdin.readLineSync();
  stdout.write("\nEnter its Price\n");
  double? price = double.parse(stdin.readLineSync()!);
  stdout.write("\nEnter its size\n");
  String? size = stdin.readLineSync();
  stdout.write("\nEnter its Model\n");
  int? model = int.parse(stdin.readLineSync()!);
  stdout.write("\nEnter its Quantity in stock \n");
  double? stock = double.parse(stdin.readLineSync()!);
  air_conditioners[companyName!] = Airconditioners(
    price: price,
    size: size!,
    model: model,
    stock: stock,
  );
  air_conditioners.forEach((companyName, airconditiorobj) {
    print(
      '\n $companyName, Price: ${airconditiorobj.price}, Size: ${airconditiorobj.size},Size: ${airconditiorobj.model},Stock: ${airconditiorobj.stock}\n',
    );
  });
}

/////////////
///
correct_the_email(String admin_Email) {
  int loginAttempt = 1;
  //print("i am in wron email else statement ");
  while (loginAttempt < 3) {
    if (loginAttempt == 3) {
      stdout.write("You have exceeded login attempts, try later!");
      //loginFailed++;
      break;
    } else {
      stdout.write("Email doesnot exist, try another\n");
      String? newAdmin_Email = stdin.readLineSync();
      if (newAdmin_Email != null) {
        if (loginCredentials.containsKey(newAdmin_Email)) {
          stdout.write("enter your password\n");
          String? admin_Password = stdin.readLineSync();
          if (admin_Password != null) {
            if (loginCredentials[newAdmin_Email] == admin_Password) {
              stdout.write(
                "Log in succesfull! Please select one of the options given below \n ",
              );
              stdout.write("1-View Product details \n");
              stdout.write(" 2-Edit Product Price \n ");
              stdout.write("3-Add a Product/Products\n");
              break;
            } else {
              print("enter password again function would run here\n");
              enter_Password_Again(newAdmin_Email);
              if (loginFailed == 2) {
                break;
              }
            }
          } else {
            print("null admin password\n");
          }
        } else {
          print(" \nlogin in credentials does not contain email\n");
        }
      } else {
        print("\nnull admin email\n");
      }
    }
    loginAttempt++;
  }
  ;
}

//////
admin_Choice() {
  String lastOption = 'd';
  while (true) {
    stdout.write("Select one of the options given below\n");
    stdout.write("A-View Product Details \n");
    stdout.write(" B-Edit Product Price \n ");
    stdout.write("C-Add a Product/Products \n");
    stdout.write("D-Exit \n");
    String? readOPtion = stdin.readLineSync();
    if (readOPtion == lastOption) {
      break;
    } else if (readOPtion == 'A' || readOPtion == 'a') {
      air_conditioners.forEach((companyName, airconditiorobj) {
        print(
          '\n $companyName, Price: ${airconditiorobj.price}, Size: ${airconditiorobj.size},Model: ${airconditiorobj.model},Stock: ${airconditiorobj.stock}\n',
        );
      });
    } else if (readOPtion == 'B' || readOPtion == 'b') {
      air_conditioners.forEach((companyName, airconditiorobj) {
        print(
          '\n $companyName, Price: ${airconditiorobj.price}, Size: ${airconditiorobj.size},Model: ${airconditiorobj.model},Stock: ${airconditiorobj.stock}\n',
        );
      });
      edit_Airconditioners_price();
    } else if ((readOPtion == 'C' || readOPtion == 'c')) {
      add_a_Product();
    } else {
      stdout.write(
        "\nYou did not eneter any option.Therefore we are quiting.\n ",
      );
      break;
    }
  }
}

user() {
  print("Avaialable products");
  Map<String, double> cart = {};
  double total_bill = 0;
  air_conditioners.forEach((companyName, airconditiorobj) {
    print(
      '\n $companyName, Price: ${airconditiorobj.price}, Size: ${airconditiorobj.size},Model: ${airconditiorobj.model},Stock: ${airconditiorobj.stock}\n',
    );
  });
  while (true) {
    stdout.write(
      "\nEnter product/s name you want to buy or type 'exit' to finish \n",
    );
    String? productName = stdin.readLineSync();
    if (productName == null || productName.toLowerCase() == 'exit') {
      print("Invalid Product Name");
      break;
    } else {
      if (air_conditioners.containsKey(productName)) {
        print("\n$productName exists\n");
        double stock_available = air_conditioners[productName]!.stock;
        stdout.write("\nEnter the quantity of your chosen product \n");
        double? productQuantity = double.parse(stdin.readLineSync()!);
        if (productQuantity == null || productQuantity <= 0) {
          print("You entered invalid quantity");
        } else if (productQuantity > stock_available) {
          print(
            "Your entered qty exceeds our stock limit, only $stock_available stock is left",
          );
        } else {
          //double product_Price = air_conditioners[productName]!.price;

          stock_available -= productQuantity;
          cart[productName] =
              (cart[productName] ?? 0) +
              productQuantity; //adfing things to cart
          print("You have added $productName X $productQuantity to your cart");
        }
      } else
        (print("product does not exist.try again"));
    }
  }
  cart.forEach((productName, productQuantity) {
    Airconditioners airconditiorobj = air_conditioners[productName]!;
    double subtotal = airconditiorobj.price * productQuantity;
    total_bill += subtotal;
    print("\n$productName  Quantity: $productQuantity Subtotal: $subtotal\n");
  });

  print("\n💰 Total Bill: $total_bill");
}
