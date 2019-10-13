import 'package:Vier/model/todo.dart';
import 'package:Vier/screens/edit_item_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Vier/db/todo_provider.dart';

class StorageScreen extends StatefulWidget {
  static const id = 'storage_screen';

  @override
  _StorageScreenState createState() => _StorageScreenState();
}

class _StorageScreenState extends State<StorageScreen> {


  TodoProvider todoProvider = TodoProvider();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: Column(
          children: <Widget>[
            FutureBuilder<List<Todo>>(
              future: todoProvider.fetchall(),
              builder: (BuildContext context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return (!snapshot.hasData)
                        ? CupertinoActivityIndicator(
                            animating: true,
                            radius: 10.0,
                          )
                        : Text(
                            "Hello World",
                            style: TextStyle(color: Colors.transparent),
                          );
                    break;
                  default:
                    print(snapshot.data);
                    return (snapshot.hasData)? Expanded(
                      child: ListView.builder(
                         itemCount:snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                           Todo todo = snapshot.data[index];

                           return ItemStorage(todo: todo,);
                        },
                      ),
                    ): CupertinoActivityIndicator(
                      animating: true,
                      radius: 10.0,
                    );
                }
              },
            ),

          ],
        ),
    );
  }
}

class ItemStorage extends StatefulWidget {

  final Todo todo ;

  ItemStorage({@required this.todo});

  @override
  _ItemStorageState createState() => _ItemStorageState();
}

class _ItemStorageState extends State<ItemStorage> {
  TodoProvider todoProvider = TodoProvider();

  @override
  Widget build(BuildContext context) {
    return Dismissible(

      child: Card(
        elevation: 0.0,
        child: ListTile(
          title: Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                widget.todo.title,
                style: TextStyle(
                  fontSize: 15,
                ),
                maxLines: 1,
              ),
              Text(
                widget.todo.details,
                style: TextStyle(
                  fontSize: 15,
                ),
                maxLines: 2,
              ),
            ],
          ),
          subtitle: Text(
          widget.todo.category,
          style: TextStyle(
            color: Colors.red,
          fontSize: 15,
        ),
        ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.mode_edit),
                onPressed: () async{
                  print(widget.todo.id);
                 List<Todo> getitem = await todoProvider.fetchlist(widget.todo.id);
                 for(Todo item in getitem){
                   Navigator.push(context, MaterialPageRoute(builder: (context) => StorageEditItem(todo: item,)));
                 }

                },
              ),
              Expanded(
                child: Text(
                  'Last modified: ${widget.todo.datetime}',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
              /*IconButton(
                icon: Icon(Icons.delete_outline),
                onPressed: () {
                   todoProvider.delete(widget.todo.id);
                   //TODO: dismiss instantly
                },
              ),*/
            ],
          ),
        ),
      ), key: Key(widget.todo.title),
      background: Card(color: Colors.red,),
      onDismissed: (delete) async{
         await todoProvider.delete(widget.todo.id);
      },
    );
  }
}
