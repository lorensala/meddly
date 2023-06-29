import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/core/core.dart';

class Button extends StatelessWidget {
  const Button({
    required this.onPressed,
    required this.label,
    this.isLoading = false,
    this.isValid = true,
    this.prefix,
    this.elevation,
    this.shrink = true,
    super.key,
  });

  final bool isLoading;
  final bool isValid;
  final VoidCallback onPressed;
  final String label;
  final String? prefix;
  final double? elevation;
  final bool shrink;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        height: Sizes.buttonHeight,
        width: isLoading && shrink
            ? Sizes.buttonHeight
            : MediaQuery.of(context).size.width,
        duration: const Duration(milliseconds: 100),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: elevation ?? 0,
          ),
          onPressed: isValid
              ? !isLoading
                  ? () {
                      HapticFeedback.lightImpact();
                      FocusScope.of(context).unfocus();
                      onPressed();
                    }
                  : () {}
              : null,
          child: isLoading
              ? SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                )
              : prefix == null
                  ? Text(label, overflow: TextOverflow.ellipsis)
                  : SizedBox(
                      height: 24,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: Sizes.medium,
                              ),
                              child: SvgPicture.asset(
                                prefix!,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              label,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
        ),
      ),
    );
  }
}
