import 'package:eastern_dragon/common/domain/user/user_data_worker.dart';
import 'package:elementary_helper/elementary_helper.dart';

class UserAuthEntity {
  ///
  final _isAuthState = StateNotifier<bool>(initValue: false);

  ListenableState<bool> get userAuthListenable => _isAuthState;

  bool get isAuth => _isAuthState.value!;

  void setUserAuthState(bool state) {
    _isAuthState.accept(state);

    UserDataWorker.writeUserAuthState(state);
  }

  Future<void> readUserAuthState() async {
    final authData = await UserDataWorker.readUserAuthState();

    if (authData == null) return;

    _isAuthState.accept(authData);
  }
}
