import 'package:eastern_dragon/core/common/domain/user/user_data_worker.dart';
import 'package:elementary_helper/elementary_helper.dart';

class UserAuthEntity {
  final _userIdState = StateNotifier<int>();

  bool get isAuth => _userIdState.value != null;

  Future<void> setUserAuthState(int state) async {
    _userIdState.accept(state);

    UserDataWorker.writeUserId(state);
  }

  Future<void> readUserAuthState() async {
    final authData = await UserDataWorker.readUserId();

    if (authData == null) return;

    _userIdState.accept(authData);
  }

  Future<void> logout() async {
    await UserDataWorker.removeUserId();
    
    _userIdState.accept(null);
  }
}
