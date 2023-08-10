import 'model.dart';

class Node extends Model<int> {
  Node({
    this.name,
    this.image,
    this.sortOrder,
    required int id,
    DateTime? created,
    String? creator,
    DateTime? updated,
    String? updater,
  }) : super(
          id: id,
          created: created,
          updated: updated,
          updater: updater,
        );

  String? name;

  String? image;

  int? sortOrder;

  @override
  String toString() => name ?? super.toString();

  @override
  Map<String, dynamic> toJson() => {
        'name': name,
        'image': image,
        'sortOrder': sortOrder,
        ...super.toJson(),
      };

  static Node fromJson(Map<String, dynamic> json) => Node(
        name: json['name'],
        image: json['image'],
        sortOrder: (json['sortOrder'] as num?)?.toInt(),
        id: json['id'],
        created:
            json['created'] != null ? DateTime.parse(json['created']) : null,
        creator: json['creator'],
        updated:
            json['updated'] != null ? DateTime.parse(json['updated']) : null,
        updater: json['updater'],
      );
}
