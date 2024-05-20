import 'package:flutter/material.dart';

class VisitCardWidget extends StatefulWidget {
  final int visitAmount;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final DecorationImage? backgroundImage;
  final Widget Function(BuildContext context, int index) itemBuilder;

  const VisitCardWidget({
    super.key,
    required this.visitAmount,
    required this.itemBuilder,
    this.margin,
    this.padding,
    this.backgroundColor,
    this.backgroundImage,
  });

  @override
  State<VisitCardWidget> createState() => _VisitCardWidgetState();
}

class _VisitCardWidgetState extends State<VisitCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: widget.padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.black,
        borderRadius: BorderRadius.circular(16),
        image: widget.backgroundImage,
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        runSpacing: 8,
        spacing: 8,
        children: List.generate(
          widget.visitAmount,
          (index) => widget.itemBuilder(context, index),
        ),
      ),
    );
  }
}
