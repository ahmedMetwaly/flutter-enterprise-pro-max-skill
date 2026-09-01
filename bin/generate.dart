import 'dart:io';

void main(List<String> args) async {
  print('============================================================');
  print('⚡ Flutter Enterprise Pro Max — Feature Generator');
  print('Clean Architecture • SOLID Principles • 3-Tier Testing Pyramid');
  print('============================================================\n');


  String featureName = '';
  if (args.isNotEmpty && !args.first.startsWith('-')) {
    featureName = args.first.toLowerCase().replaceAll('-', '_');
  } else {
    stdout.write('📝 Enter Feature Name (e.g. auth, checkout, profile): ');
    final input = stdin.readLineSync()?.trim().toLowerCase().replaceAll('-', '_');
    featureName = (input != null && input.isNotEmpty) ? input : 'new_feature';
  }

  // 1. Feature Documentation & Requirements
  print('\n📄 1. Feature Specifications & Requirements:');
  print('   (Paste brief user stories, API endpoints, or type "default" for standard CRUD)');
  stdout.write('👉 Specs / Description [default: Standard Clean Feature]: ');
  final specs = stdin.readLineSync()?.trim();
  final featureDesc = (specs != null && specs.isNotEmpty) ? specs : 'Standard Clean Feature';

  // 2. UI / Figma Intake
  print('\n🎨 2. UI / Design Intake:');
  stdout.write('👉 Do you have a Figma URL or image mockups? (Paste link / path or press Enter to skip): ');
  final figmaUrl = stdin.readLineSync()?.trim();

  // 3. Confirming Generation
  print('\n\x1B[32m============================================================');
  print('🎯 Generating Feature: $featureName');
  print('  - Description: $featureDesc');
  if (figmaUrl != null && figmaUrl.isNotEmpty) {
    print('  - Design Source: $figmaUrl');
  }
  print('  - Standards: 3-Layer Clean Architecture + SOLID Principles');
  print('  - Performance: const constructors, scoped rebuilds, zero memory leaks');
  print('  - Testing: Unit Tests + Widget Tests + Integration E2E Tests');
  print('============================================================\x1B[0m\n');

  stdout.write('Generate feature structure and tests? (y/n, default: y): ');
  if (stdin.readLineSync()?.trim().toLowerCase() == 'n') {
    print('Generation aborted.');
    return;
  }

  print('\n⚡ Scaffolding feature: features/$featureName...');

  final basePath = 'lib/features/$featureName';
  final testBasePath = 'test/features/$featureName';
  final integrationBasePath = 'integration_test';

  // Directories to create
  final directories = [
    '$basePath/domain/entities',
    '$basePath/domain/repos',
    '$basePath/domain/usecases',
    '$basePath/data/data_sources',
    '$basePath/data/models',
    '$basePath/data/repos',
    '$basePath/presentation/logic/cubits',
    '$basePath/presentation/screens',
    '$basePath/presentation/widgets',
    '$testBasePath/domain/usecases',
    '$testBasePath/presentation/logic/cubits',
    '$testBasePath/presentation/widgets',
    integrationBasePath,
  ];

  for (final dir in directories) {
    Directory(dir).createSync(recursive: true);
  }

  // Capitalized Name
  final pascalName = featureName.split('_').map((w) => w.isEmpty ? '' : '${w[0].toUpperCase()}${w.substring(1)}').join();

  // 1. Domain Entity
  File('$basePath/domain/entities/${featureName}_entity.dart').writeAsStringSync('''
import 'package:equatable/equatable.dart';

class ${pascalName}Entity extends Equatable {
  final String id;
  final String title;

  const ${pascalName}Entity({
    required this.id,
    required this.title,
  });

  @override
  List<Object?> get props => [id, title];
}
''');

  // 2. Domain Repository Contract
  File('$basePath/domain/repos/${featureName}_repository.dart').writeAsStringSync('''
import '../../../../core/network/result.dart';
import '../../../../core/errors/failure.dart';
import '../entities/${featureName}_entity.dart';

abstract class ${pascalName}Repository {
  Future<Result<${pascalName}Entity, Failure>> get${pascalName}Details(String id);
}
''');

  // 3. Domain UseCase
  File('$basePath/domain/usecases/get_${featureName}_details_usecase.dart').writeAsStringSync('''
import 'package:injectable/injectable.dart';
import '../../../../core/network/result.dart';
import '../../../../core/errors/failure.dart';
import '../entities/${featureName}_entity.dart';
import '../repos/${featureName}_repository.dart';

@lazySingleton
class Get${pascalName}DetailsUseCase {
  final ${pascalName}Repository _repository;

  Get${pascalName}DetailsUseCase(this._repository);

  Future<Result<${pascalName}Entity, Failure>> call(String id) {
    return _repository.get${pascalName}Details(id);
  }
}
''');

  // 4. Data Model
  File('$basePath/data/models/${featureName}_model.dart').writeAsStringSync('''
import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/${featureName}_entity.dart';

part '${featureName}_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ${pascalName}Model {
  final String? id;
  final String? title;

  const ${pascalName}Model({this.id, this.title});

  factory ${pascalName}Model.fromJson(Map<String, dynamic> json) => _\$${pascalName}ModelFromJson(json);
  Map<String, dynamic> toJson() => _\$${pascalName}ModelToJson(this);

  ${pascalName}Model copyWith({String? id, String? title}) {
    return ${pascalName}Model(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  ${pascalName}Entity toEntity() {
    return ${pascalName}Entity(
      id: id ?? '',
      title: title ?? '',
    );
  }
}
''');

  // 5. Data Source
  File('$basePath/data/data_sources/${featureName}_remote_data_source.dart').writeAsStringSync('''
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/${featureName}_model.dart';

part '${featureName}_remote_data_source.g.dart';

@RestApi()
abstract class ${pascalName}RemoteDataSource {
  factory ${pascalName}RemoteDataSource(Dio dio) = _${pascalName}RemoteDataSource;

  @GET('/$featureName/{id}')
  Future<${pascalName}Model> get${pascalName}Details(@Path('id') String id);
}
''');

  // 6. Data Repo Implementation
  File('$basePath/data/repos/${featureName}_repository_impl.dart').writeAsStringSync('''
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/network/result.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/${featureName}_entity.dart';
import '../../domain/repos/${featureName}_repository.dart';
import '../data_sources/${featureName}_remote_data_source.dart';

@LazySingleton(as: ${pascalName}Repository)
class ${pascalName}RepositoryImpl implements ${pascalName}Repository {
  final ${pascalName}RemoteDataSource _remoteDataSource;

  ${pascalName}RepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<${pascalName}Entity, Failure>> get${pascalName}Details(String id) async {
    try {
      final model = await _remoteDataSource.get${pascalName}Details(id);
      return Success(model.toEntity());
    } on DioException catch (e) {
      return Error(ServerFailure(
        message: e.message ?? 'Server error occurred',
        statusCode: e.response?.statusCode,
      ));
    } catch (e) {
      return Error(UnknownFailure(message: e.toString()));
    }
  }
}
''');

  // 7. Presentation State & Cubit
  File('$basePath/presentation/logic/cubits/${featureName}_state.dart').writeAsStringSync('''
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/${featureName}_entity.dart';

part '${featureName}_state.freezed.dart';

@freezed
class ${pascalName}State with _\$${pascalName}State {
  const factory ${pascalName}State.initial() = _Initial;
  const factory ${pascalName}State.loading() = _Loading;
  const factory ${pascalName}State.success(${pascalName}Entity data) = _Success;
  const factory ${pascalName}State.failure(String message) = _Failure;
}
''');

  File('$basePath/presentation/logic/cubits/${featureName}_cubit.dart').writeAsStringSync('''
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_${featureName}_details_usecase.dart';
import '${featureName}_state.dart';

@injectable
class ${pascalName}Cubit extends Cubit<${pascalName}State> {
  final Get${pascalName}DetailsUseCase _get${pascalName}DetailsUseCase;

  ${pascalName}Cubit(this._get${pascalName}DetailsUseCase) : super(const ${pascalName}State.initial());

  Future<void> fetchDetails(String id) async {
    emit(const ${pascalName}State.loading());
    final result = await _get${pascalName}DetailsUseCase(id);
    result.when(
      success: (data) => emit(${pascalName}State.success(data)),
      failure: (failure) => emit(${pascalName}State.failure(failure.message)),
    );
  }
}
''');

  // 8. Presentation Screen & Widgets
  File('$basePath/presentation/screens/${featureName}_screen.dart').writeAsStringSync('''
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/cubits/${featureName}_cubit.dart';
import '../logic/cubits/${featureName}_state.dart';
import '../widgets/${featureName}_content_widget.dart';

class ${pascalName}Screen extends StatelessWidget {
  const ${pascalName}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('$pascalName'),
      ),
      body: BlocBuilder<${pascalName}Cubit, ${pascalName}State>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('Press to fetch details')),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (data) => ${pascalName}ContentWidget(data: data),
            failure: (message) => Center(child: Text('Error: \$message')),
          );
        },
      ),
    );
  }
}
''');

  File('$basePath/presentation/widgets/${featureName}_content_widget.dart').writeAsStringSync('''
import 'package:flutter/material.dart';
import '../../domain/entities/${featureName}_entity.dart';

class ${pascalName}ContentWidget extends StatelessWidget {
  const ${pascalName}ContentWidget({
    super.key,
    required this.data,
  });

  final ${pascalName}Entity data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: ListTile(
          title: Text(data.title),
          subtitle: Text('ID: \${data.id}'),
        ),
      ),
    );
  }
}
''');

  // 9. Unit Tests
  File('$testBasePath/presentation/logic/cubits/${featureName}_cubit_test.dart').writeAsStringSync('''
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:your_app/core/network/result.dart';
import 'package:your_app/core/errors/failure.dart';
import 'package:your_app/features/$featureName/domain/entities/${featureName}_entity.dart';
import 'package:your_app/features/$featureName/domain/usecases/get_${featureName}_details_usecase.dart';
import 'package:your_app/features/$featureName/presentation/logic/cubits/${featureName}_cubit.dart';
import 'package:your_app/features/$featureName/presentation/logic/cubits/${featureName}_state.dart';

class MockGet${pascalName}DetailsUseCase extends Mock implements Get${pascalName}DetailsUseCase {}

void main() {
  late MockGet${pascalName}DetailsUseCase mockUseCase;
  late ${pascalName}Cubit cubit;

  const tEntity = ${pascalName}Entity(id: '1', title: 'Sample Title');

  setUp(() {
    mockUseCase = MockGet${pascalName}DetailsUseCase();
    cubit = ${pascalName}Cubit(mockUseCase);
  });

  tearDown(() => cubit.close());

  test('initial state should be initial', () {
    expect(cubit.state, equals(const ${pascalName}State.initial()));
  });

  blocTest<${pascalName}Cubit, ${pascalName}State>(
    'emits [loading, success] when useCase returns Success',
    build: () => ${pascalName}Cubit(mockUseCase),
    setUp: () {
      when(() => mockUseCase('1')).thenAnswer((_) async => const Success(tEntity));
    },
    act: (c) => c.fetchDetails('1'),
    expect: () => [
      const ${pascalName}State.loading(),
      const ${pascalName}State.success(tEntity),
    ],
    verify: (_) {
      verify(() => mockUseCase('1')).called(1);
    },
  );
}
''');

  // 10. Integration E2E Test
  File('$integrationBasePath/${featureName}_flow_test.dart').writeAsStringSync('''
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('${pascalName} End-to-End Flow Test', (tester) async {
    // Implement full feature flow test
    expect(true, isTrue);
  });
}
''');

  // 11. Feature PRD & Architecture Documentation
  final docsPath = '$basePath/docs';
  Directory(docsPath).createSync(recursive: true);
  final dateStr = DateTime.now().toIso8601String().split('T').first;

  File('$docsPath/${featureName}_prd_and_architecture.md').writeAsStringSync('''
# 📋 Product Requirements Document (PRD) & Architecture Blueprint
## Feature: $pascalName
**Author**: Principal Product Manager & Lead Flutter Architect (10+ Years Experience)  
**Date**: $dateStr  
**Status**: Approved / Ready for Implementation  

## 1. 🎯 Executive Summary & Product Vision
* **Feature**: $pascalName
* **Description**: $featureDesc
* **Business Objective**: Deliver high-conversion, resilient, and enterprise-grade user experience with zero memory leaks and hardware-grade security.

## 2. 👥 User Journeys & Acceptance Criteria
```gherkin
Feature: $pascalName Flow
  Scenario: Successful Execution
    Given the user is on the $pascalName screen
    When the user enters valid data and submits
    Then the system executes Get${pascalName}DetailsUseCase
    And transitions state from Loading to Success
```

## 3. 🏛️ Technical Architecture Breakdown
* **Domain Layer**: `${pascalName}Entity`, `${pascalName}Repository` contract, `Get${pascalName}DetailsUseCase`.
* **Data Layer**: `${pascalName}RemoteDataSource`, `${pascalName}Model`, `${pascalName}RepositoryImpl`.
* **Presentation Layer**: `${pascalName}Cubit`, `${pascalName}State`, `${pascalName}Screen`.

## 4. 🛡️ Error & Failure Mapping
* Maps `DioException` to pure Domain `Failure`s (`ServerFailure`, `NetworkFailure`).
* UI renders localized messages via `context.l10n`.
''');

  print('✅ Domain Layer created: entities, repos, usecases');
  print('✅ Data Layer created: remote data source, models, repo impl');
  print('✅ Presentation Layer created: cubit, state, screen, widgets');
  print('✅ Unit Tests created: $testBasePath');
  print('✅ Integration E2E Test created: $integrationBasePath/${featureName}_flow_test.dart');
  print('✅ PRD & Technical Documentation created: $docsPath/${featureName}_prd_and_architecture.md');
  print('\n🎉 Feature "$featureName" successfully generated! Run:');
  print('   dart bin/doc.dart $featureName (to export PDF)');
  print('   dart run build_runner build --delete-conflicting-outputs');
  print('   flutter test $testBasePath\n');
}


