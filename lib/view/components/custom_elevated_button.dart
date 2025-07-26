import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.verticalPadding,
    required this.onTap,
    this.color,
    this.colors,
    required this.child,
  });
  final double verticalPadding;
  final void Function() onTap;
  final Color? color;
  final List<Color>? colors;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: color,
          gradient: colors == null ? null : LinearGradient(colors: colors!),
        ),
        child: child,
      ),
    );
  }
}
