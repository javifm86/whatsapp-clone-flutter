class Conversation {
  final String title;
  final String subtitle;
  final String time;
  final String urlAvatar;
  final int? unreadMessages;

  Conversation({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.urlAvatar,
    this.unreadMessages,
  });
}

Future<List<Conversation>> fetchItems() async {
  await Future.delayed(const Duration(seconds: 1)); // simulate network delay
  List<Conversation> conversations = [
    Conversation(
        title: 'Javier',
        subtitle:
            'Hola, ¿como lo llevas? vljehj vlkj rngre l,bnrjb rlbnr n,hbnr tbmlrtjnb rk,n',
        time: '12:57',
        urlAvatar: 'https://i.pravatar.cc/300?image=11',
        unreadMessages: 1),
    Conversation(
        title: 'Paco',
        subtitle: 'Mañana te veo',
        time: '9:30',
        urlAvatar: 'https://i.pravatar.cc/300?image=12',
        unreadMessages: 4),
    Conversation(
        title: 'Luisa Fernández',
        subtitle: 'Hasta mañana amigo',
        time: 'Yesterday',
        urlAvatar: 'https://i.pravatar.cc/300?image=13'),
    Conversation(
        title: 'Daddy Yankee',
        subtitle: 'Gran concierto',
        time: 'Yesterday',
        urlAvatar: 'https://i.pravatar.cc/300?image=14'),
  ];
  return conversations;
}
