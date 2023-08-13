import 'package:flutter/material.dart';
import 'package:myproject/main.dart';
import 'package:myproject/model/my_model.dart';
import 'package:myproject/view/utility/update.dart';
import 'package:myproject/widget/blog_screen.dart';

class Carduser extends StatefulWidget {
  const Carduser({
    super.key,
    required this.blog,
  });
  final Blog blog;

  @override
  State<Carduser> createState() => _CarduserState();
}

class _CarduserState extends State<Carduser> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        listBlog.remove(widget.blog);
        setState(() {});
      },
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Blogs(
              blog: widget.blog,
            ),
          )),
      child: Card(
        margin: const EdgeInsets.all(20),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        widget.blog.image,
                        height: 30,
                        width: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(widget.blog.author)
                  ],
                ),
              ),
              ListTile(
                trailing: Image.network(
                  widget.blog.image,
                  width: 100,
                  height: 100,
                ),
                title: Text(widget.blog.title),
                subtitle: Text(widget.blog.subject),
              ),
              ListTile(
                  trailing: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditScreen(
                        blogDataModel: widget.blog,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.edit),
                iconSize: 25,
              )),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(widget.blog.min),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // ListTile(
              //   leading: Threicon(),

              // ),
            ].toList()),
      ),
    );
  }
}
