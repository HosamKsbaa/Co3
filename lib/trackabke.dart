import 'package:flutter/cupertino.dart';

// class Id{
//   @required final String name ;
//   @required final Id parent;
//   List<Id> children=[];
//   Id(this.name, this.parent);
//
//   Id addAchild(String name){
//     Id child= Id(name,this);
//     children.add(child);
//     return child;
//   }
// }

class Event {
  late DateTime enterTime;
  late DateTime exsiteTime;
  List<Offset> history = [];
}

class Handler {
  static List<Event> allevents = [];
}

class Trackable extends StatelessWidget {
  Trackable({Key? key, required this.child, required this.title}) : super(key: key);
  final String title;
  final Widget child;

  Event? currentEvent;
  void enter(PointerEvent details) {
    // currentEvent = Event();
    // currentEvent!.enterTime = DateTime.now();
    print("Start $title ${DateTime.now()} ");
  }

  void exit(PointerEvent details) {
    // currentEvent!.exsiteTime = DateTime.now();
    // Handler.allevents.add(currentEvent!);
    print("ended $title ${DateTime.now()}");
  }

  void updateLocation(PointerEvent details) {
    currentEvent!.history.add(details.position);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: enter,
      onHover: updateLocation,
      onExit: exit,
      child: child,
    );
  }
}
