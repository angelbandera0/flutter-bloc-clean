import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base/widget_base_state.dart';
import '../bloc/sign_up/sign_up_bloc.dart';
import 'log_in_page.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({Key? key}) : super(key: key);

  @override
  _SingUpPageState createState() => _SingUpPageState();
}

class _SingUpPageState extends StateWithBloC<SingUpPage, SignUpBloc> {
  String fullName = "";
  String email = "";
  String pass = "";
  String repass = "";
  String? country = "+1";
  String number = "";

  final keyForm = GlobalKey<FormState>();
  final passwordRegExp = RegExp(
      r"^(?=.{8,})(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+*!=]).*$");

  @override
  Widget buildWidget(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    final _padding = MediaQuery.of(context).padding;
    final _appBarPreferredSize = _screenSize.height * 0.15;
    return BlocConsumer<SignUpBloc, SignUpState>(listener: (context, state) {
      if (state is SingUpSuccessState) {

      }
      return;
    }, builder: (context, state) {
      return  Scaffold(
          resizeToAvoidBottomInset: true,

          backgroundColor: Color(0xFF2E3238),
          body: Form(
            key: keyForm,
            child: Container(
              height:
                  (_screenSize.height - _appBarPreferredSize - _padding.top),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color(0xFF34393F),
                    Color(0xFF1B1C20),
                  ])),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    ElevatedButton(

                      onPressed: () {
                        if (keyForm.currentState?.validate() ?? false) {
                          print(number);
                          bloc?.add(SignUpSentEvent(
                              fullName, email, pass, repass, country!, number));
                        }
                      }, child: Text('Sign Up'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (_) => LogInPage()
                                 ),
                          (route) => false),
                      child: Text(
                        'I am already a member',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          color: Color(0xFFFF4F01),
                        ),
                      ),
                    ),
                    SizedBox(height: _screenSize.height * 0.02),
                  ],
                ),
              ),
            ),
          ),

      );
    });
  }
}
