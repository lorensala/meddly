import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:user/user.dart';

class UserCircleAvatar extends StatelessWidget {
  const UserCircleAvatar({
    required this.user,
    required this.radius,
    super.key,
  });

  final User user;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: context.colorScheme.primary,
      child: FittedBox(
        child: Center(
          child: Text(
            _getInitials(),
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: radius - 4,
              color: context.colorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }

  String _getInitials() {
    final firstName = user.firstName;
    final lastName = user.lastName;

    if (firstName.isNotEmpty && lastName.isNotEmpty) {
      return firstName[0] + lastName[0];
    } else if (firstName.isNotEmpty) {
      return firstName[0];
    } else if (lastName.isNotEmpty) {
      return lastName[0];
    } else {
      return Constants.noName;
    }
  }
}
