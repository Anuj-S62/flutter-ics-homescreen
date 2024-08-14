import 'package:flutter_test/flutter_test.dart';
import 'package:protos/storage-api.dart' as storage_api;
import 'package:flutter_ics_homescreen/export.dart';

import 'package:flutter_ics_homescreen/data/data_providers/storage_client.dart';
import 'package:flutter_ics_homescreen/data/data_providers/initialize_settings.dart';

// Mock implementation of Ref if necessary.
class MockRef extends Ref {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  late StorageClient storageClient;
  late ProviderContainer container;
  
  setUp(() {
    storageClient = StorageClient(
      config: StorageConfig.defaultConfig(),
      ref: MockRef(),
    );
    container = ProviderContainer();
    // Dispose container after each test.
    addTearDown(container.dispose);
  });

  test('add User', () async {
    await storageClient.destroyDB();
    final userClient = container.read(usersProvider.notifier);
    await userClient.addUser('Mark');
    // Access state.
    var userState = container.read(usersProvider);
    final userId = userState.users[0].id;
    final searchResponse = await storageClient.read(storage_api.Key(key: '${UsersPath.InfotainmentUsers}.$userId.name'));
    expect(searchResponse.success, isTrue);
    expect(searchResponse.result, 'Mark');
    await storageClient.destroyDB();
  });

  test('remove User', () async {
    await storageClient.destroyDB();
    // Add User.
    final userClient = container.read(usersProvider.notifier);
    await userClient.addUser('Mark');
    // Access state.
    var userState = container.read(usersProvider);
    final markId = userState.users[0].id;

    // Remove User.
    await userClient.removeUser(markId);
    final searchResponse = await storageClient.search(storage_api.Key(key: markId));
    expect(searchResponse.success, isTrue);
    expect(searchResponse.result, []);
    await storageClient.destroyDB();
  });

  test('add users, select user', () async {
    await storageClient.destroyDB();
    // Add Users.
    final userClient = container.read(usersProvider.notifier);
    await userClient.addUser('Mark');
    await userClient.addUser('Clara');

    var userState = container.read(usersProvider);
    final markId = userState.users[1].id;
    await userClient.selectUser(markId);

    final readResponseAfterSelectUser = await storageClient.read(storage_api.Key(key: UsersPath.InfotainmentCurrentUser));
    expect(readResponseAfterSelectUser.success, isTrue);
    expect(readResponseAfterSelectUser.result, markId);
    await storageClient.destroyDB();
  });

    test('selected user default', () async {
    await storageClient.destroyDB();

    // Access state.
    var userState = container.read(usersProvider);
    final selectedId = userState.selectedUser.id;

    final readResponse = await storageClient.read(storage_api.Key(key: UsersPath.InfotainmentCurrentUser));
    expect(readResponse.success, isFalse);
    expect(selectedId, '0');
    await storageClient.destroyDB();
  });

  test('save Unit preference for a User', () async {
    await storageClient.destroyDB();
    // Add Users.
    final userClient = container.read(usersProvider.notifier);
    final unitsClient = container.read(unitStateProvider.notifier);
    await userClient.addUser('Mark');
    await userClient.addUser('Clara');

    var userState = container.read(usersProvider);
    final markId = userState.users[1].id;
    await userClient.selectUser(markId);

    await unitsClient.setDistanceUnit(DistanceUnit.miles);

    final readResponse = await storageClient.read(storage_api.Key(key: VSSPath.vehicleHmiDistanceUnit, namespace: markId));
    expect(readResponse.success, isTrue);
    expect(readResponse.result, 'MILES');
    await storageClient.destroyDB();
  });

  test('load settings: add users, selcect user, setDistanceUnit, kill state,  initialize', () async {
    await storageClient.destroyDB();

    final userClient = container.read(usersProvider.notifier);
    final unitsClient = container.read(unitStateProvider.notifier);

    // Prepare state.
    await userClient.addUser('Mark');
    await userClient.addUser('Clara');
    var userState = container.read(usersProvider);
    final markId = userState.users[1].id;
    await userClient.selectUser(markId);
    await unitsClient.setDistanceUnit(DistanceUnit.miles);

    // Check success.
    var unitState = container.read(unitStateProvider);
    userState = container.read(usersProvider);
    expect(userState.users[0].name, 'Clara');
    expect(userState.users[1].name, 'Mark');
    expect(userState.users.length, 5);
    expect(userState.selectedUser.id, markId);
    expect(unitState.distanceUnit, DistanceUnit.miles);
    
    // Killing state.
    container.dispose();
    container = ProviderContainer();
    addTearDown(container.dispose);

    // Check that state is killed.
    userState = container.read(usersProvider);
    unitState = container.read(unitStateProvider);
    expect(userState.selectedUser.id, '0');
    expect(unitState.distanceUnit, DistanceUnit.kilometers);

    // Load state.
    await initializeSettings(container);
    
    // Check success.
    unitState = container.read(unitStateProvider);
    userState = container.read(usersProvider);
    expect(userState.selectedUser.id, markId);
    List<String> userNames = userState.users.map((user) => user.name).toList();
    expect(userNames.contains('Mark'), isTrue);
    expect(userNames.contains('Clara'), isTrue);
    expect(userState.users.length, 2);
    expect(unitState.distanceUnit, DistanceUnit.miles);
  
    await storageClient.destroyDB();
  });

  test('loadsettings: add users, setDistanceUnit, kill state, initialize', () async {
    await storageClient.destroyDB();

    final userClient = container.read(usersProvider.notifier);
    final unitsClient = container.read(unitStateProvider.notifier);

    // Prepare state.
    await userClient.addUser('Mark');
    await userClient.addUser('Clara');
    var userState = container.read(usersProvider);
    final claraId = userState.users[0].id;
    await unitsClient.setDistanceUnit(DistanceUnit.miles);

    // Check success.
    var unitState = container.read(unitStateProvider);
    userState = container.read(usersProvider);
    expect(userState.users[0].name, 'Clara');
    expect(userState.users[1].name, 'Mark');
    expect(userState.selectedUser.id, claraId);
    expect(unitState.distanceUnit, DistanceUnit.miles);
    
    // Killing state.
    container.dispose();
    container = ProviderContainer();
    addTearDown(container.dispose);

    // Check that state is killed.
    userState = container.read(usersProvider);
    unitState = container.read(unitStateProvider);
    expect(userState.selectedUser.id, '0');
    expect(unitState.distanceUnit, DistanceUnit.kilometers);

    // Load state.
    await initializeSettings(container);
    
    // Check success.
    unitState = container.read(unitStateProvider);
    userState = container.read(usersProvider);
    expect(userState.selectedUser.id, claraId);
    List<String> userNames = userState.users.map((user) => user.name).toList();
    expect(userNames.contains('Mark'), isTrue);
    expect(userNames.contains('Clara'), isTrue);
    expect(unitState.distanceUnit, DistanceUnit.miles);
  
    await storageClient.destroyDB();
  });

  test('loadsettings: initialize, add no user, setDistanceUnit, kill state, inizialize', () async {
    await storageClient.destroyDB();
    await initializeSettings(container);

    var userState = container.read(usersProvider);
    var readResponse = await storageClient.read(storage_api.Key(key: '${UsersPath.InfotainmentUsers}.1.name'));
    expect(readResponse.result, 'Heather');

    final unitsClient = container.read(unitStateProvider.notifier);

    // Prepare state.
    userState = container.read(usersProvider);
    await unitsClient.setDistanceUnit(DistanceUnit.miles);

    // Check success.
    var unitState = container.read(unitStateProvider);
    userState = container.read(usersProvider);
    expect(userState.users[0].name, 'Heather');
    expect(unitState.distanceUnit, DistanceUnit.miles);
    expect(userState.selectedUser.id, '1');
    
    // Killing state.
    container.dispose();
    container = ProviderContainer();
    addTearDown(container.dispose);

    // Check that state is killed.
    userState = container.read(usersProvider);
    unitState = container.read(unitStateProvider);
    expect(userState.selectedUser.id, '0');
    expect(unitState.distanceUnit, DistanceUnit.kilometers);

    // Load state.
    await initializeSettings(container);
    
    // Check success.
    unitState = container.read(unitStateProvider);
    userState = container.read(usersProvider);
    expect(userState.users[0].name, 'Heather');
    expect(unitState.distanceUnit, DistanceUnit.miles);
    expect(userState.selectedUser.name, 'Heather');
  
    await storageClient.destroyDB();
  });

  test('select user: load settings', () async {
    await storageClient.destroyDB();

    final userClient = container.read(usersProvider.notifier);
    final unitsClient = container.read(unitStateProvider.notifier);
    // Prepare state.
    await userClient.addUser('Mark');
    await userClient.addUser('Clara');
    var userState = container.read(usersProvider);
    final claraId = userState.users[0].id;
    final markId = userState.users[1].id;
    // Note: current user is Clara.
    await unitsClient.setDistanceUnit(DistanceUnit.miles);
    await unitsClient.setTemperatureUnit(TemperatureUnit.fahrenheit);
    await unitsClient.setPressureUnit(PressureUnit.psi);
  
    await userClient.selectUser(markId);
    await unitsClient.setDistanceUnit(DistanceUnit.miles);
    await unitsClient.setTemperatureUnit(TemperatureUnit.celsius);
    await unitsClient.setPressureUnit(PressureUnit.kilopascals);
  
    await userClient.selectUser(claraId);
    var unitState = container.read(unitStateProvider);
    expect(unitState.distanceUnit, DistanceUnit.miles);
    expect(unitState.temperatureUnit, TemperatureUnit.fahrenheit);
    expect(unitState.pressureUnit, PressureUnit.psi);
  
    var readResponse = await storageClient.read(storage_api.Key(key: VSSPath.vehicleHmiDistanceUnit, namespace: claraId));
    expect(readResponse.result, 'MILES');
    readResponse = await storageClient.read(storage_api.Key(key: VSSPath.vehicleHmiTemperatureUnit, namespace: claraId));
    expect(readResponse.result, 'F');
    readResponse = await storageClient.read(storage_api.Key(key: VSSPath. vehicleHmiPressureUnit, namespace: claraId));
    expect(readResponse.result, 'PSI');
  
    await storageClient.destroyDB();
  });
}
