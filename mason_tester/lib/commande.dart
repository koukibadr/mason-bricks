class Commande {
  final String name;
  final int id;
  final String lastname;
  final Orders orders;
  final Produit produit;

  Commande({
    required this.name,
    required this.id,
    required this.lastname,
    required this.orders,
    required this.produit,
  });
}

class Options {
  final String name;
  final String description;

  Options({
    required this.name,
    required this.description,
  });
}

class Accessoire {
  final int id;
  final String name;

  Accessoire({
    required this.id,
    required this.name,
  });
}

class Produit {
  final int id;
  final String name;
  final String sky;
  final Options options;
  final Accessoire accessoire;

  Produit({
    required this.id,
    required this.name,
    required this.sky,
    required this.options,
    required this.accessoire,
  });
}

class Client {
  final String name;
  final String address;

  Client({
    required this.name,
    required this.address,
  });
}

class Orders {
  final String id;
  final Client client;

  Orders({
    required this.id,
    required this.client,
  });
}
