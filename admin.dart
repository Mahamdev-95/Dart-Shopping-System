import 'dart:io';

admin() {
  Map<String, dynamic> emails_and_Passwords = {
    "maham940i@gmail.com": "I@mshort9",
  };
  stdout.write("enter your email");
  String? admin_Email = stdin.readLineSync();

  if (emails_and_Passwords.containsKey(admin_Email)) {
    stdout.write("enter your password");
    String? admin_Password = stdin.readLineSync();
    if (emails_and_Passwords.containsValue(admin_Password)) {
      stdout.write(
        " Please select one of the options given below \n 1)View Product Stock \n 2)Edit Product Price \n 3)Add a Product/Products",
      );
    } else {
      stdout.write("You entered wrong password , try again\n");
      int loginAttempts = 1;
      while (loginAttempts < 3) {
        stdout.write("Try Again");
        String? admin_Password = stdin.readLineSync();

        if (emails_and_Passwords[admin_Email] != admin_Password) {
          stdout.write("Wrong password \n");
          if (loginAttempts == 2) {
            stdout.write(
              "You have exceeded the login attempts, Please try again later!\n",
            );
            break;
          }
          loginAttempts++;
        } else {
          stdout.write(
            "Log in succesfull! Please select one of the options given below \n 1)View Product Stock \n 2)Edit Product Price \n 3)Add a Product/Products",
          );
          //String ? option=stdin.readLineSync();
        }
      }
    }
  } else {
    int loginAttempt = 1;
    while (loginAttempt < 3) {
      stdout.write("Wrong, enter another");
      String? admin_Email = stdin.readLineSync();

      if (emails_and_Passwords.containsKey(admin_Email)) {
        stdout.write(
          "Log in succesfull! Please select one of the options given below \n 1)View Product Stock \n 2)Edit Product Price \n 3)Add a Product/Products",
        );
      } else {
        stdout.write("Wrong email! \n");
        if (loginAttempt == 2) {
          stdout.write(
            "You have exceeded the login attempts, Please try again later!\n",
          );
          break;
        }
      }
      loginAttempt++;
    }
    //String ? option=stdin.readLineSync();
  }
}
