import 'package:flutter/material.dart';
import 'package:newsapp/models/newsModel.dart';
import 'package:newsapp/services/api_manager.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<NewsModel> _newsModel;
  @override
  void initState() {
    _newsModel = Api_Manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'NewsApp',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder<NewsModel>(
        future: _newsModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.articles.length,
              itemBuilder: (context, index) {
                var article = snapshot.data.articles[index];
                return Card(
                    margin: EdgeInsets.all(10),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.network(article.urlToImage),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            article.author,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            article.content,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ));
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
