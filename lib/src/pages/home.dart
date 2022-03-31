import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final Color bgColor = const Color(0xFF2f3740);
  final Color iconColor = Colors.white70;
  final List<Color> buttonsColor = [
    const Color(0xFFfcabc8),
    const Color(0xFFc5f3f2),
    const Color(0xFFfad716),
  ];

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Text(
              '12 * 457',
              style: TextStyle(
                fontFamily: 'Digital',
                fontSize: 28,
                color: Colors.grey,
              ),
              textAlign: TextAlign.end,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '14,321',
              style: TextStyle(
                fontFamily: 'Digital',
                fontSize: 55,
                color: Colors.white,
                letterSpacing: 2,
              ),
              textAlign: TextAlign.end,
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
                        buildButton("½", 1, _color[0], size),
                        buildButton("÷", 1, _color[0], size),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("7", 1, _color[1], size),
                        buildButton("8", 1, _color[1], size),
                        buildButton("9", 1, _color[1], size),
                        buildButton("×", 1, _color[0], size),
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
        onPressed: () {},
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        style: NeumorphicStyle(
            shape: NeumorphicShape.flat,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
            depth: 8,
            lightSource: LightSource.topLeft,
            intensity: 0.4,
            color: buttonColor),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            buttonText,
            style: const TextStyle(color: Colors.white, fontSize: 32),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
