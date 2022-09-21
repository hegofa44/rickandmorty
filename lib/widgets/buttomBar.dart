import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_incubapp/providers/providers.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

double _positionSelectedIconBar = 0.01;

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final selectedScreenProvider = Provider.of<SelectedScreenProvider>(context);
    // return BottomNavigationBar(items: [
    //   BottomNavigationBarItem(
    //     icon: Icon(Icons.home),
    //   ),
    //   BottomNavigationBarItem(
    //     icon: Icon(Icons.home),
    //   )
    // ]);
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: size.height * 0.08,
          decoration: _buildBoxDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                child: _CustomIconBar(
                  icon: Icons.supervised_user_circle_rounded,
                  iconText: 'Characters',
                  iconColor: (selectedScreenProvider.opcionSeleccionada == 0)
                      ? Colors.cyanAccent
                      : Colors.white,
                  textColor: (selectedScreenProvider.opcionSeleccionada == 0)
                      ? Colors.cyanAccent
                      : Colors.white,
                ),
                onTap: () {
                  selectedScreenProvider.opcionSeleccionada = 0;
                  selectedScreenProvider.opcionSeleccionada2 = 0.0;
                },
              ),
              GestureDetector(
                child: _CustomIconBar(
                  icon: Icons.map_outlined,
                  iconText: 'Location',
                  iconColor: (selectedScreenProvider.opcionSeleccionada == 1)
                      ? Colors.cyanAccent
                      : Colors.white,
                  textColor: (selectedScreenProvider.opcionSeleccionada == 1)
                      ? Colors.cyanAccent
                      : Colors.white,
                ),
                onTap: () {
                  selectedScreenProvider.opcionSeleccionada = 1;
                  selectedScreenProvider.opcionSeleccionada2 = 0.333;
                },
              ),
              GestureDetector(
                child: _CustomIconBar(
                  icon: Icons.queue_play_next_rounded,
                  iconText: 'Episode',
                  iconColor: (selectedScreenProvider.opcionSeleccionada == 2)
                      ? Colors.cyanAccent
                      : Colors.white,
                  textColor: (selectedScreenProvider.opcionSeleccionada == 2)
                      ? Colors.cyanAccent
                      : Colors.white,
                ),
                onTap: () {
                  selectedScreenProvider.opcionSeleccionada = 2;
                  selectedScreenProvider.opcionSeleccionada2 = 0.666;
                },
              ),
            ],
          ),
        ),
        AnimatedPositioned(
            top: 0,
            left: size.width * selectedScreenProvider.opcionSeleccionada2,
            child: Container(
              alignment: Alignment.center,
              color: Colors.cyanAccent,
              height: 2,
              width: size.width / 3,
            ),
            duration: Duration(milliseconds: 300))
      ],
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
        color: Colors.grey[800],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 10,
            offset: Offset(-10, 5),
          )
        ],
      );
}

class _CustomIconBar extends StatelessWidget {
  final IconData icon;
  final String iconText;
  final Color iconColor;
  final Color textColor;
  const _CustomIconBar({
    Key? key,
    required this.icon,
    required this.iconText,
    required this.iconColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        // margin: EdgeInsets.symmetric(horizontal: 1),
        // padding: EdgeInsets.symmetric(horizontal: 2),
        // color: Colors.red,
        height: size.height * 0.07,
        width: (size.width) / 5,
        child: Column(
          children: [
            Icon(this.icon, color: this.iconColor),
            SizedBox(height: 2),
            Text(this.iconText,
                style: TextStyle(fontSize: 10, color: this.textColor))
          ],
        ));
  }
}
