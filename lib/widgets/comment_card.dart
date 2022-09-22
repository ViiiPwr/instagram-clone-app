import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommentCard extends StatelessWidget {
  final snap;
  const CommentCard({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
              'https://s3.amazonaws.com/sfc-datebook-wordpress/wp-content/uploads/sites/2/2019/02/64834262_DATEBOOK_seyrig0310-1024x695.jpg',
            ),
            radius: 18,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: snap.data()['username'],
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' ${snap.data()['text']}'),
                ])),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    DateFormat.yMd()
                        .add_jm()
                        .format(snap.data()['datePublished'].toDate()),
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          )),
          Container(
            padding: EdgeInsets.all(8),
            child: const Icon(
              Icons.favorite,
              size: 16,
            ),
          )
        ],
      ),
    );
  }
}
