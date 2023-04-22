import 'package:meddly/l10n/l10n.dart';
import 'package:user/user.dart';

extension UserFailureX on UserFailure {
  String message(AppLocalizations l10n) {
    return maybeWhen(
        notFound: () => l10n.userNotFound,
        timeout: () => l10n.timeout,
        sendTimeout: () => l10n.timeout,
        receiveTimeout: () => l10n.timeout,
        orElse: () => l10n.unknownError,);
  }
}
