import 'package:flutter/material.dart';

class TitleBar extends StatefulWidget {
  const TitleBar({
    super.key,
  });

  @override
  State<TitleBar> createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> {
  bool _isSearching = false;

  void _updateSearchStatus(bool isSearching) {
    setState(() {
      _isSearching = isSearching;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Stack(
        children: [
          _isSearching ? const SizedBox.shrink() : const WhatsAppTitle(),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 100),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: const Offset(0, 0),
                ).animate(animation),
                child: child,
              );
            },
            child: _isSearching
                ? InputSearch(
                    onSearchStatusChanged: _updateSearchStatus,
                  )
                : const SizedBox.shrink(), // Empty container when not searching
          ),
        ],
      ),
      actions: _isSearching
          ? []
          : <Widget>[
              IconButton(
                icon: const Icon(Icons.camera_alt),
                onPressed: () {
                  print('Camera');
                },
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    _isSearching = true;
                  });
                },
              ),
              PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert),
                onSelected: (String selected) {
                  print(selected);
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'New group',
                    child: Text('New group'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Settings',
                    child: Text('Settings'),
                  ),
                ],
              ),
            ],
      floating: false,
      snap: false,
      pinned: false,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: Colors.grey[200],
          height: 1.0,
        ),
      ),
    );
  }
}

class InputSearch extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final Function(bool) onSearchStatusChanged;

  InputSearch({
    super.key,
    required this.onSearchStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      key: const ValueKey('TextField'),
      decoration: InputDecoration(
        hintText: 'Search...',
        prefixIcon: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            onSearchStatusChanged(false);
          },
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            _controller.clear();
          },
        ),
      ),
    );
  }
}

class WhatsAppTitle extends StatelessWidget {
  const WhatsAppTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'WhatsApp',
      style: TextStyle(
        color: Colors.green,
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
