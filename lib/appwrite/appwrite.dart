import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';

class Appwrite {
  Client client = Client();
  late final Account account;
  Appwrite() {
    client.setEndpoint('https://cloud.appwrite.io/v1').setProject(
        'flappwrite-tracker'); // For self signed certificates, only use for development
    account = Account(client);
  }

  Future<User?> createAccount(
      String name, String email, String password) async {
    try {
      final user = await account.create(
          userId: ID.unique(), email: email, password: password, name: name);
      return user;
    } on AppwriteException catch (e) {
      debugPrint(e.message);
      return null;
    }
  }

  Future<Session?> createEmailSession(String email, String password) async {
    try {
      final session =
          await account.createEmailSession(email: email, password: password);
      return session;
    } on AppwriteException catch (e) {
      debugPrint(e.message);
      return null;
    }
  }
}
