import 'package:flutter/material.dart';

class GridInfoEpisodesLocation extends StatelessWidget {
  const GridInfoEpisodesLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100,
        childAspectRatio: 3.5 / 5,
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
      ),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          alignment: Alignment.center,
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.red,
          ),
          child: Text('data'),
        );
      },
    );
  }
}
