import 'dart:io';

import 'package:equatable/equatable.dart';

sealed class ExportState extends Equatable {
  const ExportState();

  @override
  List<Object?> get props => [];
}

final class ExportInitial extends ExportState {
  const ExportInitial();

  @override
  List<Object?> get props => [];
}

final class ExportLoading extends ExportState {
  const ExportLoading({required this.progress});
  final double progress;

  @override
  List<Object?> get props => [progress];
}

final class ExportSuccess extends ExportState {
  const ExportSuccess(this.file);
  final File file;

  @override
  List<Object?> get props => [file];
}

final class ExportError extends ExportState {
  const ExportError(this.err);
  final String err;

  @override
  List<Object?> get props => [err];
}
