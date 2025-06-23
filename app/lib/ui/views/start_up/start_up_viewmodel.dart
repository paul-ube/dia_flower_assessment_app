import 'package:dia_flowers_assessment/app/app.locator.dart';
import 'package:dia_flowers_assessment/app/app.router.dart';
import 'package:dia_flowers_assessment/services/shared_preferences_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartUpViewModel extends FutureViewModel {
  final _routerService = locator<RouterService>();
  final _sharedPreferencesService = locator<SharedPreferencesService>();
  // final _fileManagerService = locator<FileManagerService>();
  // final _authenticationService = locator<AuthenticationService>();
  // final _userService = locator<UserService>();
  // final _firebaseMessagingService = locator<FirebaseMessagingService>();

  // StartUpViewModel() : super(navigateToWelcomeOnFailure: true);

  Future<void> runStartupLogic() async {
    _routerService.replaceWith(MainViewRoute());
  }

  @override
  Future futureToRun() => runStartupLogic();
}
