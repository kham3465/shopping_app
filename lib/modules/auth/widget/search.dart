import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const SearchBar({Key? key, required this.onChanged}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50, // đặt chiều cao
      width: 300, // đặt chiều rộng
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Tìm kiếm',
                border: InputBorder.none,
              ),
              onChanged: widget.onChanged,
            ),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              FocusScope.of(context).unfocus();
              widget.onChanged(_controller.text);
            },
          ),
        ],
      ),
    );
  }
}
