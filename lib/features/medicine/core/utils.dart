import 'package:calendar/calendar.dart';
import 'package:flutter/material.dart';
import 'package:meddly/l10n/l10n.dart';

String getl10nFrecuency(MedicineFrecuency frecuency, BuildContext context) {
  switch (frecuency) {
    case MedicineFrecuency.regular:
      return context.l10n.medicineFrecuencyRegular;
    case MedicineFrecuency.specificDays:
      return context.l10n.medicineFrecuencySpecificDays;
    case MedicineFrecuency.asNeeded:
      return context.l10n.medicineFrecuencyAsNeeded;
  }
}
