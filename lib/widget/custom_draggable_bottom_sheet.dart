import 'package:flutter/material.dart';

// https://github.com/Hitesh822/draggable_bottom_sheet_package/blob/master/lib/draggable_bottom_sheet.dart
class CustomDraggableBottomSheet extends StatefulWidget {
  const CustomDraggableBottomSheet({
    super.key,
    required this.previewWidget,
    required this.backgroundWidget,
    required this.expandedWidget,
    required this.onDragging,
    this.minExtent = 50.0,
    this.collapsed = true,
    this.useSafeArea = true,
    this.curve = Curves.linear,
    this.expansionExtent = 10.0,
    this.barrierDismissible = true,
    this.maxExtent = double.infinity,
    this.barrierColor = Colors.black54,
    this.alignment = Alignment.bottomCenter,
    this.duration = const Duration(milliseconds: 0),
  })  : assert(minExtent > 0.0),
        assert(expansionExtent > 0.0),
        assert(minExtent + expansionExtent < maxExtent);

  /// Alignment of the sheet. Default Alignment.bottomCenter
  final Alignment alignment;

  /// Widget above which draggable sheet will be placed.
  final Widget backgroundWidget;

  /// Color of the modal barrier. Default Colors.black54
  final Color barrierColor;

  /// Whether tapping on the barrier will dismiss the dialog. Default true.
  /// If false, draggable bottom sheet will act as persistent sheet
  final bool barrierDismissible;

  /// Whether the sheet is collapsed initially. Default true.
  /// 화면 사이즈 max or min, 기본값 min
  final bool collapsed;

  /// Sheet expansion animation curve. Default Curves.linear
  final Curve curve;

  /// Duration for sheet expansion animation. Default Duration(milliseconds: 0)
  final Duration duration;

  /// Widget to show on expended sheet
  final Widget expandedWidget;

  /// Increment [expansionExtent] on [minExtent] to change from [previewWidget] to [expandedWidget]
  final double expansionExtent;

  /// Maximum extent for sheet expansion
  final double maxExtent;

  /// Minimum extent for the sheet
  final double minExtent;

  /// Callback function when sheet is being dragged
  /// pass current extent (position) as an argument
  final Function(double) onDragging;

  /// Widget to show on collapsed sheet
  final Widget previewWidget;

  /// indicate if the dialog should only display in 'safe' areas of the screen. Default true
  final bool useSafeArea;

  @override
  State<CustomDraggableBottomSheet> createState() =>
      _CustomDraggableBottomSheetState();
}

class _CustomDraggableBottomSheetState
    extends State<CustomDraggableBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
