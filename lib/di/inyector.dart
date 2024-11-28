import 'dart:async';

import 'package:flutter/widgets.dart' as Material;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

import '../core/global/data/user_profile.dart';
import '../core/global/endpoints.dart';
import '../core/platform/connectivity.dart';
import '../core/platform/network_handler.dart';
import '../core/platform/shared_prefs.dart';
import '../core/utils/logger.dart';
import '../feature/account_management/data/datasourse/account_management_remote_api.dart';
import '../feature/account_management/data/respository/account_management_repository_demo_impl.dart';
import '../feature/account_management/data/respository/account_management_repository_impl.dart';
import '../feature/account_management/domain/repository/account_management_repository.dart';
import '../feature/account_management/domain/usercases/log_in_credential_usercase.dart';
import '../feature/account_management/domain/usercases/log_in_usercase.dart';
import '../feature/account_management/domain/usercases/sign_up_usercase.dart';
import '../feature/account_management/domain/usercases/validate_phone_usecase.dart';
import '../feature/account_management/presentation/bloc/log_in/log_in_bloc.dart';
import '../feature/account_management/presentation/bloc/recover_account/recover_account_bloc.dart';
import '../feature/account_management/presentation/bloc/sign_up/sign_up_bloc.dart';



///Part dependency injector engine and Part service locator.
///The main purpose of [Injector] is to provide bloCs instances and initialize the app components depending the current scope.
///To reuse a bloc instance in the widget's tree feel free to use the [BlocProvider] mechanism.
class Injector {
  ///Singleton instance
  static Injector? instance;

  KiwiContainer container = KiwiContainer();

  ///API base url
  static late String apiBaseUrl;

  ///Api url validator
  static late String apiGateway;

  ///IP Server
  static late String ipServer;

  static late Material.GlobalKey<Material.NavigatorState> navigatorKey;

  ///Init the injector with prod configurations
  static initProd() {
    apiBaseUrl = Endpoint.apiBaseUrlProd;

    apiGateway = Endpoint.API_GATEWAY_PROD;

    ipServer = Endpoint.IP_SERVER_PROD;

    if (instance == null) instance = Injector._init();
  }

  ///Init the injector with demo configurations
  static initDev() {
    apiBaseUrl = Endpoint.apiBaseUrl;

    apiGateway = Endpoint.API_GATEWAY;
    ipServer = Endpoint.IP_SERVER;

    if (instance == null) instance = Injector._init();
  }

  ///Init the injector with demo configurations
  static initDemo() {
    if (instance == null) instance = Injector._demo();
  }

  ///Init
  Injector._init() {
    navigatorKey = Material.GlobalKey(debugLabel: "Main Navigator");
    _registerLocalAuth();
    _registerCommonImpl();
    _registerModelConverters();
    _registerDaoLayer();
    _registerApiLayer();
    _registerDBLayer();
    _registerBloCs();
    _registerUserCaseLayer();
    //repositories
    _registerRepositoryLayer();
  }

  ///Init Demo
  Injector._demo() {
    _registerLocalAuth();
    _registerCommonImpl();
    _registerModelConverters();
    _registerDaoLayer();
    _registerApiLayer();
    _registerBloCs();
    _registerUserCaseLayer();
    //demo repositories
    _registerDemoRepositoryLayer();
  }

  _registerDemoRepositoryLayer() {
    container.registerSingleton<AccountManagementRepository>(
        (c) => AccountManagementRepositoryDemoImpl());
    //container.registerSingleton<CarRepository>((c) => CardRepositoryImpl());
    container.registerSingleton<UserProfile>((c) => UserProfileImpl());
  }

  _registerLocalAuth() {}

  _registerApiLayer() {
    container.registerSingleton<AccountManagementRemoteApi>(
        (c) => AccountManagementRemoteApiImpl(c.resolve()));
    container.registerSingleton<UserProfile>((c) => UserProfileImpl());

  }

  _registerUserCaseLayer() {
    container
        .registerFactory((container) => LogInUserCase(container.resolve()));
    container.registerFactory(
        (container) => LogInRememberUseCase(container.resolve()));
    container
        .registerFactory((container) => SignUpUserCase(container.resolve()));


  }

  _registerDBLayer() {
    // container.registerSingleton<ICategoryDb, CategoryDbImplementation>(
    //     (c) => CategoryDbImplementation(container.resolve()));
  }

  _registerDaoLayer() {
//    container.registerSingleton<IUserDAO, UserDao>(
//        (c) => UserDao(container.resolve(), container.resolve()));
//    container.registerSingleton<IContactDao, ContactDao>((c) => ContactDao());
  }

  _registerRepositoryLayer() {
    container.registerSingleton<AccountManagementRepository>((c) =>
        AccountManagementRepositoryImpl(
            c.resolve(), c.resolve(), c.resolve(), c.resolve()));

  }

  ///Register the blocs here
  _registerBloCs() {
    container.registerFactory(
        (c) => LogInBloc(c.resolve(), c.resolve(), c.resolve()));
    container.registerFactory((c) => SignUpBloc(c.resolve()));

    container.registerFactory((c) => RecoverAccountBloc(c.resolve()));

  }

  _registerModelConverters() {
//    container.registerSingleton<IUserConverter, UserConverter>(
//      (c) => UserConverter(),
//    );
  }

  ///Register common components
  _registerCommonImpl() {
    container.registerSingleton<Logger>((c) => LoggerImpl());
    container.registerSingleton((c) => SharedPreferencesManager());
    container.registerSingleton(
      (c) => NetworkHandler(container.resolve(), container.resolve()),
    );

    container.registerSingleton((container) => StreamController.broadcast());
    container.registerSingleton((container) => ConnectivityService());

  }

  ///returns the current instance of the logger
  Logger getLogger() => container.resolve();

  ///returns a new bloc instance
  T getNewBloCLibrary<T extends Bloc>() => container.resolve();

  NetworkHandler get networkHandler => container.resolve();

  SharedPreferencesManager get sharedPreferences => container.resolve();

  StreamController get streamController => container.resolve();

  ConnectivityService get connectivityService => container.resolve();


  T getDependency<T>() => container.resolve();
}
