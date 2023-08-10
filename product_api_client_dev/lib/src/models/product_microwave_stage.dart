import 'microwave_stage.dart';
import 'model.dart';
import 'product.dart';

class ProductMicrowaveStage extends Model<String> {
  ProductMicrowaveStage({
    this.instruction,
    this.product,
    this.microwaveStage,
    required String id,
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

  String? instruction;

  Product? product;

  MicrowaveStage? microwaveStage;

  @override
  Map<String, dynamic> toJson() => {
        'instruction': instruction,
        'product': product,
        'microwaveStage': microwaveStage,
        ...super.toJson(),
      };

  static ProductMicrowaveStage fromJson(Map<String, dynamic> json) =>
      ProductMicrowaveStage(
        instruction: json['instruction'],
        product:
            json['product'] != null ? Product.fromJson(json['product']) : null,
        microwaveStage: json['microwaveStage'] != null
            ? MicrowaveStage.fromJson(json['microwaveStage'])
            : null,
        id: json['id'],
        created:
            json['created'] != null ? DateTime.parse(json['created']) : null,
        creator: json['creator'],
        updated:
            json['updated'] != null ? DateTime.parse(json['updated']) : null,
        updater: json['updater'],
      );
}
