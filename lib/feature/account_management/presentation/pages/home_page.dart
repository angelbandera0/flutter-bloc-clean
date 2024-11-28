import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/base/widget_base_state.dart';
import '../../../../di/inyector.dart';
import '../bloc/log_out/log_out_bloc.dart';
import 'log_in_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends StateWithBloC<HomePage, LogOutBloc> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return BlocConsumer<LogOutBloc, LogOutState>(
      listener: (context, state) {
        if (state is LogOutSuccessState) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (_) => LogInPage(

                      )),
              (route) => false);
        }
        return;
      },
      builder: (context, state) => Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.transparent,

          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color(0xFF34393F),
                    Color(0xFF1B1C20),
                  ])),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Image.asset(
                              'assets/images/login.png',
                              height: 80,
                              width: 80,
                            ),
                          ),

                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'WELCOME TO',
                              style: TextStyle(
                                color: Color(0xFFC0C1C2),
                                fontFamily: 'Ailerons',
                                fontWeight: FontWeight.w300,
                                letterSpacing: 1.8,
                                fontSize: 26,
                              ),
                              children: const <TextSpan>[
                                TextSpan(
                                    text: ' SPARKZ',
                                    style: TextStyle(color: Color(0xFFFF4F01))),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "A place for you",
                            style: TextStyle(
                                color: Color(0xFFC0C1C2),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w300,
                                fontSize: 16),
                          ),
                          Image.asset(
                            'assets/images/parking_cars.png',
                            height: 200,
                          ),
                          Text(
                            "Do not leave it to chance!, quickly find your",
                            style: TextStyle(
                                color: Color(0xFFC0C1C2),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w300,
                                fontSize: 14),
                          ),
                          Text(
                            "parking space or auction the one you are",
                            style: TextStyle(
                                color: Color(0xFFC0C1C2),
                                fontFamily: 'Montserrat',
                                fontSize: 14),
                          ),
                          Text(
                            "about to leave",
                            style: TextStyle(
                                color: Color(0xFFC0C1C2),
                                fontFamily: 'Montserrat',
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    )
                  ],
                ),
              ),
            ),
          ),
          extendBody: true,

        ),
      );
  }

  void _handleLogOut() => bloc?.add(LogOutSentEvent());
}
