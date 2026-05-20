class Client {
  final String id;
  final String name;
  final String? email;
  final String? phone;

  final String? cnpj;
  final String? razaoSocial;
  final String? nomeFantasia;

  final double? faturamentoMensal;
  final int? numeroFuncionarios;

  final DateTime createdAt;

  Client({
    required this.id,
    required this.name,
    this.email,
    this.phone,
    this.cnpj,
    this.razaoSocial,
    this.nomeFantasia,
    this.faturamentoMensal,
    this.numeroFuncionarios,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phone": phone,
      "cnpj": cnpj,
      "razaoSocial": razaoSocial,
      "nomeFantasia": nomeFantasia,
      "faturamentoMensal": faturamentoMensal,
      "numeroFuncionarios": numeroFuncionarios,
      "createdAt": createdAt.toIso8601String(),
    };
  }

  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      id: map["id"],
      name: map["name"],
      email: map["email"],
      phone: map["phone"],
      cnpj: map["cnpj"],
      razaoSocial: map["razaoSocial"],
      nomeFantasia: map["nomeFantasia"],
      faturamentoMensal: (map["faturamentoMensal"] as num?)?.toDouble(),
      numeroFuncionarios: map["numeroFuncionarios"],
      createdAt: DateTime.parse(map["createdAt"]),
    );
  }
}