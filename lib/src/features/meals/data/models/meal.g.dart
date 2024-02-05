// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealAdapter extends TypeAdapter<Meal> {
  @override
  final int typeId = 2;

  @override
  Meal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Meal(
      id: fields[0] as String,
      categories: (fields[1] as List).cast<String>(),
      mealLanguageCode: fields[2] as String,
      title: fields[3] as String,
      imageUrl: fields[4] as String,
      ingredients: (fields[5] as List).cast<Ingredient>(),
      steps: (fields[6] as List).cast<String>(),
      duration: fields[7] as int,
      complexity: fields[8] as String,
      affordability: fields[9] as String,
      isGlutenFree: fields[10] as bool,
      isLactoseFree: fields[11] as bool,
      isVegan: fields[12] as bool,
      isVegetarian: fields[13] as bool,
      timeOfSavingToFavorites: fields[14] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Meal obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.categories)
      ..writeByte(2)
      ..write(obj.mealLanguageCode)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.imageUrl)
      ..writeByte(5)
      ..write(obj.ingredients)
      ..writeByte(6)
      ..write(obj.steps)
      ..writeByte(7)
      ..write(obj.duration)
      ..writeByte(8)
      ..write(obj.complexity)
      ..writeByte(9)
      ..write(obj.affordability)
      ..writeByte(10)
      ..write(obj.isGlutenFree)
      ..writeByte(11)
      ..write(obj.isLactoseFree)
      ..writeByte(12)
      ..write(obj.isVegan)
      ..writeByte(13)
      ..write(obj.isVegetarian)
      ..writeByte(14)
      ..write(obj.timeOfSavingToFavorites);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
