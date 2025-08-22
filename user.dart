import 'dart:io';

double bill = 0;
void main() {
  user();

  //print(
  //'\nCompany Name: $productName, Price: ${productName} * ${productQuantity} = Rs$productPricing/-\n',
  //);
}

Map<String, Airconditioners> air_conditioners = {
  'Pel Ac': Airconditioners(
    price: 175000,
    size: "2 Ton",
    model: 2025,
    stock: 50,
  ),
  'Orient AC': Airconditioners(
    price: 115000,
    size: "1 Ton",
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
