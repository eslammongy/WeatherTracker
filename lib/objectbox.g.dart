// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'features/weather/domain/entities/weather_data.dart';
import 'features/weather/domain/entities/weather_entity.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(1, 3749539674993228356),
      name: 'WeatherEntity',
      lastPropertyId: const obx_int.IdUid(15, 5607784614202198810),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 6068282980129360363),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 7834538198821526376),
            name: 'cityName',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 4259284133579062549),
            name: 'countryCode',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[
        obx_int.ModelBacklink(
            name: 'data', srcEntity: 'WeatherData', srcField: '')
      ]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(2, 8723998582670484710),
      name: 'WeatherData',
      lastPropertyId: const obx_int.IdUid(15, 7638900566216763639),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 1668053435644619245),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 6802718753673915078),
            name: 'maxTemp',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 2391820062073948694),
            name: 'minTemp',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 6851390447992425464),
            name: 'clouds',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 7864925719929271126),
            name: 'datetime',
            type: 10,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 3896060537421458696),
            name: 'icon',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(7, 4513938759997363301),
            name: 'description',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(8, 1244012710078322929),
            name: 'code',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(9, 6866385751371958406),
            name: 'sunriseTs',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(10, 2832330921444047487),
            name: 'sunsetTs',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(11, 6175267845961213112),
            name: 'windSpd',
            type: 8,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(13, 8785319078580557721),
            name: 'snow',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(14, 2883618737333844335),
            name: 'weatherId',
            type: 11,
            flags: 520,
            indexId: const obx_int.IdUid(1, 2350672389406998621),
            relationTarget: 'WeatherEntity'),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(15, 7638900566216763639),
            name: 'temp',
            type: 6,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [obx.Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [obx.Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
Future<obx.Store> openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) async {
  await loadObjectBoxLibraryAndroidCompat();
  return obx.Store(getObjectBoxModel(),
      directory: directory ?? (await defaultStoreDirectory()).path,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [obx.Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(2, 8723998582670484710),
      lastIndexId: const obx_int.IdUid(1, 2350672389406998621),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [
        7158201071175179883,
        7144367821096393768,
        214455206906946095,
        7925505065643434450,
        4712366496930286945,
        3948417208679349473,
        1765125725341945638,
        4834781918040698037,
        2421493447849023494,
        1784500332728246067,
        8509481122166373450,
        5607784614202198810,
        4224706079200669017
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    WeatherEntity: obx_int.EntityDefinition<WeatherEntity>(
        model: _entities[0],
        toOneRelations: (WeatherEntity object) => [],
        toManyRelations: (WeatherEntity object) => {
              obx_int.RelInfo<WeatherData>.toOneBacklink(14, object.id,
                  (WeatherData srcObject) => srcObject.weather): object.data
            },
        getId: (WeatherEntity object) => object.id,
        setId: (WeatherEntity object, int id) {
          object.id = id;
        },
        objectToFB: (WeatherEntity object, fb.Builder fbb) {
          final cityNameOffset = object.cityName == null
              ? null
              : fbb.writeString(object.cityName!);
          final countryCodeOffset = object.countryCode == null
              ? null
              : fbb.writeString(object.countryCode!);
          fbb.startTable(16);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, cityNameOffset);
          fbb.addOffset(2, countryCodeOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final cityNameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 6);
          final countryCodeParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 8);
          final object = WeatherEntity(
              cityName: cityNameParam, countryCode: countryCodeParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          obx_int.InternalToManyAccess.setRelInfo<WeatherEntity>(
              object.data,
              store,
              obx_int.RelInfo<WeatherData>.toOneBacklink(
                  14, object.id, (WeatherData srcObject) => srcObject.weather));
          return object;
        }),
    WeatherData: obx_int.EntityDefinition<WeatherData>(
        model: _entities[1],
        toOneRelations: (WeatherData object) => [object.weather],
        toManyRelations: (WeatherData object) => {},
        getId: (WeatherData object) => object.id,
        setId: (WeatherData object, int id) {
          object.id = id;
        },
        objectToFB: (WeatherData object, fb.Builder fbb) {
          final iconOffset =
              object.icon == null ? null : fbb.writeString(object.icon!);
          final descriptionOffset = object.description == null
              ? null
              : fbb.writeString(object.description!);
          fbb.startTable(16);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.maxTemp);
          fbb.addInt64(2, object.minTemp);
          fbb.addInt64(3, object.clouds);
          fbb.addInt64(4, object.datetime?.millisecondsSinceEpoch);
          fbb.addOffset(5, iconOffset);
          fbb.addOffset(6, descriptionOffset);
          fbb.addInt64(7, object.code);
          fbb.addInt64(8, object.sunriseTs);
          fbb.addInt64(9, object.sunsetTs);
          fbb.addFloat64(10, object.windSpd);
          fbb.addInt64(12, object.snow);
          fbb.addInt64(13, object.weather.targetId);
          fbb.addInt64(14, object.temp);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final datetimeValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 12);
          final maxTempParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 6);
          final minTempParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 8);
          final cloudsParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 10);
          final datetimeParam = datetimeValue == null
              ? null
              : DateTime.fromMillisecondsSinceEpoch(datetimeValue);
          final iconParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 14);
          final descriptionParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 16);
          final codeParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 18);
          final sunriseTsParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 20);
          final sunsetTsParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 22);
          final windSpdParam = const fb.Float64Reader()
              .vTableGetNullable(buffer, rootOffset, 24);
          final tempParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 32);
          final snowParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 28);
          final object = WeatherData(
              maxTemp: maxTempParam,
              minTemp: minTempParam,
              clouds: cloudsParam,
              datetime: datetimeParam,
              icon: iconParam,
              description: descriptionParam,
              code: codeParam,
              sunriseTs: sunriseTsParam,
              sunsetTs: sunsetTsParam,
              windSpd: windSpdParam,
              temp: tempParam,
              snow: snowParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          object.weather.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 30, 0);
          object.weather.attach(store);
          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [WeatherEntity] entity fields to define ObjectBox queries.
class WeatherEntity_ {
  /// See [WeatherEntity.id].
  static final id =
      obx.QueryIntegerProperty<WeatherEntity>(_entities[0].properties[0]);

  /// See [WeatherEntity.cityName].
  static final cityName =
      obx.QueryStringProperty<WeatherEntity>(_entities[0].properties[1]);

  /// See [WeatherEntity.countryCode].
  static final countryCode =
      obx.QueryStringProperty<WeatherEntity>(_entities[0].properties[2]);

  /// see [WeatherEntity.data]
  static final data =
      obx.QueryBacklinkToMany<WeatherData, WeatherEntity>(WeatherData_.weather);
}

/// [WeatherData] entity fields to define ObjectBox queries.
class WeatherData_ {
  /// See [WeatherData.id].
  static final id =
      obx.QueryIntegerProperty<WeatherData>(_entities[1].properties[0]);

  /// See [WeatherData.maxTemp].
  static final maxTemp =
      obx.QueryIntegerProperty<WeatherData>(_entities[1].properties[1]);

  /// See [WeatherData.minTemp].
  static final minTemp =
      obx.QueryIntegerProperty<WeatherData>(_entities[1].properties[2]);

  /// See [WeatherData.clouds].
  static final clouds =
      obx.QueryIntegerProperty<WeatherData>(_entities[1].properties[3]);

  /// See [WeatherData.datetime].
  static final datetime =
      obx.QueryDateProperty<WeatherData>(_entities[1].properties[4]);

  /// See [WeatherData.icon].
  static final icon =
      obx.QueryStringProperty<WeatherData>(_entities[1].properties[5]);

  /// See [WeatherData.description].
  static final description =
      obx.QueryStringProperty<WeatherData>(_entities[1].properties[6]);

  /// See [WeatherData.code].
  static final code =
      obx.QueryIntegerProperty<WeatherData>(_entities[1].properties[7]);

  /// See [WeatherData.sunriseTs].
  static final sunriseTs =
      obx.QueryIntegerProperty<WeatherData>(_entities[1].properties[8]);

  /// See [WeatherData.sunsetTs].
  static final sunsetTs =
      obx.QueryIntegerProperty<WeatherData>(_entities[1].properties[9]);

  /// See [WeatherData.windSpd].
  static final windSpd =
      obx.QueryDoubleProperty<WeatherData>(_entities[1].properties[10]);

  /// See [WeatherData.snow].
  static final snow =
      obx.QueryIntegerProperty<WeatherData>(_entities[1].properties[11]);

  /// See [WeatherData.weather].
  static final weather = obx.QueryRelationToOne<WeatherData, WeatherEntity>(
      _entities[1].properties[12]);

  /// See [WeatherData.temp].
  static final temp =
      obx.QueryIntegerProperty<WeatherData>(_entities[1].properties[13]);
}
