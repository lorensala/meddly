import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/core/core.dart';

class NotificationListItem extends StatelessWidget {
  const NotificationListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      background: ColoredBox(
        color: context.colorScheme.error,
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: Sizes.medium),
            child: SvgPicture.asset(
              Vectors.trash,
            ),
          ),
        ),
      ),
      key: const Key('notification'),
      onDismissed: (direction) {
        // TODO(me): ...
        if (direction == DismissDirection.endToStart) {}
      },
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        tileColor: context.colorScheme.secondary,
        leading: const SizedBox(
            height: double.infinity,
            child: Icon(Icons.medical_services_outlined),),
        title: Text(
          'Tomar medicamento',
          style: context.textTheme.titleMedium,
        ),
        subtitle: Text(
          'Debes tomar Tafirol 200ml',
          style: context.textTheme.bodyMedium!.copyWith(
            color: context.colorScheme.onSecondary.withOpacity(0.5),
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Text(
          '09:00',
          style: context.textTheme.bodyMedium!.copyWith(
            color: context.colorScheme.onSecondary.withOpacity(0.5),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
