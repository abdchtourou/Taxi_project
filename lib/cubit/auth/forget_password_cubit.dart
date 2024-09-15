import 'package:bloc/bloc.dart';


enum RecoveryOption { sms, email, none,loading,send }

class ForgetPasswordCubit extends Cubit<RecoveryOption> {
  ForgetPasswordCubit() : super(RecoveryOption.none);

  // Select SMS option
  void selectSms() {
    emit(RecoveryOption.sms);
  }
  String num="0992419830";
  String email = "abdallteefchtourou@xyz.com";

  void maskSensitiveInfo(){
    String formattedNum = '**** ***' + num.substring(num.length - 2);

    int atIndex = email.indexOf('@');

    String maskedEmail = '*' * (atIndex - 3) + email.substring(atIndex - 3);

  }

  // Select Email option
  void selectEmail() {
    emit(RecoveryOption.email);
  }

  // Reset option (if needed)
  void resetOption() {
    emit(RecoveryOption.none);
  }
  void loading() async{
    emit(RecoveryOption.loading);
    Future.delayed(const Duration(seconds: 3), () {

    });
   send();
  }
  void send(){
    emit(RecoveryOption.send);
    print('asdfasfsdfsd');
  }
}
