import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String title, description, bannerurl, posterurl, vote;

  const Description(
      {Key key,
      this.title,
      this.description,
      this.bannerurl,
      this.posterurl,
      this.vote})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.height,
                    child: Image.network(
                      bannerurl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Positioned(bottom: 5, child: Text(title))
              ],
            ),
          ),
          Text(title),
          SizedBox(
            height: 70,
          ),
          Row(
            children: [
              Container(
                height: 300,
                width: 200,
                child: Image.network(posterurl),
              ),
              Spacer(),
              Flexible(child: Container(child: Text(description)))
            ],
          )
        ],
      ),
    );
  }
}
