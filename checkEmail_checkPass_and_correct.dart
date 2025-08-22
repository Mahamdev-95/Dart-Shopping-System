import 'dart:io';

int loginFailed = 0;

Map<String, String> loginCredentials = {"maham940i@gmail.com": "I@mshort"};
checkEmail(String admin_Email) {
  if (loginCredentials.containsKey(admin_Email)) {
    stdout.write("enter your password");
    String? admin_Password = stdin.readLineSync();
    if (admin_Password != null) {
      if (loginCredentials[admin_Email] == admin_Password) {
        stdout.write(
          "Log in succesfull! Please select one of the options given below \n ",
        );
      } else {
        print("enter password again function would run here");
        enter_Password_Again(admin_Email);
      }
    } else {
      print("Null password");
    }
  } else {
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
                  "\nLog in succesfull! Please select one of the options given below \n ",
                );
                stdout.write("1-View Product details \n");
                stdout.write(" 2-Edit Product Price \n ");
                stdout.write("3-Add a Product/Products\n");
                //break;
              } else {
                //print("Enter password again function would run here\n");
                enter_Password_Again(newAdmin_Email);
                if (loginFailed == 2) {
                  break;
                } else {
                  //print(" exiting come out of the wrong email statement");
                  break;
                }
              }
            } else {
              print(" null admin password\n");
            }
          } else {
            print(" login in credentials does not contain email");
          }
        } else {
          print(" null admin email\n");
        }
      }
      loginAttempt++;
    }
    ;
  }
}

enter_Password_Again(String admin_Email) {
  int loginAttempts = 1;
  while (loginAttempts < 3) {
    stdout.write("wrong,Try Again");
    String? admin_Password = stdin.readLineSync();

    if (loginCredentials[admin_Email] != admin_Password) {
      stdout.write("Wrong password \n");
      loginFailed++;
      if (loginFailed == 2) {
        stdout.write(
          "You have exceeded the login attempts, Please try again later!\n",
        );

        break;
      }
      loginAttempts++;
    } else {
      stdout.write(
        "Log in succesfull! Please select one of the options given below \n ",
      );
      /*stdout.write("1-View Product Stock \n");
      stdout.write(" 2-Edit Product Price \n ");
      stdout.write("3-Add a Product/Products");*/
      break;
    }
  }
}

correct_the_email(String admin_Email) {
  int loginAttempt = 1;
  // print("i am in wron email else statement ");
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
              /*stdout.write("1-View Product details \n");
              stdout.write(" 2-Edit Product Price \n ");
              stdout.write("3-Add a Product/Products\n");*/
              break;
            } else {
              //print("Enter password again function would run here\n");
              enter_Password_Again(newAdmin_Email);
              if (loginFailed == 2) {
                break;
              }
            }
          } else {
            print("null admin password\n");
          }
        } else {
          print("login in credentials does not contain email");
        }
      } else {
        print(" null admin email\n");
      }
    }
    loginAttempt++;
  }
  ;
}
