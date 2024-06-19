import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/fetch_items.dart';
import 'package:whatsapp/notification_badge.dart';

class HomeConversations extends StatelessWidget {
  const HomeConversations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Conversation>>(
      future: fetchItems(), // your async function to fetch a list of items
      builder:
          (BuildContext context, AsyncSnapshot<List<Conversation>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child:
                  CircularProgressIndicator()); // show loading spinner while waiting for items
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        return Stack(
          children: <Widget>[
            ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              itemCount: snapshot.data!.length,
              separatorBuilder: (BuildContext context, int index) => Divider(
                color: Colors.grey[200],
              ),
              itemBuilder: (context, index) {
                final elem = snapshot.data?[index];

                return ListTile(
                    leading: CachedNetworkImage(
                      imageUrl: elem!.urlAvatar,
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        backgroundImage: imageProvider,
                      ),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(), // Replace with your widget
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    title: Text(elem.title),
                    subtitle: Text(
                      elem.subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Center the children vertically
                      children: [
                        Container(
                          width: 80,
                          height: 26,
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          alignment: Alignment.topRight,
                          child: Text(elem.time),
                        ),
                        Container(
                          width: 80,
                          height: 30,
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          alignment: Alignment.topRight,
                          child: elem.unreadMessages != null
                              ? NotificationBadge(
                                  width: 20.0,
                                  height: 20.0,
                                  fontSize: 12.0,
                                  text: elem.unreadMessages.toString(),
                                )
                              : const SizedBox(),
                        ),
                      ],
                    ));
              },
            ),
            Positioned(
              bottom: 16.0,
              right: 16.0,
              child: FloatingActionButton(
                onPressed: () {
                  // Add your onPressed code here
                },
                child: Icon(Icons.add_comment),
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
              ),
            ),
          ],
        );
      },
    );
  }
}
