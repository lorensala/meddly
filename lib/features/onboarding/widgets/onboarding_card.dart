import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/core/core.dart';

class OnboardingCard extends StatelessWidget {
  const OnboardingCard({
    super.key,
    required this.asset,
    required this.title,
    required this.description,
  });
  factory OnboardingCard.diagnosis() => const OnboardingCard(
        asset: Assets.diagnosis,
        title: 'Realiza un auto diagnóstico',
        description:
            'A través del ingreso de síntomas o por un escáner, descubre cuál podría ser tu diagnóstico.',
      );

  factory OnboardingCard.pills() => const OnboardingCard(
        asset: Assets.pills,
        title: 'Registra tus medicamentos',
        description:
            'Recibe recordatorios personalizados de tus medicamentos y citas con el médico.',
      );

  factory OnboardingCard.treatment() => const OnboardingCard(
        asset: Assets.treatment,
        title: 'Sigue tu tratamiento',
        description:
            'Personaliza tu perfil de salud y lleva el control de tus datos con una cuenta gratuita.',
      );

  final String asset;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Sizes.padding,
      child: Column(
        children: [
          Expanded(flex: 4, child: SvgPicture.asset(asset)),
          const SizedBox(height: 30),
          Column(
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      ),
    );
  }
}
