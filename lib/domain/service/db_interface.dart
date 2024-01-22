abstract class DatabaseInterface<T> {
  final String databaseName;

  DatabaseInterface({required this.databaseName});

  Future<void> init();

  void insert(String key, Map<String, dynamic> jsonModel);

  List<T> fetchAll();

  T getById(String id);

  String getAvailableId();
}