import 'package:curved_gradient/curved_gradient.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

void main() {
  Paint.enableDithering = true;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeMode _themeMode = ThemeMode.dark;

  void changeTheme() {
    setState(() {
      _themeMode =
          (_themeMode == ThemeMode.dark) ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Curved Gradient Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      themeMode: _themeMode,
      home: MyHomePage(changeTheme: changeTheme),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.changeTheme});

  final VoidCallback changeTheme;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Color _dialogPickerColorFrom =
          const Color(0xFFFF7043) /*Color(0xFFE91E63)*/,
      _dialogPickerColorTo = const Color(0xFFD81B60) /*Color(0xFF8E24AA)*/;

  final ScrollController _scrollController = ScrollController();

  final Map<String, Curve> _curves = <String, Curve>{
    'Linear': Curves.linear,
    'Ease': Curves.ease,
    'Decelerate': Curves.decelerate,
    'Slow Middle': Curves.slowMiddle,
    'Smooth Step': SmoothStepCurve(),
    'Smoother Step': SmootherStepCurve(),
    'EaseIn': Curves.easeIn,
    'EaseOut': Curves.easeOut,
    'EaseInOut': Curves.easeInOut,
    'EaseInSine': Curves.easeInSine,
    'EaseOutSine': Curves.easeOutSine,
    'EaseInOutSine': Curves.easeInOutSine,
    'EaseInQuad': Curves.easeInQuad,
    'EaseOutQuad': Curves.easeOutQuad,
    'EaseInOutQuad': Curves.easeInOutQuad,
    'EaseInCubic': Curves.easeInCubic,
    'EaseOutCubic': Curves.easeOutCubic,
    'EaseInOutCubic': Curves.easeInOutCubic,
    'EaseInQuart': Curves.easeInQuart,
    'EaseOutQuart': Curves.easeOutQuart,
    'EaseInOutQuart': Curves.easeInOutQuart,
    'EaseInQuint': Curves.easeInQuint,
    'EaseOutQuint': Curves.easeOutQuint,
    'EaseInOutQuint': Curves.easeInOutQuint,
    'EaseInExpo': Curves.easeInExpo,
    'EaseOutExpo': Curves.easeOutExpo,
    'EaseInOutExpo': Curves.easeInOutExpo,
    'EaseInCirc': Curves.easeInCirc,
    'EaseOutCirc': Curves.easeOutCirc,
    'EaseInOutCirc': Curves.easeInOutCirc,
  };

  Future<bool> colorPickerDialogFrom() async {
    return ColorPicker(
      // Use the dialogPickerColor as start color.
      color: _dialogPickerColorFrom,
      // Update the dialogPickerColor using the callback.
      onColorChanged: (Color color) =>
          setState(() => _dialogPickerColorFrom = color),
      width: 40,
      height: 40,
      borderRadius: 4,
      spacing: 5,
      runSpacing: 5,
      wheelDiameter: 155,
      heading: Text(
        'Select color',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      subheading: Text(
        'Select color shade',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      wheelSubheading: Text(
        'Selected color and its shades',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      showMaterialName: true,
      showColorName: true,
      showColorCode: true,
      copyPasteBehavior: const ColorPickerCopyPasteBehavior(
        longPressMenu: true,
      ),
      materialNameTextStyle: Theme.of(context).textTheme.bodySmall,
      colorNameTextStyle: Theme.of(context).textTheme.bodySmall,
      colorCodeTextStyle: Theme.of(context).textTheme.bodySmall,
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.both: false,
        ColorPickerType.primary: true,
        ColorPickerType.accent: true,
        ColorPickerType.bw: false,
        ColorPickerType.custom: true,
        ColorPickerType.wheel: true,
      },
      //customColorSwatchesAndNames: colorsNameMap,
    ).showPickerDialog(
      context,
      // New in version 3.0.0 custom transitions support.
      transitionBuilder: (BuildContext context, Animation<double> a1,
          Animation<double> a2, Widget widget) {
        final double curvedValue =
            Curves.easeInOutBack.transform(a1.value) - 1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
          child: Opacity(
            opacity: a1.value,
            child: widget,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 400),
      constraints:
          const BoxConstraints(minHeight: 460, minWidth: 300, maxWidth: 320),
    );
  }

  Future<bool> colorPickerDialogTo() async {
    return ColorPicker(
      // Use the dialogPickerColor as start color.
      color: _dialogPickerColorTo,
      // Update the dialogPickerColor using the callback.
      onColorChanged: (Color color) =>
          setState(() => _dialogPickerColorTo = color),
      width: 40,
      height: 40,
      borderRadius: 4,
      spacing: 5,
      runSpacing: 5,
      wheelDiameter: 155,
      heading: Text(
        'Select color',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      subheading: Text(
        'Select color shade',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      wheelSubheading: Text(
        'Selected color and its shades',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      showMaterialName: true,
      showColorName: true,
      showColorCode: true,
      copyPasteBehavior: const ColorPickerCopyPasteBehavior(
        longPressMenu: true,
      ),
      materialNameTextStyle: Theme.of(context).textTheme.bodySmall,
      colorNameTextStyle: Theme.of(context).textTheme.bodySmall,
      colorCodeTextStyle: Theme.of(context).textTheme.bodySmall,
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.both: false,
        ColorPickerType.primary: true,
        ColorPickerType.accent: true,
        ColorPickerType.bw: false,
        ColorPickerType.custom: true,
        ColorPickerType.wheel: true,
      },
      //customColorSwatchesAndNames: colorsNameMap,
    ).showPickerDialog(
      context,
      // New in version 3.0.0 custom transitions support.
      transitionBuilder: (BuildContext context, Animation<double> a1,
          Animation<double> a2, Widget widget) {
        final double curvedValue =
            Curves.easeInOutBack.transform(a1.value) - 1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
          child: Opacity(
            opacity: a1.value,
            child: widget,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 400),
      constraints:
          const BoxConstraints(minHeight: 460, minWidth: 300, maxWidth: 320),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      if (Theme.of(context).platform == TargetPlatform.android ||
          Theme.of(context).platform == TargetPlatform.iOS) {
        print('running on mobile browser');
      } else {
        print('running on desktop browser');
      }
    } else {
      print('not running on browser');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: widget.changeTheme,
          icon: Icon(Theme.of(context).brightness == Brightness.dark
              ? Icons.dark_mode_rounded
              : Icons.light_mode_rounded),
        ),
        actions: <Padding>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                const Text(
                  'From: ',
                  //style: TextStyle(color: Colors.black),
                ),
                const SizedBox(width: 4.0),
                Expanded(
                  child: ColorIndicator(
                    width: 44,
                    height: 44,
                    borderRadius: 4,
                    color: _dialogPickerColorFrom,
                    onSelectFocus: false,
                    onSelect: () async {
                      // Store current color before we open the dialog.
                      final Color colorBeforeDialog = _dialogPickerColorFrom;
                      // Wait for the picker to close, if dialog was dismissed,
                      // then restore the color we had before it was opened.
                      if (!(await colorPickerDialogFrom())) {
                        setState(() {
                          _dialogPickerColorFrom = colorBeforeDialog;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                const Text(
                  'To: ',
                  //style: TextStyle(color: Colors.black),
                ),
                const SizedBox(width: 4.0),
                Expanded(
                  child: ColorIndicator(
                    width: 44,
                    height: 44,
                    borderRadius: 4,
                    color: _dialogPickerColorTo,
                    onSelectFocus: false,
                    onSelect: () async {
                      // Store current color before we open the dialog.
                      final Color colorBeforeDialog = _dialogPickerColorTo;
                      // Wait for the picker to close, if dialog was dismissed,
                      // then restore the color we had before it was opened.
                      if (!(await colorPickerDialogTo())) {
                        setState(() {
                          _dialogPickerColorTo = colorBeforeDialog;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: ConditionalParent(
        wrap: kIsWeb &&
            Theme.of(context).platform != TargetPlatform.android &&
            Theme.of(context).platform != TargetPlatform.iOS,
        child: GridView.builder(
          physics: kIsWeb &&
                  Theme.of(context).platform != TargetPlatform.android &&
                  Theme.of(context).platform != TargetPlatform.iOS
              ? const NeverScrollableScrollPhysics()
              : const ClampingScrollPhysics(),
          controller: kIsWeb &&
                  Theme.of(context).platform != TargetPlatform.android &&
                  Theme.of(context).platform != TargetPlatform.iOS
              ? _scrollController
              : null,
          itemCount: _curves.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisExtent: 128.0, mainAxisSpacing: 12.0),
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text(_curves.keys.elementAt(index)),
                  const SizedBox(height: 12.0),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.grey),
                        gradient: CurvedGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            _dialogPickerColorFrom,
                            _dialogPickerColorTo
                          ],
                          granularity: 100,
                          curveGenerator: (double t) {
                            return _curves.values.elementAt(index).transform(t);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget ConditionalParent({required bool wrap, required Widget child}) {
    return wrap
        ? WebSmoothScroll(
            controller: _scrollController,
            child: child,
          )
        : child;
  }
}

class SmoothStepCurve extends Curve {
  @override
  double transformInternal(double t) {
    if (t < 0) return 0;
    if (t > 1) return 1;
    return t * t * (3 - (2 * t));
  }
}

class SmootherStepCurve extends Curve {
  @override
  double transformInternal(double t) {
    if (t < 0) return 0;
    if (t > 1) return 1;
    return t * t * t * (t * (t * 6 - 15) + 10);
  }
}
