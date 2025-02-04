# Dashed Outline

A Flutter package to easily add dashed borders around widgets.

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  dashed_outline: ^0.0.1
  
import 'package:dashed_outline/dashed_outline.dart';

DashedOutline(
  borderType: BorderType.RRect,
  radius: 12,
  dashPattern: [6, 3, 2, 3],
  child: Container(
    height: 150,
    width: 100,
    color: Colors.amber,
  ),
);
