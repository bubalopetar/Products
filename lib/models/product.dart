// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  final int? id;
  final String? title;
  final String? description;
  final String? link;
  final String? imageLink;
  final String? additionalImageLink;
  final String? availability;
  final String? listPrice;
  final String? salePrice;
  final String? gtin;
  final String? productType;
  final String? brand;
  final String? condition;
  final String? rawColor;
  final String? color;
  final String? gender;
  final String? sizeFormat;
  final String? sizingSchema;
  final String? sizes;
  final String? sizeType;
  final int? itemGroupId;
  final String? category;
  final String? shipping;
  final String? mpn;
  final String? material;
  final String? collection;
  final String? additionalImageLink2;
  final String? additionalImageLink3;
  final String? additionalImageLink4;
  Product({
    this.id,
    this.title,
    this.description,
    this.link,
    this.imageLink,
    this.additionalImageLink,
    this.availability,
    this.listPrice,
    this.salePrice,
    this.gtin,
    this.productType,
    this.brand,
    this.condition,
    this.rawColor,
    this.color,
    this.gender,
    this.sizeFormat,
    this.sizingSchema,
    this.sizes,
    this.sizeType,
    this.itemGroupId,
    this.category,
    this.shipping,
    this.mpn,
    this.material,
    this.collection,
    this.additionalImageLink2,
    this.additionalImageLink3,
    this.additionalImageLink4,
  });

  Product copyWith({
    int? id,
    String? title,
    String? description,
    String? link,
    String? imageLink,
    String? additionalImageLink,
    String? availability,
    String? listPrice,
    String? salePrice,
    String? gtin,
    String? productType,
    String? brand,
    String? condition,
    String? rawColor,
    String? color,
    String? gender,
    String? sizeFormat,
    String? sizingSchema,
    String? sizes,
    String? sizeType,
    int? itemGroupId,
    String? category,
    String? shipping,
    String? mpn,
    String? material,
    String? collection,
    String? additionalImageLink2,
    String? additionalImageLink3,
    String? additionalImageLink4,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      link: link ?? this.link,
      imageLink: imageLink ?? this.imageLink,
      additionalImageLink: additionalImageLink ?? this.additionalImageLink,
      availability: availability ?? this.availability,
      listPrice: listPrice ?? this.listPrice,
      salePrice: salePrice ?? this.salePrice,
      gtin: gtin ?? this.gtin,
      productType: productType ?? this.productType,
      brand: brand ?? this.brand,
      condition: condition ?? this.condition,
      rawColor: rawColor ?? this.rawColor,
      color: color ?? this.color,
      gender: gender ?? this.gender,
      sizeFormat: sizeFormat ?? this.sizeFormat,
      sizingSchema: sizingSchema ?? this.sizingSchema,
      sizes: sizes ?? this.sizes,
      sizeType: sizeType ?? this.sizeType,
      itemGroupId: itemGroupId ?? this.itemGroupId,
      category: category ?? this.category,
      shipping: shipping ?? this.shipping,
      mpn: mpn ?? this.mpn,
      material: material ?? this.material,
      collection: collection ?? this.collection,
      additionalImageLink2: additionalImageLink2 ?? this.additionalImageLink2,
      additionalImageLink3: additionalImageLink3 ?? this.additionalImageLink3,
      additionalImageLink4: additionalImageLink4 ?? this.additionalImageLink4,
    );
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      link: map['link'],
      imageLink: map['image_link'],
      additionalImageLink: map['additional_image_link'],
      availability: map['availability'],
      listPrice: map['list_price'],
      salePrice: map['sale_price'],
      gtin: map['gtin'],
      productType: map['product_type'],
      brand: map['brand'],
      condition: map['condition'],
      rawColor: map['raw_color'],
      color: map['color'],
      gender: map['gender'],
      sizeFormat: map['size_format'],
      sizingSchema: map['sizing_schema'],
      sizes: map['sizes'],
      sizeType: map['size_type'],
      itemGroupId: map['item_group_id'],
      category: map['category'],
      shipping: map['shipping'],
      mpn: map['mpn'],
      material: map['material'],
      collection: map['collection'],
      additionalImageLink2: map['additional_image_link_2'],
      additionalImageLink3: map['additional_image_link_3'],
      additionalImageLink4: map['additional_image_link_4'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'link': link,
      'image_link': imageLink,
      'additional_image_link': additionalImageLink,
      'availability': availability,
      'list_price': listPrice,
      'sale_price': salePrice,
      'gtin': gtin,
      'product_type': productType,
      'brand': brand,
      'condition': condition,
      'raw_color': rawColor,
      'color': color,
      'gender': gender,
      'size_format': sizeFormat,
      'sizing_schema': sizingSchema,
      'sizes': sizes,
      'size_type': sizeType,
      'item_group_id': itemGroupId,
      'category': category,
      'shipping': shipping,
      'mpn': mpn,
      'material': material,
      'collection': collection,
      'additional_image_link_2': additionalImageLink2,
      'additional_image_link_3': additionalImageLink3,
      'additional_image_link_4': additionalImageLink4,
    };
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(id: $id, title: $title, description: $description, link: $link, imageLink: $imageLink, additionalImageLink: $additionalImageLink, availability: $availability, listPrice: $listPrice, salePrice: $salePrice, gtin: $gtin, productType: $productType, brand: $brand, condition: $condition, rawColor: $rawColor, color: $color, gender: $gender, sizeFormat: $sizeFormat, sizingSchema: $sizingSchema, sizes: $sizes, sizeType: $sizeType, itemGroupId: $itemGroupId, category: $category, shipping: $shipping, mpn: $mpn, material: $material, collection: $collection, additionalImageLink2: $additionalImageLink2, additionalImageLink3: $additionalImageLink3, additionalImageLink4: $additionalImageLink4)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.link == link &&
        other.imageLink == imageLink &&
        other.additionalImageLink == additionalImageLink &&
        other.availability == availability &&
        other.listPrice == listPrice &&
        other.salePrice == salePrice &&
        other.gtin == gtin &&
        other.productType == productType &&
        other.brand == brand &&
        other.condition == condition &&
        other.rawColor == rawColor &&
        other.color == color &&
        other.gender == gender &&
        other.sizeFormat == sizeFormat &&
        other.sizingSchema == sizingSchema &&
        other.sizes == sizes &&
        other.sizeType == sizeType &&
        other.itemGroupId == itemGroupId &&
        other.category == category &&
        other.shipping == shipping &&
        other.mpn == mpn &&
        other.material == material &&
        other.collection == collection &&
        other.additionalImageLink2 == additionalImageLink2 &&
        other.additionalImageLink3 == additionalImageLink3 &&
        other.additionalImageLink4 == additionalImageLink4;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        link.hashCode ^
        imageLink.hashCode ^
        additionalImageLink.hashCode ^
        availability.hashCode ^
        listPrice.hashCode ^
        salePrice.hashCode ^
        gtin.hashCode ^
        productType.hashCode ^
        brand.hashCode ^
        condition.hashCode ^
        rawColor.hashCode ^
        color.hashCode ^
        gender.hashCode ^
        sizeFormat.hashCode ^
        sizingSchema.hashCode ^
        sizes.hashCode ^
        sizeType.hashCode ^
        itemGroupId.hashCode ^
        category.hashCode ^
        shipping.hashCode ^
        mpn.hashCode ^
        material.hashCode ^
        collection.hashCode ^
        additionalImageLink2.hashCode ^
        additionalImageLink3.hashCode ^
        additionalImageLink4.hashCode;
  }
}
