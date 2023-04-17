import 'package:flutter/material.dart';
import 'package:meddly/features/browse/provider/provider.dart';

/// {@template browse_body}
/// Body of the BrowsePage.
///
/// Add what it does
/// {@endtemplate}
class BrowseBody extends ConsumerWidget {
  /// {@macro browse_body}
  const BrowseBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(browseProvider);
    return Text(count.toString());
  }
}
