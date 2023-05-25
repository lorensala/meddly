import 'package:meddly/l10n/l10n.dart';
import 'package:notifications/notifications.dart';

extension NotificationFailureX on NotificationFailure {
  String message(AppLocalizations l10n) {
    return maybeWhen(
        notFound: () => l10n.notificationPreferenceNotFound,
        timeout: () => l10n.timeout,
        sendTimeout: () => l10n.timeout,
        receiveTimeout: () => l10n.timeout,
        orElse: () => l10n.unknownError,
        alreadyExists: () => l10n.notificationPreferenceAlreadyExistsError,
        doesNotExist: () => l10n.notificationPreferenceDoesNotExistError,);
  }
}
