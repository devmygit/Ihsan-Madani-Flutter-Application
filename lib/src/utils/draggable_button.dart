import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madani/src/bloc/accessibility/accessibility_cubit.dart';

class DraggableButton extends StatelessWidget {
  const DraggableButton({
    super.key,
    required this.child,
    required this.maxHeight,
    required this.maxWidth,
  });
  final Widget child;
  final double maxHeight;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: context.watch<AccessibilityCubit>().state.draggingX,
      top: context.watch<AccessibilityCubit>().state.draggingY,
      child: Listener(
        onPointerMove: (moveEvent) {
          double newPositionX =
              context.read<AccessibilityCubit>().state.draggingX +
                  moveEvent.delta.dx;
          double newPositionY =
              context.read<AccessibilityCubit>().state.draggingY +
                  moveEvent.delta.dy;

          log('accessibility: ${newPositionX}, ${newPositionY},');

          if (newPositionX > maxWidth) {
            context.read<AccessibilityCubit>().draggingPositionX(x: maxWidth);
          } else if (newPositionX < 0) {
            context.read<AccessibilityCubit>().draggingPositionX(x: 0);
          } else {
            context
                .read<AccessibilityCubit>()
                .draggingPositionX(x: newPositionX);
          }

          if (newPositionY > maxHeight - 130) {
            context
                .read<AccessibilityCubit>()
                .draggingPositionY(y: maxHeight - 130);
          } else if (newPositionY < 40) {
            context.read<AccessibilityCubit>().draggingPositionY(y: 40);
          } else {
            context
                .read<AccessibilityCubit>()
                .draggingPositionY(y: newPositionY);
          }
        },
        child: child,
      ),
    );
  }
}
