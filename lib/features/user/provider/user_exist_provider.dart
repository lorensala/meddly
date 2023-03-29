import 'package:meddly/core/core.dart';
import 'package:meddly/features/user/provider/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_exist_provider.g.dart';

@riverpod
Future<bool> userExist(UserExistRef ref) async {
  final repository = ref.watch(userRepositoryProvider);

  final res = repository.getUser();

  if (res.isLeft()) {
    return Future.value(false);
  }

  final userOrNull = res.asRight();

  if (userOrNull == null) {
    final res = await repository.fetchUser();

    // TODO(lorenzo): check when there's connection.
    return res.fold(
      (l) => false,
      (r) => true,
    );
  }

  return true;
}
