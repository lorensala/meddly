import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meddly/core/core.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.isLoading = false,
    this.isValid = true,
    required this.onPressed,
    required this.label,
  });

  final bool isLoading;
  final bool isValid;
  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        width:
            isLoading ? Sizes.buttonHeight : MediaQuery.of(context).size.width,
        duration: const Duration(milliseconds: 100),
        child: ElevatedButton(
          onPressed: isValid && !isLoading
              ? () {
                  HapticFeedback.lightImpact();
                  FocusScope.of(context).unfocus();
                  onPressed();
                }
              : null,
          child: isLoading
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                )
              : Text(label),
        ),
      ),
    );
  }
}
