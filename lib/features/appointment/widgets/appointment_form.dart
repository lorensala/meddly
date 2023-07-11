import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/appointment/appointment.dart';

class AppointmentForm extends StatelessWidget {
  const AppointmentForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: const Padding(
          padding: EdgeInsets.all(Sizes.medium),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppointmentNameInput(),
              AppointmentSpecialityDropDown(),
              AppointmentDateSelector(),
              AppointmentDoctorInput(),
              AppointmentLocationInput(),
              AppointmentNotesInput(),
            ],
          ),
        ),
      ),
    );
  }
}
