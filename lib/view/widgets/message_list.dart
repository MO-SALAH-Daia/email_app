import 'package:email_app/model/message.dart';
import 'package:email_app/view/widgets/message_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MessageListPage extends StatefulWidget {
  final String title;
  final String status;

  MessageListPage({Key key, this.title, this.status = 'important'})
      : super(key: key);

  @override
  _MessageListPageState createState() => _MessageListPageState();
}

class _MessageListPageState extends State<MessageListPage> {
  Future<List<Message>> future;
  List<Message> messagesList;

  void fetch() async {
    future = Message.browse(status: widget.status);
    messagesList = await future;
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Text('There was an error: ${snapshot.error}');
            }
            return ListView.separated(
              itemCount: snapshot.data.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Colors.grey,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                Message message = snapshot.data[index];

                return Slidable(
                  key: ObjectKey(message),
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  actions: <Widget>[
                    IconSlideAction(
                      caption: 'Archive',
                      color: Colors.blue,
                      icon: Icons.archive,
                      onTap: () {},
                    ),
                    IconSlideAction(
                      caption: 'Share',
                      color: Colors.indigo,
                      icon: Icons.share,
                      onTap: () {},
                    ),
                  ],
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      caption: 'More',
                      color: Colors.black45,
                      icon: Icons.more_horiz,
                      onTap: () {},
                    ),
                    IconSlideAction(
                      caption: 'Delete',
                      color: Colors.red,
                      icon: Icons.delete,
                      onTap: () {
                        setState(() {
                          messagesList.removeAt(index);
                        });
                      },
                    ),
                  ],
                  child: ListTile(
                    isThreeLine: true,
                    leading: CircleAvatar(
                      child: Text('MO'),
                    ),
                    title: Text(message.subject),
                    subtitle: Text(
                      message.body,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => MessageDetails(
                            subject: message.subject,
                            body: message.body,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
        }

        //! Why this is needed?
        return Container();
      },
    );
  }
}
