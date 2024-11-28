import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean/feature/account_management/presentation/pages/sign_up_page.dart';

import '../../../../core/base/widget_base_state.dart';
import '../bloc/log_in/log_in_bloc.dart';
import 'home_page.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);


  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends StateWithBloC<LogInPage, LogInBloc> {
  bool showSpinner = false;
  final passwordRegExp = RegExp(
      r"^(?=.{8,})(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+*!=]).*$");

  final keyForm = GlobalKey<FormState>();

  late String email;
  late String password;
  late bool rememberMe;

  FocusNode userNameNode = FocusNode();
  FocusNode passwordNode = FocusNode();

  @override
  void initState() {
    super.initState();
    email = "";
    password = "";
    rememberMe = false;
    bloc?.add(LogInRememberEvent());
  }

  @override
  Widget buildWidget(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return BlocConsumer<LogInBloc, LogInState>(listener: (context, state) {
      if (state is LogInSuccessState) {

            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
      }
      return;
    }, builder: (context, state) {
      return Scaffold(
          backgroundColor: Color(0xFF34393F),
          body: Form(
              key: keyForm,
              child: SingleChildScrollView(
                  child: SafeArea(
                child: Container(
                  height:
                      _screenSize.height - MediaQuery.of(context).padding.top,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF34393F),
                      Color(0xFF1B1C20),
                    ],
                  )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      SizedBox(
                        height: _screenSize.height * 0.01,
                      ),

                      Container(
                        margin: const EdgeInsets.only(left: 6, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: _screenSize.width * 0.044,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFFF4F01),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: _screenSize.height * 0.01,
                      ),
                      Center(
                        child: ElevatedButton(
                          child: Text('Login'),
                          onPressed: () {
                            if (keyForm.currentState?.validate() ?? false)
                              bloc?.add(
                                  LogInSendEvent(email, password, rememberMe));
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: _screenSize.width * 0.044,
                                fontWeight: FontWeight.w500,
                                color: (Color(0xFFC0C1C2)),
                              ),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SingUpPage()));
                              },
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: _screenSize.width * 0.044,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFFF4F01),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ))),
        );

    });
  }
}
