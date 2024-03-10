import 'package:eastern_dragon/core/common/data/models/user/user_model.dart';
import 'package:eastern_dragon/core/common/domain/user/user_data_worker.dart';
import 'package:eastern_dragon/core/router/router.dart';
import 'package:elementary_helper/elementary_helper.dart';

class UserAuthEntity {
  UserAuthEntity() {
    userListenable.addListener(_routeRefresher);
  }

  final _userState = StateNotifier<UserModel>();

  ListenableState<UserModel> get userListenable => _userState;

  UserModel? get user => _userState.value;

  Future<void> setUserState(UserModel state) async {
    _userState.accept(state);

    UserDataWorker.writeUserId(state.id);
  }

  Future<void> readUserAuthState() async {
    final userId = await UserDataWorker.readUserId();

    if (userId == null) {
      return;
    }

    _userState.accept(UserModel(id: userId));
  }

  Future<void> updateUserData({
    String? email,
    String? name,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    _userState.accept(
      user!.copyWith(
        email: email,
        name: name,
      ),
    );
  }

  Future<void> logout() async {
    await UserDataWorker.removeUserId();

    _userState.accept(null);
  }

  void _routeRefresher() {
    AppRouter.router.refresh();
  }
}
