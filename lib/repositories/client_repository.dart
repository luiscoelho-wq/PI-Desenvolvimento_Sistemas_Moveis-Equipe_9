import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/client_model.dart';

class ClientRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List<Client>> getClients() async {
    final userId = _auth.currentUser!.uid;
    final snapshot = await _db
        .collection('users')
        .doc(userId)
        .collection('clients')
        .get();
    return snapshot.docs.map((d) => Client.fromMap(d.data())).toList();
  }

  Future<void> addClient(Client client) async {
    final userId = _auth.currentUser!.uid;
    await _db
        .collection('users')
        .doc(userId)
        .collection('clients')
        .doc(client.id)
        .set(client.toMap());
  }

  Future<void> updateClient(Client client) async {
    final userId = _auth.currentUser!.uid;
    await _db
        .collection('users')
        .doc(userId)
        .collection('clients')
        .doc(client.id)
        .update(client.toMap());
  }

  Future<void> deleteClient(String clientId) async {
    final userId = _auth.currentUser!.uid;
    await _db
        .collection('users')
        .doc(userId)
        .collection('clients')
        .doc(clientId)
        .delete();
  }
}
