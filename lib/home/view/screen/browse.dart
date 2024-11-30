import 'package:flutter/material.dart';

class CustomBrowse extends StatelessWidget {
  const CustomBrowse({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Align(
            child: Text('Browse Category'),
            alignment: Alignment.topLeft,
          ),
          Expanded(
            child: GridView.builder(
                itemCount: 10,
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 10),
                itemBuilder: (BuildContext, int) {
                  return Stack(children: [
                    Image.network(
                        'https://mir-s3-cdn-cf.behance.net/project_modules/1400/3ed155138856997.6226c3733c226.png'),
                    Center(
                      child: Text(
                        'Action',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ]);
                }),
          ),
        ],
      ),
    );
  }
}
