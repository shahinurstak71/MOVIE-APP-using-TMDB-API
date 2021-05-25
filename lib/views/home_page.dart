import 'package:flutter/material.dart';
import 'package:movieapp/description.dart';
import 'package:movieapp/models/model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
  //final List ProductionCompany;

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<UserModel>(context, listen: false);
    return Scaffold(
      body: Center(
        child: _provider.results == null
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: _provider.results.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              Text(
                                  "Movie Title :${_provider.results[i].title}"),
                              Text(_provider.results[i].releaseDate.toString())
                            ],
                          )),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Description(
                                              title: _provider.results[i].title,
                                              bannerurl:
                                                  'https://image.tmdb.org/t/p/w500' +
                                                      _provider.results[i]
                                                          .backdropPath,
                                              posterurl:
                                                  'https://image.tmdb.org/t/p/w500' +
                                                      _provider.results[i]
                                                          .posterPath,
                                              description:
                                                  _provider.results[i].title,
                                            )));
                              },
                              child: Container(
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://image.tmdb.org/t/p/w500' +
                                                _provider
                                                    .results[i].posterPath))),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
      ),
    );
  }
}
