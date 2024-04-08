import 'dart:math';

import 'package:flutter/material.dart';

/// Class that is a stateful widget which represents the home page of the app.
class HomePage extends StatefulWidget {
  /// Constructor of MyHomePage class
  const HomePage({required this.title, super.key});

  /// Title of our app
  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> with TickerProviderStateMixin {
  final Random _random = Random();
  final int _maxRgbColorNumber = 256;
  final double _minFontSizeValue = 24.0;
  final double _maxFontSizeValue = 30.0;
  Color? _backgroundColor;

  late AnimationController _fontSizeController;
  late Animation<double> _fontSizeAnimation;

  /// The random number from 0 to 255 to obtain RGB color
  int get _randomRgbColorNumber => _random.nextInt(_maxRgbColorNumber);

  @override
  void initState() {
    super.initState();

    _changeBackgroundColor();

    _fontSizeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _fontSizeAnimation = Tween<double>(
      begin: _minFontSizeValue,
      end: _maxFontSizeValue,
    ).animate(_fontSizeController);
  }

  /// Returns randomly generated RGB color
  void _changeBackgroundColor() {
    _backgroundColor = Color.fromRGBO(
      _randomRgbColorNumber,
      _randomRgbColorNumber,
      _randomRgbColorNumber,
      1,
    );
  }

  void _increaseFontSize() {
    _fontSizeController.forward();
  }

  void _resetFontSize() {
    _fontSizeController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(_changeBackgroundColor),
      onTapDown: (_) => _increaseFontSize(),
      onTapUp: (_) => _resetFontSize(),
      onTapCancel: _resetFontSize,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
          color: _backgroundColor,
          child: Center(
            child: AnimatedBuilder(
              animation: _fontSizeAnimation,
              builder: (context, child) {
                return Text(
                  'Hello there',
                  style: TextStyle(fontSize: _fontSizeAnimation.value),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _fontSizeController.dispose();
    super.dispose();
  }
}
