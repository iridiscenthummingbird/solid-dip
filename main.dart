void main() {
  Notification notification = Notification(Email());
  notification.notify();

  Notification2 notification2 = Notification2();
  notification2.sender = SMS();
  notification2.notify();

  Notification3 notification3 = Notification3();
  notification3.notify(Email());
}

//Constructor Injection
class Notification {
  late Sender _sender;
  Notification(Sender sender) : _sender = sender;

  void notify() {
    _sender.send();
  }
}

abstract class Sender {
  void send();
}

class Email extends Sender {
  @override
  void send() {
    print("Send emeil");
  }
}

class SMS extends Sender {
  @override
  void send() {
    print("Send SMS");
  }
}

//Property Injection
class Notification2 {
  late Sender _sender;
  void set sender(Sender sender) {
    _sender = sender;
  }

  void notify() {
    _sender.send();
  }
}

//Method Injection
class Notification3 {
  void notify(Sender sender) {
    sender.send();
  }
}
