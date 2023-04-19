
// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class MessengerScreen extends StatefulWidget {

  @override
  _MessengerScreenState createState() => _MessengerScreenState();
}

class _MessengerScreenState extends State<MessengerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children: const [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(
                  'https://cdn.pixabay.com/photo/2018/08/28/12/41/avatar-3637425_960_720.png'),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 16.0,
              ),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.edit,
                color: Colors.white,
                size: 16.0,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.search),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text('Search'),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 100.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildstoryelements(),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 20.0,
                  ),
                  itemCount: 10,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => buildpersonelement(),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20.0,
                ),
                itemCount: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildpersonelement() => Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: const [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2018/08/28/12/41/avatar-3637425_960_720.png'),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0,
                ),
                child: CircleAvatar(
                  radius: 7.0,
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Mohamed Roshdy Hussain',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Hi my name is Mohamed Roshdy Hussain',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        width: 7.0,
                        height: 7.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const Text('02:35 pm'),
                  ],
                ),
              ],
            ),
          )
        ],
      );
  Widget buildstoryelements() => SizedBox(
        width: 60.0,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: const [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2018/08/28/12/41/avatar-3637425_960_720.png'),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    bottom: 3.0,
                    end: 3.0,
                  ),
                  child: CircleAvatar(
                    radius: 7.0,
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 6.0,
            ),
            const Text(
              'Mohamed Roshdy Atia Hussain',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
}
