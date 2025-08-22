import 'dart:io';
import 'admin_tester.dart';
import 'user.dart';

/*void main() {
  stdout.write(
    "Welcome to the store! Kindly select one out of the options mentioned below by entering the option Name.\n 1) Admin \n 2) User.",
  );
  String? option = stdin.readLineSync();
  if (option == "admin") {
    admin();
  } else {
    //user();
    print("XX");
  }
}*/
void main() {
  stdout.write(
    "WELCOME TO DART SHOPPING STORE !\n Kindly select one out of the options mentioned below by entering the option Name.\n 1) Admin \n 2) User.",
  );
  String? option = stdin.readLineSync();
  if (option == "admin") {
    admin();
  } else {
    user();
  }
}
