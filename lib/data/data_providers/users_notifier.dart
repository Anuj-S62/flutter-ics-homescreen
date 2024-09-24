import 'package:flutter_ics_homescreen/data/models/users.dart';
import 'package:flutter_ics_homescreen/export.dart';
import 'package:uuid/uuid.dart';

import '../models/user.dart';

import 'package:protos/storage-api.dart' as storage_api;
import 'initialize_settings.dart';

class UsersNotifier extends Notifier<Users> {
  @override
  final List<User> _users = [
    const User(id: '1', name: 'Heather'),
    const User(id: '2', name: 'George'),
    const User(id: '3', name: 'Riley'),
  ];

  Users build() {
    // Initialize default state.
    state = Users.initial();
    loadUsers();
    return state;
  }

  Future<void> loadSettingsUsers() async {
    final storageClient = ref.read(storageClientProvider);
    try {
      // Access users branch.
      final searchResponseUsers = await storageClient
          .search(storage_api.Key(key: UsersPath.InfotainmentUsers));
      if (searchResponseUsers.result.isEmpty) {
        // Add default users if no users are inside the storage API.
        debugPrint("Adding default demo user profiles");
        loadUsers();
        await storageClient.write(storage_api.KeyValue(
            key: '${UsersPath.InfotainmentUsers}.${_users[0].id}.id',
            value: _users[0].id));
        await storageClient.write(storage_api.KeyValue(
            key: '${UsersPath.InfotainmentUsers}.${_users[0].id}.name',
            value: _users[0].name));
        await storageClient.write(storage_api.KeyValue(
            key: '${UsersPath.InfotainmentUsers}.${_users[1].id}.id',
            value: _users[1].id));
        await storageClient.write(storage_api.KeyValue(
            key: '${UsersPath.InfotainmentUsers}.${_users[1].id}.name',
            value: _users[1].name));
        await storageClient.write(storage_api.KeyValue(
            key: '${UsersPath.InfotainmentUsers}.${_users[2].id}.id',
            value: _users[2].id));
        await storageClient.write(storage_api.KeyValue(
            key: '${UsersPath.InfotainmentUsers}.${_users[2].id}.name',
            value: _users[2].name));
        await selectUser(_users[0].id);
      } else {
        List<User> users = [];
        List<String> idList = [];
        // Get list of all ids.
        for (var key in searchResponseUsers.result) {
          var readResponse =
              await storageClient.read(storage_api.Key(key: key));
          if (key.contains('.id')) {
            idList.insert(0, readResponse.result);
          }
        }
        // Extract names corresponding to ids.
        for (var id in idList) {
          var readResponse = await storageClient.read(
              storage_api.Key(key: '${UsersPath.InfotainmentUsers}.$id.name'));
          users.insert(0, User(id: id, name: readResponse.result));
        }
        // Extract id of selected user.
        final readResponseSelectedUser = await storageClient
            .read(storage_api.Key(key: UsersPath.InfotainmentCurrentUser));
        User selectedUser;
        final userCurrentId = readResponseSelectedUser.result;
        // Extract name of selected user.
        final readResponseCurrentUserName = await storageClient.read(
            storage_api.Key(
                key: '${UsersPath.InfotainmentUsers}.$userCurrentId.name'));
        final userCurrentName = readResponseCurrentUserName.result;
        selectedUser = User(id: userCurrentId, name: userCurrentName);
        state = Users(users: users, selectedUser: selectedUser);
      }
    } catch (e) {
      // Fallback to initial defaults if error.
      debugPrint('Error loading users: $e');
      loadUsers();
      state = state.copyWith(selectedUser: _users[0]);
    }
  }

  void loadUsers() {
    state = state.copyWith(users: _users);
  }

  Future<void> selectUser(String userId) async {
    final storageClient = ref.read(storageClientProvider);
    var selectedUser = state.users.firstWhere((user) => user.id == userId);
    state = state.copyWith(selectedUser: selectedUser);
    // Write to storage API.
    try {
      await storageClient.write(storage_api.KeyValue(
        key: UsersPath.InfotainmentCurrentUser,
        value: userId,
      ));
    } catch (e) {
      debugPrint('Error selecting user: $e');
    }

    try {
      await initializeSettingsUser(ref);
    } catch (e) {
      debugPrint('Error loading settings of user: $e');
    }
  }

  Future<void> removeUser(String userId) async {
    final storageClient = ref.read(storageClientProvider);
    var currentUserId = state.selectedUser.id;
    state.users.removeWhere((user) => user.id == userId);

    if (state.users.isNotEmpty && currentUserId == userId) {
      state = state.copyWith(selectedUser: state.users.first);
      // Write to API to change selected user.
      await storageClient.write(storage_api.KeyValue(
          key: UsersPath.InfotainmentCurrentUser, value: state.users.first.id));
    }
    if (state.users.isEmpty) {
      state = state.copyWith(selectedUser: const User(id: '0', name: ''));
      // Write to API to change selected user.
      await storageClient.write(storage_api.KeyValue(
          key: UsersPath.InfotainmentCurrentUser, value: '0'));
    }
    // Delete from storage API.
    try {
      final searchResponse =
          await storageClient.search(storage_api.Key(key: userId));
      final keyList = searchResponse.result;
      // Delete id, name entries of the user from the default namespace.
      for (final key in keyList) {
        await storageClient.delete(storage_api.Key(key: key));
      }
      // Delete all VSS keys from the user namespace.
      await storageClient
          .deleteNodes(storage_api.Key(key: "Vehicle", namespace: userId));
    } catch (e) {
      debugPrint('Error removing user with id $userId: $e');
    }
  }

  Future<void> addUser(String userName) async {
    final storageClient = ref.read(storageClientProvider);
    final id = const Uuid().v1();
    final user = User(id: id, name: userName);
    state.users.insert(0, user);
    // New user is automatically selected.
    await selectUser(user.id);
    // Write to storage API.
    try {
      await storageClient.write(storage_api.KeyValue(
          key: '${UsersPath.InfotainmentUsers}.$id.name', value: userName));
      await storageClient.write(storage_api.KeyValue(
          key: '${UsersPath.InfotainmentUsers}.$id.id', value: id));
    } catch (e) {
      debugPrint('Error adding user with id $id: $e');
    }
  }

  void editUser(User user) {
    // final id = const Uuid().v1();
    // final user = User(id: id, name: userName);
    //_users.add(user);
  }
}
