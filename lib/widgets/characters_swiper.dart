import 'package:flutter/material.dart';

class CharacterSwiper extends StatelessWidget {
  // const CharacterSwiper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30.0),
      width: double.infinity,
      height: 180,
      // color: Colors.red,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: ((_, int index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            // color: Colors.lightBlue,
            width: 110,
            height: 80,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage(
                    placeholder: AssetImage('assets/no-image.jpg'),
                    image: AssetImage('assets/no-image.jpg'),
                    fit: BoxFit.cover,
                    height: 140,
                    width: 110,
                    // width: 100,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'nombre.character',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
