import 'package:flutter/material.dart';

class ValidatorField {
  static FormFieldValidator<T> compose<T>(List<FormFieldValidator<T>> validators) {
    return (value) {
      for (final validator in validators) {
        final error = validator(value);
        if (error != null) {
          return error;
        }
      }
      return null;
    };
  }

  // TODO: Add more validators
}