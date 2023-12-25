import 'package:chat_app/Model/ChatModel.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IndividualPage extends StatefulWidget {
  IndividualPage({super.key, required this.chatModel});
  ChatModel chatModel;

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;

  FocusNode focus = FocusNode();
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    focus.addListener(() {
      if (focus.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(
        leadingWidth: 70,
        titleSpacing: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(
              Icons.arrow_back,
              size: 24,
            ),
            CircleAvatar(
              child: SvgPicture.asset(
                widget.chatModel.isGroup
                    ? 'assets/icons/groups.svg'
                    : 'assets/icons/person.svg',
                color: Colors.white,
                height: 37,
                width: 37,
              ),
              backgroundColor: Colors.blueGrey,
              radius: 20,
            ),
          ]),
        ),
        title: InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(6),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.chatModel.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18.5),
                  ),
                  const Text(
                    "last seen today at 12:05",
                    style: TextStyle(fontSize: 13),
                  )
                ]),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: () {},
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  child: Text('View Contact'),
                  value: 'View Contact',
                ),
                const PopupMenuItem(
                  child: Text('Media, Links, Docs'),
                  value: 'Media, Links, Docs',
                ),
                const PopupMenuItem(
                  child: Text('Whatsapp Web'),
                  value: 'Whatsapp Web',
                ),
                const PopupMenuItem(
                  child: Text('Search'),
                  value: 'Search',
                ),
                const PopupMenuItem(
                  child: Text('Mute Notification'),
                  value: 'Mute Notification',
                ),
                const PopupMenuItem(
                  child: Text('Wallpaper'),
                  value: 'Wallpaper',
                ),
              ];
            },
          )
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(
          child: Stack(children: [
            ListView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        child: Card(
                          margin: const EdgeInsets.only(
                            left: 2,
                            right: 2,
                            bottom: 8,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: TextFormField(
                            controller: _controller,
                            focusNode: focus,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.multiline,
                            maxLines: 5,
                            minLines: 1,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Type a message',
                              prefixIcon: IconButton(
                                icon: const Icon(Icons.emoji_emotions_outlined),
                                onPressed: () {
                                  focus.unfocus();
                                  focus.canRequestFocus = false;
                                  setState(() {
                                    show = !show;
                                  });
                                },
                              ),
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.attach_file),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.camera_alt),
                                    onPressed: () {},
                                  )
                                ],
                              ),
                              contentPadding: EdgeInsets.all(5),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 8.0, right: 5, left: 2),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.blue,
                          child: IconButton(
                            icon: const Icon(
                              Icons.mic,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      )
                    ],
                  ),
                  show ? emojiSelect() : Container()
                ],
              ),
            )
          ]),
          onWillPop: () {
            if (show) {
              setState(() {
                show = false;
              });
            } else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
        ),
      ),
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(onEmojiSelected: (emoji, category) {
      print(emoji);
      setState(() {
        var emoji;
        _controller.text = _controller.text + emoji.emoji;
      });
    });
  }
}
