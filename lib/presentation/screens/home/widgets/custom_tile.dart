import 'package:flutter_ics_homescreen/export.dart';

class CustomTile extends StatelessWidget {
  final String name;
  final Color color;
  final VoidCallback callback;
  const CustomTile({
    super.key,
    required this.name,
    required this.color,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate the container size based on the app size
    //final size = MediaQuery.of(context).size;
    // final width = size.width * 0.15;
    // final height = size.height * 0.15;
    return Expanded(
      child: GestureDetector(
        onTap: callback,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            height: 150, //height,
            width: 150, //width,
            color: color,
            child: Center(
              child: Text(
                name,
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
                style: const TextStyle(
                  color: Colors.white,
                  //fontSize: width * 0.15,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
