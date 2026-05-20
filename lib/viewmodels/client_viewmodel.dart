import 'package:flutter/material.dart';
import '../models/client_model.dart';
import '../repositories/client_repository.dart';

class ClientViewModel extends ChangeNotifier {
  final ClientRepository repository = ClientRepository();

  List<Client> _clients = [];
  List<Client> get clients => _clients;

  ClientViewModel() {
    loadClients();
  }

  Future<void> loadClients() async {
    _clients = await repository.getClients();
    notifyListeners();
  }

  Future<void> addClient(
    String name,
    String? email,
    String? phone,
    String? cnpj,
    String? razaoSocial,
    String? nomeFantasia,
    double? faturamentoMensal,
    int? numeroFuncionarios,
  ) async {
    final client = Client(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      email: email,
      phone: phone,
      cnpj: cnpj,
      razaoSocial: razaoSocial,
      nomeFantasia: nomeFantasia,
      faturamentoMensal: faturamentoMensal,
      numeroFuncionarios: numeroFuncionarios,
      createdAt: DateTime.now(),
    );

    await repository.addClient(client);
    await loadClients();
  }

  Future<void> updateClient(Client client) async {
    await repository.updateClient(client);
    await loadClients();
  }

  Future<void> deleteClient(String id) async {
    await repository.deleteClient(id);
    await loadClients();
  }
}