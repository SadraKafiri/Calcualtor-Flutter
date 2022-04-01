import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color bgColor = const Color(0xFF2f3740);
  final Color iconColor = Colors.white70;
  final List<Color> buttonsColor = [
    const Color(0xFFfcabc8),
    const Color(0xFFc5f3f2),
    const Color(0xFFfad716),
  ];

  String equation = "0";
  String result = " ";
  String expression = "";
  bool isCalculate = false;

  Color firstTextColor = Colors.white;
  Color secondTextColor = Colors.grey;
  int firstTextFlex = 2;
  int secondTextFlex = 1;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: 450,
              child: Column(
                children: [
                  _buildAppBar(),
                  _buildMonitor(),
                  _buildButtons(_size, buttonsColor),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Row(
      children: [
        NeumorphicButton(
          onPressed: () {},
          padding: const EdgeInsets.all(8),
          style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(60)),
              depth: 8,
              lightSource: LightSource.topLeft,
              intensity: 0.4,
              color: bgColor),
          child: Icon(
            Icons.refresh_outlined,
            color: iconColor,
          ),
        ),
        const SizedBox(width: 15),
        NeumorphicButton(
          onPressed: () {},
          padding: const EdgeInsets.all(8),
          style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(60)),
              depth: 8,
              lightSource: LightSource.topLeft,
              intensity: 0.4,
              color: bgColor),
          child: Icon(
            Icons.settings,
            color: iconColor,
          ),
        ),
        const Spacer(),
        NeumorphicButton(
          onPressed: () {},
          padding: const EdgeInsets.all(8),
          style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(60)),
              depth: 8,
              lightSource: LightSource.topLeft,
              intensity: 0.4,
              color: bgColor),
          child: Icon(
            Icons.close,
            color: iconColor,
          ),
        ),
      ],
    );
  }

  Widget _buildMonitor() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      height: 120,
      child: Neumorphic(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        style: NeumorphicStyle(
          shape: NeumorphicShape.flat,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
          depth: 8,
          shadowDarkColor: Colors.black,
          lightSource: LightSource.topLeft,
          intensity: 0.4,
          color: bgColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: firstTextFlex,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  equation,
                  style: TextStyle(
                    fontFamily: 'Digital',
                    color: firstTextColor,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: secondTextFlex,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  result,
                  style: TextStyle(
                    fontFamily: 'Digital',
                    color: secondTextColor,
                    letterSpacing: 2,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons(Size size, List<Color> _color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SizedBox(
            child: Column(
              children: [
                Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton("C", 1, _color[0], size),
                        buildButton("⌫", 1, _color[0], size),
                        buildButton("%", 1, _color[0], size),
                        buildButton("÷", 1, _color[0], size),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("7", 1, _color[1], size),
                        buildButton("8", 1, _color[1], size),
                        buildButton("9", 1, _color[1], size),
                        buildButton("*", 1, _color[0], size),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("4", 1, _color[1], size),
                        buildButton("5", 1, _color[1], size),
                        buildButton("6", 1, _color[1], size),
                        buildButton("-", 1, _color[0], size),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("1", 1, _color[1], size),
                        buildButton("2", 1, _color[1], size),
                        buildButton("3", 1, _color[1], size),
                        buildButton("+", 1, _color[0], size),
                      ],
                    ),
                  ],
                ),
                Table(
                  columnWidths: const {
                    0: FractionColumnWidth(0.5),
                  },
                  children: [
                    TableRow(
                      children: [
                        buildButton("0", 3, _color[1], size),
                        buildButton(".", 1, _color[1], size),
                        buildButton("=", 1, _color[2], size),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildButton(
      String buttonText, double buttonWidth, Color buttonColor, Size size) {
    return SizedBox(
      height: size.height * 0.1 * 1.25,
      width: size.width * 0.1 * buttonWidth,
      child: NeumorphicButton(
        onPressed: () => buttonPressed(buttonText),
        duration: const Duration(milliseconds: 10),
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        style: NeumorphicStyle(
            shape: NeumorphicShape.flat,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
            depth: 8,
            lightSource: LightSource.topLeft,
            intensity: 0.4,
            color: buttonColor),
        child: FittedBox(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              buttonText,
              style: const TextStyle(color: Colors.white, fontSize: 32),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        result = " ";
        expression = "";
        firstTextColor = Colors.white;
        secondTextColor = Colors.grey;
        firstTextFlex = 2;
        secondTextFlex = 1;
        isCalculate = false;
      } else if (buttonText == "⌫") {
        if (isCalculate) return;

        equation = equation.substring(0, equation.length - 1);
        if (equation == '') {
          equation = "0";
          result = " ";
          expression = "";
          firstTextColor = Colors.white;
          secondTextColor = Colors.grey;
          firstTextFlex = 2;
          secondTextFlex = 1;
          isCalculate = false;
        }

        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '= ${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "= ERROR";
        }
      } else if (buttonText == "+") {
        if (isCalculate) return;
        if (equation.substring(equation.length - 1) != buttonText) {
          equation = equation + "+";
        }
      } else if (buttonText == "-") {
        if (isCalculate) return;
        if (equation.substring(equation.length - 1) != buttonText) {
          equation = equation + "-";
        }
      } else if (buttonText == "*") {
        if (isCalculate) return;
        if (equation.substring(equation.length - 1) != buttonText) {
          equation = equation + "*";
        }
      } else if (buttonText == "÷") {
        if (isCalculate) return;
        if (equation.substring(equation.length - 1) != buttonText) {
          equation = equation + "÷";
        }
      } else if (buttonText == "%") {
      } else if (buttonText == "=") {
        if (isCalculate) return;
        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result =
              '= ${removeDecimalZeroFormat(exp.evaluate(EvaluationType.REAL, cm))}';
          firstTextColor = Colors.grey;
          secondTextColor = Colors.white;
          firstTextFlex = 1;
          secondTextFlex = 2;
          isCalculate = true;
        } catch (e) {
          result = "= ERROR";
        }
      } else {
        if (isCalculate) return;
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }

        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result =
              '= ${removeDecimalZeroFormat(exp.evaluate(EvaluationType.REAL, cm))}';
        } catch (e) {
          result = "= ERROR";
        }
      }
    });
  }

  String removeDecimalZeroFormat(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 1);
  }
}
