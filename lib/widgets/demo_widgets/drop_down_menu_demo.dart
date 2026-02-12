import 'package:flutter/material.dart';

class DropDownMenuDemo<T> extends StatelessWidget {
  const DropDownMenuDemo({
    super.key,
    required this.child,
    required this.items,
    this.initialSelection,
    this.textEditingController,
    required this.onSelected,
    this.leadingIcon,
    this.enableFilter,
    this.width,
    this.showBorder = true,
    this.requestFocusOnTap,
  });
  final Widget child;
  final ValueChanged<T?> onSelected;
  final List<DropdownMenuEntry<T>> items;
  final T? initialSelection;
  final TextEditingController? textEditingController ;
  final IconData? leadingIcon;
  final bool? enableFilter;
  final double? width;
  final bool showBorder;
  final bool? requestFocusOnTap;

  @override
  Widget build(final BuildContext context) {
    final double corner = 16.0; 
    return DropdownMenu<T>(
      label: child,
      width: width,
      initialSelection: initialSelection,
      enableFilter: enableFilter ?? true,
      dropdownMenuEntries: items,
      leadingIcon: leadingIcon != null ? Icon(leadingIcon) : null,
      onSelected: (final value) {
        onSelected.call(value);
      },
      controller: textEditingController,
      requestFocusOnTap: requestFocusOnTap ?? false,
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: showBorder ? Colors.grey.shade300 : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(corner),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: showBorder ? Colors.grey.shade300 : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(corner),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: showBorder ? Colors.red : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(corner),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: showBorder ? Colors.red : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(corner),
        ),
      ),
    );
  }
}
