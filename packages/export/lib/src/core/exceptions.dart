sealed class ExportException implements Exception {}

final class ExportUnknownException extends ExportException {}

final class ExportWriteException extends ExportException {}

final class ExportSerializationException extends ExportException {}

final class ExportConnectionException extends ExportException {}
