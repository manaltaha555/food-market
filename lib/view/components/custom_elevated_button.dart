import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.child,
    required this.onTap,
    required this.colors,
    required this.verticalPadding,
  });
  final double verticalPadding;
  final List<Color> colors ;
  final void Function() onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: child,
      ),
    );
  }
}
