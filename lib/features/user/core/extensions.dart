import 'package:meddly/l10n/l10n.dart';
import 'package:user/user.dart';

extension UserExceptionX on UserException {
  String describe(AppLocalizations l10n) {
    return switch (this) {
      UserNotFoundException() => l10n.userNotFound,
      UserSerializationException() => l10n.unknownError,
      UserConnectionException() => l10n.unknownError,
      UserNotYoursException() => l10n.unknownError,
      UserCacheException() => l10n.unknownError,
      UserModelConversionException() => l10n.unknownError,
      UserUnknownException() => l10n.unknownError,
    };
  }
}
