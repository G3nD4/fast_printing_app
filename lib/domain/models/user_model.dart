import 'package:fast_printing_app/domain/models/trial_model.dart';
import 'package:fast_printing_app/domain/service/db_interface.dart';

class User {
  final String name;
  final List<Trial> trials;
  final String id;

  const User._({
    required this.name,
    required this.trials,
    required this.id,
  });

  factory User ({required  String name,
    required  List<Trial>trials, required DatabaseInterface db}) {
      return User._(
        name: name,
        trials: trials,
        id: db.getAvailableId(),
      );
    }

  factory User.fromJson(Map<String, dynamic> json) {
    return User._(
      name: json['name'],
      trials: (json['trials'] as List).map((trial) => Trial.fromJson(trial)).toList(),
      id: json['id'],
    );
  }
}
