import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show HapticFeedback;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/sign_up/sign_up.dart';
import 'package:meddly/l10n/l10n.dart';

class TermsAndConditions extends ConsumerWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(signUpControllerProvider.notifier);
    final termsAndConditions = ref.watch(termsAndConditionsProvider);

    return Row(
      children: [
        Checkbox(
          materialTapTargetSize: MaterialTapTargetSize.padded,
          activeColor: context.colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
          value: termsAndConditions.value,
          onChanged: (bool? value) {
            HapticFeedback.lightImpact();
            notifier.onTermsAcceptedChanged(value: value!);
          },
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '${context.l10n.accept} ',
                  style: context.textTheme.bodyMedium,
                ),
                TextSpan(
                  text: context.l10n.termsAndConditions,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      final result = await Navigator.of(context).push<bool>(
                        MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (BuildContext context) =>
                              const _TermsAndConditionsDialog(),
                        ),
                      );

                      if (result != null && result) {
                        ref
                            .read(signUpControllerProvider.notifier)
                            .onTermsAcceptedChanged(value: true);
                      }
                    },
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: context.colorScheme.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _TermsAndConditionsDialog extends StatelessWidget {
  const _TermsAndConditionsDialog();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Términos y condiciones'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(
              context.l10n.accept,
              style: context.textTheme.bodyMedium!.copyWith(
                color: context.colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Sizes.medium),
          child: Text(
            '''
      Términos y Condiciones de Uso de Meddly
      
      Bienvenido(a) a Meddly. Antes de utilizar nuestra aplicación, te solicitamos que leas detenidamente los siguientes términos y condiciones de uso. Al acceder y utilizar Meddly, aceptas cumplir con estos términos y condiciones en su totalidad.
      
      Aceptación de los Términos y Condiciones
      Al utilizar Meddly, aceptas y te comprometes a cumplir con los términos y condiciones establecidos en este documento. Si no estás de acuerdo con alguno de estos términos, te pedimos que no utilices Meddly.
      
      Uso de Datos e Imágenes
        2.1 Recopilación y Uso de Datos_
      Meddly recopila datos personales y médicos proporcionados por el usuario para realizar diagnósticos médicos orientativos. Estos datos pueden incluir, pero no se limitan a, información de contacto, historial médico y síntomas reportados. Utilizamos estos datos de forma confidencial y solo para los fines descritos en nuestra Política de Privacidad.
        2.2 Uso de Imágenes_
      Meddly también permite al usuario cargar imágenes médicas para su análisis y diagnóstico orientativo. Estas imágenes se utilizarán de manera anónima y agregada para mejorar y reentrenar nuestro modelo de inteligencia artificial. Nos comprometemos a proteger la privacidad y confidencialidad de las imágenes proporcionadas.
      
      Limitaciones del Diagnóstico
      Es importante destacar que Meddly proporciona diagnósticos médicos orientativos basados en la información proporcionada por el usuario. Sin embargo, estos diagnósticos no constituyen un diagnóstico médico oficial ni tienen validez médica real. Siempre recomendamos que consultes a un médico o profesional de la salud calificado para obtener un diagnóstico médico confiable y preciso.
      
      Responsabilidad del Usuario
      El usuario asume toda la responsabilidad derivada del uso de Meddly y de la interpretación de los resultados y diagnósticos orientativos proporcionados. No nos responsabilizamos por cualquier daño, pérdida o consecuencia derivada del uso de la aplicación.
      
      Actualización y Modificación
      Nos reservamos el derecho de actualizar y modificar estos términos y condiciones en cualquier momento. Te recomendamos revisar periódicamente estos términos para estar al tanto de cualquier cambio. El uso continuado de Meddly después de cualquier modificación se considerará como aceptación de los términos actualizados.
      
      Contacto
      Si tienes alguna pregunta o inquietud sobre estos términos y condiciones, no dudes en contactarnos a través de los canales proporcionados en la aplicación.
      Al utilizar Meddly, confirmas que has leído, entendido y aceptado estos términos y condiciones de uso. Te recomendamos revisar también nuestra Política de Privacidad para obtener información detallada sobre cómo manejamos y protegemos tus datos personales y médicos.''',
            style: TextStyle(
              fontFamily: 'Times New Roman',
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
