// Copyright (c) 2023 Sendbird, Inc. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Widgets {
  static const double _borderRadiusValue = 50.0;
  static const BorderRadius _circularBorderRadius = BorderRadius.all(Radius.circular(_borderRadiusValue));
  
  static Text pageTitle(
    String title, {
    int? maxLines,
  }) {
    return Text(
      title,
      style: const TextStyle(fontSize: 16.0),
      maxLines: maxLines ?? 1,
    );
  }

  static Widget imageNetwork(
    String? imageUrl,
    double height,
    IconData errorIcon,
  ) {
    if (imageUrl != null && imageUrl.isNotEmpty) {
      return Image.network(
        imageUrl,
        width: height,
        height: height,
        fit: BoxFit.fitHeight,
        errorBuilder: (context, error, stackTrace) {
          return Icon(errorIcon, size: height);
        },
      );
    } else {
      return Icon(errorIcon, size: height);
    }
  }

  static Widget textField(
    TextEditingController controller,
    String labelText, {
    int? maxLines,
    FocusNode? focusNode,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: _circularBorderRadius,
         ),
        labelText: labelText,
      ),
      maxLines: maxLines ?? 1,
      focusNode: focusNode,
    );
  }

  static Widget textFieldForNum({
    required TextEditingController controller,
    required String labelText,
    required Function(String) onChanged,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.purple),
        ),
        labelText: labelText,
        contentPadding: const EdgeInsets.all(8.0),
      ),
      onChanged: onChanged,
    );
  }
}
