import 'package:flutter/material.dart';

class detailes3 extends StatefulWidget {
  detailes3({super.key, this.subTitle, this.title});

  String? subTitle;
  String? title;

  @override
  State<detailes3> createState() => _detailes3State();
}

class _detailes3State extends State<detailes3> {
  final List<Map> _messages = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _sendWelcomeMessage();
  }

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;
    setState(() {
      _messages.add({
        'message': _controller.text.trim(),
        'sender': 'user',
      });
      _messages.add({
        'message': 'شكراً لتواصلك معنا، سيتم الرد قريباً.',
        'sender': 'support',
      });
    });
    _controller.clear();
  }

  void _sendWelcomeMessage() {
    setState(() {
      _messages.add({
        'message': 'مرحباً! نحن هنا للمساعدة. كيف يمكننا مساعدتك؟',
        'sender': 'support',
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text(
          "${widget.subTitle}",
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: Image.asset('images/e-6.png'),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _messages.length,
                  reverse: true,
                  itemBuilder: (context, index) {
                    final message = _messages[_messages.length - 1 - index];
                    final isUser = message['sender'] == 'user';
                    return Align(
                      alignment:
                          isUser ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isUser ? Colors.blue[100] : Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          message['message'] ?? '',
                          style: TextStyle(
                            color: isUser ? Colors.black : Colors.black87,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                color: Colors.grey[200],
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          hintText: 'اكتب رسالتك هنا...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: _sendMessage,
                      icon: const Icon(Icons.send, color: Colors.orange),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
