import 'package:flutter/material.dart';

class MovieAppBar extends StatelessWidget with PreferredSizeWidget {
  const MovieAppBar({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      titleSpacing: 0,
      centerTitle: false,
      automaticallyImplyLeading: true,
      leading: Icon(Icons.arrow_back_ios_outlined,color: Colors.white,),
      title:Text("Watch",style: Theme.of(context).textTheme.headline1?.copyWith(
        color: Colors.white
      ),),
      elevation: 0.0,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}
