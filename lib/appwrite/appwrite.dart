import 'package:appwrite/appwrite.dart';

class Appwrite {
  Client client = Client();
  Appwrite() {
    client
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('flappwrite-tracker'); // For self signed certificates, only use for development
  }
}
