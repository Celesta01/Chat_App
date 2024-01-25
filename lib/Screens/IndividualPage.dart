import 'package:chat_app/CustomUI/OwnMsgCard.dart';
import 'package:chat_app/CustomUI/ReplyCard.dart';
import 'package:chat_app/Model/ChatModel.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

// ignore: must_be_immutable
class IndividualPage extends StatefulWidget {
  IndividualPage({super.key, required this.chatModel});
  ChatModel chatModel;

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;
  FocusNode focus = FocusNode();

  late IO.Socket socket;
  bool sendButton = false;
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    connect();
    focus.addListener(() {
      if (focus.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  void connect() {
    socket = IO.io('http://192.168.1.6:5000', <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    socket.emit("/test", "Hello Worldsssss");
    socket.onConnect((data) => print("Connected"));
    print('hellll- ${socket.connected}');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/image.png',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leadingWidth: 70,
            titleSpacing: 0,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Icon(
                  Icons.arrow_back,
                  size: 24,
                ),
                CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  radius: 20,
                  child: SvgPicture.asset(
                    widget.chatModel.isGroup
                        ? 'assets/icons/groups.svg'
                        : 'assets/icons/person.svg',
                    color: Colors.white,
                    height: 37,
                    width: 37,
                  ),
                ),
              ]),
            ),
            title: InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.all(6),
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
                onSelected: (value) {},
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
                Container(
                  height: MediaQuery.of(context).size.height - 140,
                  child: ListView(
                    shrinkWrap: true,
                    children: const [
                      OwnMsgCard(),
                      ReplyCard(),
                      OwnMsgCard(),
                      ReplyCard(),
                      OwnMsgCard(),
                      ReplyCard(),
                      OwnMsgCard(),
                      ReplyCard(),
                      OwnMsgCard(),
                      ReplyCard(),
                      OwnMsgCard(),
                      ReplyCard(),
                      OwnMsgCard(),
                      ReplyCard(),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          SizedBox(
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
                                onChanged: (value) {
                                  if (value.length > 0) {
                                    setState(() {
                                      sendButton = true;
                                    });
                                  } else {
                                    setState(() {
                                      sendButton = false;
                                    });
                                  }
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Type a message',
                                  prefixIcon: IconButton(
                                    icon: const Icon(
                                        Icons.emoji_emotions_outlined),
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
                                        icon: const Icon(Icons.attach_file),
                                        onPressed: () {
                                          showModalBottomSheet(
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (builder) =>
                                                  bottomsheet());
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.camera_alt),
                                        onPressed: () {},
                                      )
                                    ],
                                  ),
                                  contentPadding: const EdgeInsets.all(5),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8.0, right: 5, left: 2),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.teal,
                              child: IconButton(
                                icon: Icon(
                                  sendButton ? Icons.send : Icons.mic,
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
        ),
      ],
    );
  }

  Widget bottomsheet() {
    return SizedBox(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(
                      Icons.insert_drive_file, Colors.indigo, "Document"),
                  const SizedBox(
                    width: 40,
                  ),
                  iconcreation(Icons.camera_alt, Colors.pink, "Camera"),
                  const SizedBox(
                    width: 40,
                  ),
                  iconcreation(Icons.insert_photo, Colors.purple, "Gallery"),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(Icons.headset, Colors.orange, "Audio"),
                  const SizedBox(
                    width: 40,
                  ),
                  iconcreation(Icons.location_pin, Colors.teal, "Location"),
                  const SizedBox(
                    width: 40,
                  ),
                  iconcreation(Icons.person, Colors.blue, "Contact"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget iconcreation(IconData icon, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icon,
              size: 29,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }

  Widget emojiSelect() {
    return SizedBox(
      height: 250,
      child: EmojiPicker(onEmojiSelected: (emoji, category) {
        print(emoji);
        setState(() {
          var emoji;
          _controller.text = _controller.text + emoji.emoji;
        });
      }),
    );
  }
}
