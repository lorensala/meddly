import 'package:meddly/l10n/l10n.dart';
import 'package:notifications/notifications.dart';

extension NotificationExceptionX on NotificationException {
  String describe(AppLocalizations l10n) {
    return switch (this) {
      NotificationNotFoundException() => l10n.notificationPreferenceNotFound,
      NotificationAlreadyExistsException() =>
        l10n.notificationPreferenceAlreadyExistsError,
      NotificationDontExistsException() =>
        l10n.notificationPreferenceDoesNotExistError,
      NotificationConnectionException() => l10n.connectionError,
      NotificationCacheException() => l10n.unknownError,
      NotificationSerializationException() => l10n.unknownError,
      NotificationUnknownException() => l10n.unknownError,
    };
  }
}
