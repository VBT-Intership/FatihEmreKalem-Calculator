import 'dart:convert';
import 'dart:io';

void main(List<String> args) {
  print(
      "Hesap makinası \n sayi, işlem, sayi şeklinde ilerlemektedir. 'e' çıkıştır");
  calc();
}

class calc {
  double result;

  calc() {
    try {
      start();
      while (true) {
        String opr = stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
        double nextValue = double.parse(
            stdin.readLineSync(encoding: Encoding.getByName('utf-8')));
        if (opr == "e" || nextValue == "e") {
          break;
        } else
          print("${islemSecimi(opr, result, nextValue)}");
      }
    } catch (e) {
      print("hatalı işlem  $e");
    }
  }

  double topla(double firstVal, double secondVal) => firstVal + secondVal;
  double cikar(double firstVal, double secondVal) => firstVal - secondVal;
  double carp(double firstVal, double secondVal) => firstVal * secondVal;
  double bol(double firstVal, double secondVal) => firstVal / secondVal;
  double mod(double firstVal, double secondVal) => firstVal % secondVal;

  double start() {
    double ilkSayi =
        double.parse(stdin.readLineSync(encoding: Encoding.getByName('utf-8')));
    String ilkIslem = stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
    double ikinciSayi =
        double.parse(stdin.readLineSync(encoding: Encoding.getByName('utf-8')));

    result = islemSecimi(ilkIslem, ilkSayi, ikinciSayi);
    print(result);
    return result;
  }

  double islemSecimi(opr, firstVal, secondVal) {
    switch (opr) {
      case "/":
        return bol(firstVal, secondVal);
        break;
      case "*":
        return carp(firstVal, secondVal);
        break;
      case "+":
        return topla(firstVal, secondVal);
        break;
      case "-":
        return cikar(firstVal, secondVal);
        break;
      default:
        return 0;
        break;
    }
  }
}
