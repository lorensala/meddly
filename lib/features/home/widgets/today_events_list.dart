import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/core/core.dart';

class TodayEventsList extends StatelessWidget {
  const TodayEventsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [_NoEvents()],
    );
  }
}

class _NoEvents extends StatelessWidget {
  const _NoEvents();

  @override
  Widget build(BuildContext context) {
    return Text('No events for today');
  }
}

class TodayEventsCard extends StatelessWidget {
  const TodayEventsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Sizes.padding,
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        borderRadius: BorderRadius.circular(Sizes.borderRadius),
      ),
      child: Row(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: context.colorScheme.background,
              borderRadius: BorderRadius.circular(Sizes.borderRadius),
            ),
            child: const SizedBox(
              height: 48,
              width: 48,
              child: Icon(
                Icons.medication_rounded,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(width: Sizes.mediumSpacing),
          Text(
            'Ibuprofeno',
            style: context.textTheme.bodyLarge,
          ),
          const Spacer(),
          // chevron right
          SizedBox(
            height: 48,
            width: 48,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: context.colorScheme.background,
                borderRadius: BorderRadius.circular(Sizes.borderRadius),
              ),
              child: Center(
                child: SvgPicture.asset(
                  Assets.chevron,
                  width: 16,
                  height: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
