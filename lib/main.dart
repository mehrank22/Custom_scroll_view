import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _list = [
    'https://picsum.photos/id/1000/300/400',
        'https://picsum.photos/id/1003/300/400',
        'https://picsum.photos/id/1004/300/400',
        'https://picsum.photos/id/1010/300/400',
        'https://picsum.photos/id/102/300/400',
        'https://picsum.photos/id/1025/300/400',
        'https://picsum.photos/id/1020/300/400',
        'https://picsum.photos/id/1024/300/400',
        'https://picsum.photos/id/103/300/400',
        'https://picsum.photos/id/1032/300/400',
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
             SliverAppBar(
              expandedHeight: 400,
              backgroundColor: Colors.black,
              floating: true,
              pinned: true,

              actions: [


                Padding(padding: EdgeInsets.only(right: 16),child: Icon(Icons.menu),),
                

              ],
           flexibleSpace: FlexibleSpaceBar(
            background: Image.network('https://picsum.photos/id/1015/600/800',fit: BoxFit.cover,),
            centerTitle: true,
            expandedTitleScale: 3,
            title: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Picture Gallery',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
            ),
           ),
           
            ),
            SliverGrid(
              
                delegate: SliverChildBuilderDelegate(
                    (context, index) => PictureItem(url: _list[index]),childCount: _list.length),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2))
          ],
        ),
      ),
    );
  }
}

class PictureItem extends StatelessWidget {
  final String url;
  const PictureItem({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            url,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
