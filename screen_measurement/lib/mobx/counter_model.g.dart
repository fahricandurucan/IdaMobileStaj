// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CounterModel on CounterModelBase, Store {
  late final _$textSizeAtom =
      Atom(name: 'CounterModelBase.textSize', context: context);

  @override
  double get textSize {
    _$textSizeAtom.reportRead();
    return super.textSize;
  }

  @override
  set textSize(double value) {
    _$textSizeAtom.reportWrite(value, super.textSize, () {
      super.textSize = value;
    });
  }

  late final _$rectWidthAtom =
      Atom(name: 'CounterModelBase.rectWidth', context: context);

  @override
  double get rectWidth {
    _$rectWidthAtom.reportRead();
    return super.rectWidth;
  }

  @override
  set rectWidth(double value) {
    _$rectWidthAtom.reportWrite(value, super.rectWidth, () {
      super.rectWidth = value;
    });
  }

  late final _$rectHeightAtom =
      Atom(name: 'CounterModelBase.rectHeight', context: context);

  @override
  double get rectHeight {
    _$rectHeightAtom.reportRead();
    return super.rectHeight;
  }

  @override
  set rectHeight(double value) {
    _$rectHeightAtom.reportWrite(value, super.rectHeight, () {
      super.rectHeight = value;
    });
  }

  late final _$sliderValueAtom =
      Atom(name: 'CounterModelBase.sliderValue', context: context);

  @override
  double get sliderValue {
    _$sliderValueAtom.reportRead();
    return super.sliderValue;
  }

  @override
  set sliderValue(double value) {
    _$sliderValueAtom.reportWrite(value, super.sliderValue, () {
      super.sliderValue = value;
    });
  }

  late final _$counterAtom =
      Atom(name: 'CounterModelBase.counter', context: context);

  @override
  int get counter {
    _$counterAtom.reportRead();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.reportWrite(value, super.counter, () {
      super.counter = value;
    });
  }

  late final _$CounterModelBaseActionController =
      ActionController(name: 'CounterModelBase', context: context);

  @override
  void setSlider(BuildContext context) {
    final _$actionInfo = _$CounterModelBaseActionController.startAction(
        name: 'CounterModelBase.setSlider');
    try {
      return super.setSlider(context);
    } finally {
      _$CounterModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSlider2(BuildContext context, dynamic value) {
    final _$actionInfo = _$CounterModelBaseActionController.startAction(
        name: 'CounterModelBase.setSlider2');
    try {
      return super.setSlider2(context, value);
    } finally {
      _$CounterModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSlider3(BuildContext context) {
    final _$actionInfo = _$CounterModelBaseActionController.startAction(
        name: 'CounterModelBase.setSlider3');
    try {
      return super.setSlider3(context);
    } finally {
      _$CounterModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDefaultSize(BuildContext context) {
    final _$actionInfo = _$CounterModelBaseActionController.startAction(
        name: 'CounterModelBase.setDefaultSize');
    try {
      return super.setDefaultSize(context);
    } finally {
      _$CounterModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateRectSize(double scale, BuildContext context) {
    final _$actionInfo = _$CounterModelBaseActionController.startAction(
        name: 'CounterModelBase.updateRectSize');
    try {
      return super.updateRectSize(scale, context);
    } finally {
      _$CounterModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  double calculateTextSize(BuildContext context) {
    final _$actionInfo = _$CounterModelBaseActionController.startAction(
        name: 'CounterModelBase.calculateTextSize');
    try {
      return super.calculateTextSize(context);
    } finally {
      _$CounterModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementCounter() {
    final _$actionInfo = _$CounterModelBaseActionController.startAction(
        name: 'CounterModelBase.incrementCounter');
    try {
      return super.incrementCounter();
    } finally {
      _$CounterModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
textSize: ${textSize},
rectWidth: ${rectWidth},
rectHeight: ${rectHeight},
sliderValue: ${sliderValue},
counter: ${counter}
    ''';
  }
}
