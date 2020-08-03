// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Connection extends DataClass implements Insertable<Connection> {
  final int id;
  final String name;
  final String vendor;
  final String host;
  final String port;
  final String databaseName;
  final String schema;
  final String user;
  final String password;
  final bool ssh;
  final int databaseInfoId;
  final DateTime createdAt;
  final DateTime updatedAt;
  Connection(
      {this.id,
      this.name,
      this.vendor,
      this.host,
      this.port,
      this.databaseName,
      this.schema,
      this.user,
      this.password,
      this.ssh,
      @required this.databaseInfoId,
      this.createdAt,
      this.updatedAt});
  factory Connection.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Connection(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      vendor:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}vendor']),
      host: stringType.mapFromDatabaseResponse(data['${effectivePrefix}host']),
      port: stringType.mapFromDatabaseResponse(data['${effectivePrefix}port']),
      databaseName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}database_name']),
      schema:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}schema']),
      user: stringType.mapFromDatabaseResponse(data['${effectivePrefix}user']),
      password: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}password']),
      ssh: boolType.mapFromDatabaseResponse(data['${effectivePrefix}ssh']),
      databaseInfoId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}database_info_id']),
      createdAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updatedAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || vendor != null) {
      map['vendor'] = Variable<String>(vendor);
    }
    if (!nullToAbsent || host != null) {
      map['host'] = Variable<String>(host);
    }
    if (!nullToAbsent || port != null) {
      map['port'] = Variable<String>(port);
    }
    if (!nullToAbsent || databaseName != null) {
      map['database_name'] = Variable<String>(databaseName);
    }
    if (!nullToAbsent || schema != null) {
      map['schema'] = Variable<String>(schema);
    }
    if (!nullToAbsent || user != null) {
      map['user'] = Variable<String>(user);
    }
    if (!nullToAbsent || password != null) {
      map['password'] = Variable<String>(password);
    }
    if (!nullToAbsent || ssh != null) {
      map['ssh'] = Variable<bool>(ssh);
    }
    if (!nullToAbsent || databaseInfoId != null) {
      map['database_info_id'] = Variable<int>(databaseInfoId);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  ConnectionsCompanion toCompanion(bool nullToAbsent) {
    return ConnectionsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      vendor:
          vendor == null && nullToAbsent ? const Value.absent() : Value(vendor),
      host: host == null && nullToAbsent ? const Value.absent() : Value(host),
      port: port == null && nullToAbsent ? const Value.absent() : Value(port),
      databaseName: databaseName == null && nullToAbsent
          ? const Value.absent()
          : Value(databaseName),
      schema:
          schema == null && nullToAbsent ? const Value.absent() : Value(schema),
      user: user == null && nullToAbsent ? const Value.absent() : Value(user),
      password: password == null && nullToAbsent
          ? const Value.absent()
          : Value(password),
      ssh: ssh == null && nullToAbsent ? const Value.absent() : Value(ssh),
      databaseInfoId: databaseInfoId == null && nullToAbsent
          ? const Value.absent()
          : Value(databaseInfoId),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory Connection.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Connection(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      vendor: serializer.fromJson<String>(json['vendor']),
      host: serializer.fromJson<String>(json['host']),
      port: serializer.fromJson<String>(json['port']),
      databaseName: serializer.fromJson<String>(json['databaseName']),
      schema: serializer.fromJson<String>(json['schema']),
      user: serializer.fromJson<String>(json['user']),
      password: serializer.fromJson<String>(json['password']),
      ssh: serializer.fromJson<bool>(json['ssh']),
      databaseInfoId: serializer.fromJson<int>(json['databaseInfoId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'vendor': serializer.toJson<String>(vendor),
      'host': serializer.toJson<String>(host),
      'port': serializer.toJson<String>(port),
      'databaseName': serializer.toJson<String>(databaseName),
      'schema': serializer.toJson<String>(schema),
      'user': serializer.toJson<String>(user),
      'password': serializer.toJson<String>(password),
      'ssh': serializer.toJson<bool>(ssh),
      'databaseInfoId': serializer.toJson<int>(databaseInfoId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Connection copyWith(
          {int id,
          String name,
          String vendor,
          String host,
          String port,
          String databaseName,
          String schema,
          String user,
          String password,
          bool ssh,
          int databaseInfoId,
          DateTime createdAt,
          DateTime updatedAt}) =>
      Connection(
        id: id ?? this.id,
        name: name ?? this.name,
        vendor: vendor ?? this.vendor,
        host: host ?? this.host,
        port: port ?? this.port,
        databaseName: databaseName ?? this.databaseName,
        schema: schema ?? this.schema,
        user: user ?? this.user,
        password: password ?? this.password,
        ssh: ssh ?? this.ssh,
        databaseInfoId: databaseInfoId ?? this.databaseInfoId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Connection(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('vendor: $vendor, ')
          ..write('host: $host, ')
          ..write('port: $port, ')
          ..write('databaseName: $databaseName, ')
          ..write('schema: $schema, ')
          ..write('user: $user, ')
          ..write('password: $password, ')
          ..write('ssh: $ssh, ')
          ..write('databaseInfoId: $databaseInfoId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              vendor.hashCode,
              $mrjc(
                  host.hashCode,
                  $mrjc(
                      port.hashCode,
                      $mrjc(
                          databaseName.hashCode,
                          $mrjc(
                              schema.hashCode,
                              $mrjc(
                                  user.hashCode,
                                  $mrjc(
                                      password.hashCode,
                                      $mrjc(
                                          ssh.hashCode,
                                          $mrjc(
                                              databaseInfoId.hashCode,
                                              $mrjc(
                                                  createdAt.hashCode,
                                                  updatedAt
                                                      .hashCode)))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Connection &&
          other.id == this.id &&
          other.name == this.name &&
          other.vendor == this.vendor &&
          other.host == this.host &&
          other.port == this.port &&
          other.databaseName == this.databaseName &&
          other.schema == this.schema &&
          other.user == this.user &&
          other.password == this.password &&
          other.ssh == this.ssh &&
          other.databaseInfoId == this.databaseInfoId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ConnectionsCompanion extends UpdateCompanion<Connection> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> vendor;
  final Value<String> host;
  final Value<String> port;
  final Value<String> databaseName;
  final Value<String> schema;
  final Value<String> user;
  final Value<String> password;
  final Value<bool> ssh;
  final Value<int> databaseInfoId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const ConnectionsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.vendor = const Value.absent(),
    this.host = const Value.absent(),
    this.port = const Value.absent(),
    this.databaseName = const Value.absent(),
    this.schema = const Value.absent(),
    this.user = const Value.absent(),
    this.password = const Value.absent(),
    this.ssh = const Value.absent(),
    this.databaseInfoId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ConnectionsCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.vendor = const Value.absent(),
    this.host = const Value.absent(),
    this.port = const Value.absent(),
    this.databaseName = const Value.absent(),
    this.schema = const Value.absent(),
    this.user = const Value.absent(),
    this.password = const Value.absent(),
    this.ssh = const Value.absent(),
    @required int databaseInfoId,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : databaseInfoId = Value(databaseInfoId);
  static Insertable<Connection> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> vendor,
    Expression<String> host,
    Expression<String> port,
    Expression<String> databaseName,
    Expression<String> schema,
    Expression<String> user,
    Expression<String> password,
    Expression<bool> ssh,
    Expression<int> databaseInfoId,
    Expression<DateTime> createdAt,
    Expression<DateTime> updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (vendor != null) 'vendor': vendor,
      if (host != null) 'host': host,
      if (port != null) 'port': port,
      if (databaseName != null) 'database_name': databaseName,
      if (schema != null) 'schema': schema,
      if (user != null) 'user': user,
      if (password != null) 'password': password,
      if (ssh != null) 'ssh': ssh,
      if (databaseInfoId != null) 'database_info_id': databaseInfoId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ConnectionsCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> vendor,
      Value<String> host,
      Value<String> port,
      Value<String> databaseName,
      Value<String> schema,
      Value<String> user,
      Value<String> password,
      Value<bool> ssh,
      Value<int> databaseInfoId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt}) {
    return ConnectionsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      vendor: vendor ?? this.vendor,
      host: host ?? this.host,
      port: port ?? this.port,
      databaseName: databaseName ?? this.databaseName,
      schema: schema ?? this.schema,
      user: user ?? this.user,
      password: password ?? this.password,
      ssh: ssh ?? this.ssh,
      databaseInfoId: databaseInfoId ?? this.databaseInfoId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (vendor.present) {
      map['vendor'] = Variable<String>(vendor.value);
    }
    if (host.present) {
      map['host'] = Variable<String>(host.value);
    }
    if (port.present) {
      map['port'] = Variable<String>(port.value);
    }
    if (databaseName.present) {
      map['database_name'] = Variable<String>(databaseName.value);
    }
    if (schema.present) {
      map['schema'] = Variable<String>(schema.value);
    }
    if (user.present) {
      map['user'] = Variable<String>(user.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (ssh.present) {
      map['ssh'] = Variable<bool>(ssh.value);
    }
    if (databaseInfoId.present) {
      map['database_info_id'] = Variable<int>(databaseInfoId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConnectionsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('vendor: $vendor, ')
          ..write('host: $host, ')
          ..write('port: $port, ')
          ..write('databaseName: $databaseName, ')
          ..write('schema: $schema, ')
          ..write('user: $user, ')
          ..write('password: $password, ')
          ..write('ssh: $ssh, ')
          ..write('databaseInfoId: $databaseInfoId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ConnectionsTable extends Connections
    with TableInfo<$ConnectionsTable, Connection> {
  final GeneratedDatabase _db;
  final String _alias;
  $ConnectionsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _vendorMeta = const VerificationMeta('vendor');
  GeneratedTextColumn _vendor;
  @override
  GeneratedTextColumn get vendor => _vendor ??= _constructVendor();
  GeneratedTextColumn _constructVendor() {
    return GeneratedTextColumn(
      'vendor',
      $tableName,
      true,
    );
  }

  final VerificationMeta _hostMeta = const VerificationMeta('host');
  GeneratedTextColumn _host;
  @override
  GeneratedTextColumn get host => _host ??= _constructHost();
  GeneratedTextColumn _constructHost() {
    return GeneratedTextColumn(
      'host',
      $tableName,
      true,
    );
  }

  final VerificationMeta _portMeta = const VerificationMeta('port');
  GeneratedTextColumn _port;
  @override
  GeneratedTextColumn get port => _port ??= _constructPort();
  GeneratedTextColumn _constructPort() {
    return GeneratedTextColumn(
      'port',
      $tableName,
      true,
    );
  }

  final VerificationMeta _databaseNameMeta =
      const VerificationMeta('databaseName');
  GeneratedTextColumn _databaseName;
  @override
  GeneratedTextColumn get databaseName =>
      _databaseName ??= _constructDatabaseName();
  GeneratedTextColumn _constructDatabaseName() {
    return GeneratedTextColumn(
      'database_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _schemaMeta = const VerificationMeta('schema');
  GeneratedTextColumn _schema;
  @override
  GeneratedTextColumn get schema => _schema ??= _constructSchema();
  GeneratedTextColumn _constructSchema() {
    return GeneratedTextColumn(
      'schema',
      $tableName,
      true,
    );
  }

  final VerificationMeta _userMeta = const VerificationMeta('user');
  GeneratedTextColumn _user;
  @override
  GeneratedTextColumn get user => _user ??= _constructUser();
  GeneratedTextColumn _constructUser() {
    return GeneratedTextColumn(
      'user',
      $tableName,
      true,
    );
  }

  final VerificationMeta _passwordMeta = const VerificationMeta('password');
  GeneratedTextColumn _password;
  @override
  GeneratedTextColumn get password => _password ??= _constructPassword();
  GeneratedTextColumn _constructPassword() {
    return GeneratedTextColumn(
      'password',
      $tableName,
      true,
    );
  }

  final VerificationMeta _sshMeta = const VerificationMeta('ssh');
  GeneratedBoolColumn _ssh;
  @override
  GeneratedBoolColumn get ssh => _ssh ??= _constructSsh();
  GeneratedBoolColumn _constructSsh() {
    return GeneratedBoolColumn('ssh', $tableName, true,
        defaultValue: Constant(false));
  }

  final VerificationMeta _databaseInfoIdMeta =
      const VerificationMeta('databaseInfoId');
  GeneratedIntColumn _databaseInfoId;
  @override
  GeneratedIntColumn get databaseInfoId =>
      _databaseInfoId ??= _constructDatabaseInfoId();
  GeneratedIntColumn _constructDatabaseInfoId() {
    return GeneratedIntColumn(
      'database_info_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedDateTimeColumn _createdAt;
  @override
  GeneratedDateTimeColumn get createdAt => _createdAt ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  GeneratedDateTimeColumn _updatedAt;
  @override
  GeneratedDateTimeColumn get updatedAt => _updatedAt ??= _constructUpdatedAt();
  GeneratedDateTimeColumn _constructUpdatedAt() {
    return GeneratedDateTimeColumn(
      'updated_at',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        vendor,
        host,
        port,
        databaseName,
        schema,
        user,
        password,
        ssh,
        databaseInfoId,
        createdAt,
        updatedAt
      ];
  @override
  $ConnectionsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'connections';
  @override
  final String actualTableName = 'connections';
  @override
  VerificationContext validateIntegrity(Insertable<Connection> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    }
    if (data.containsKey('vendor')) {
      context.handle(_vendorMeta,
          vendor.isAcceptableOrUnknown(data['vendor'], _vendorMeta));
    }
    if (data.containsKey('host')) {
      context.handle(
          _hostMeta, host.isAcceptableOrUnknown(data['host'], _hostMeta));
    }
    if (data.containsKey('port')) {
      context.handle(
          _portMeta, port.isAcceptableOrUnknown(data['port'], _portMeta));
    }
    if (data.containsKey('database_name')) {
      context.handle(
          _databaseNameMeta,
          databaseName.isAcceptableOrUnknown(
              data['database_name'], _databaseNameMeta));
    }
    if (data.containsKey('schema')) {
      context.handle(_schemaMeta,
          schema.isAcceptableOrUnknown(data['schema'], _schemaMeta));
    }
    if (data.containsKey('user')) {
      context.handle(
          _userMeta, user.isAcceptableOrUnknown(data['user'], _userMeta));
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password'], _passwordMeta));
    }
    if (data.containsKey('ssh')) {
      context.handle(
          _sshMeta, ssh.isAcceptableOrUnknown(data['ssh'], _sshMeta));
    }
    if (data.containsKey('database_info_id')) {
      context.handle(
          _databaseInfoIdMeta,
          databaseInfoId.isAcceptableOrUnknown(
              data['database_info_id'], _databaseInfoIdMeta));
    } else if (isInserting) {
      context.missing(_databaseInfoIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at'], _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at'], _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Connection map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Connection.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ConnectionsTable createAlias(String alias) {
    return $ConnectionsTable(_db, alias);
  }
}

class DatabaseInfo extends DataClass implements Insertable<DatabaseInfo> {
  final int id;
  final String databases;
  final String schemas;
  final String tables;
  final String views;
  final String storeProcedures;
  final String functions;
  final DateTime createdAt;
  final DateTime updatedAt;
  DatabaseInfo(
      {this.id,
      this.databases,
      this.schemas,
      this.tables,
      this.views,
      this.storeProcedures,
      this.functions,
      this.createdAt,
      this.updatedAt});
  factory DatabaseInfo.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return DatabaseInfo(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      databases: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}databases']),
      schemas:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}schemas']),
      tables:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}tables']),
      views:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}views']),
      storeProcedures: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}store_procedures']),
      functions: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}functions']),
      createdAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updatedAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || databases != null) {
      map['databases'] = Variable<String>(databases);
    }
    if (!nullToAbsent || schemas != null) {
      map['schemas'] = Variable<String>(schemas);
    }
    if (!nullToAbsent || tables != null) {
      map['tables'] = Variable<String>(tables);
    }
    if (!nullToAbsent || views != null) {
      map['views'] = Variable<String>(views);
    }
    if (!nullToAbsent || storeProcedures != null) {
      map['store_procedures'] = Variable<String>(storeProcedures);
    }
    if (!nullToAbsent || functions != null) {
      map['functions'] = Variable<String>(functions);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  DatabaseInfosCompanion toCompanion(bool nullToAbsent) {
    return DatabaseInfosCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      databases: databases == null && nullToAbsent
          ? const Value.absent()
          : Value(databases),
      schemas: schemas == null && nullToAbsent
          ? const Value.absent()
          : Value(schemas),
      tables:
          tables == null && nullToAbsent ? const Value.absent() : Value(tables),
      views:
          views == null && nullToAbsent ? const Value.absent() : Value(views),
      storeProcedures: storeProcedures == null && nullToAbsent
          ? const Value.absent()
          : Value(storeProcedures),
      functions: functions == null && nullToAbsent
          ? const Value.absent()
          : Value(functions),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory DatabaseInfo.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DatabaseInfo(
      id: serializer.fromJson<int>(json['id']),
      databases: serializer.fromJson<String>(json['databases']),
      schemas: serializer.fromJson<String>(json['schemas']),
      tables: serializer.fromJson<String>(json['tables']),
      views: serializer.fromJson<String>(json['views']),
      storeProcedures: serializer.fromJson<String>(json['storeProcedures']),
      functions: serializer.fromJson<String>(json['functions']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'databases': serializer.toJson<String>(databases),
      'schemas': serializer.toJson<String>(schemas),
      'tables': serializer.toJson<String>(tables),
      'views': serializer.toJson<String>(views),
      'storeProcedures': serializer.toJson<String>(storeProcedures),
      'functions': serializer.toJson<String>(functions),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  DatabaseInfo copyWith(
          {int id,
          String databases,
          String schemas,
          String tables,
          String views,
          String storeProcedures,
          String functions,
          DateTime createdAt,
          DateTime updatedAt}) =>
      DatabaseInfo(
        id: id ?? this.id,
        databases: databases ?? this.databases,
        schemas: schemas ?? this.schemas,
        tables: tables ?? this.tables,
        views: views ?? this.views,
        storeProcedures: storeProcedures ?? this.storeProcedures,
        functions: functions ?? this.functions,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('DatabaseInfo(')
          ..write('id: $id, ')
          ..write('databases: $databases, ')
          ..write('schemas: $schemas, ')
          ..write('tables: $tables, ')
          ..write('views: $views, ')
          ..write('storeProcedures: $storeProcedures, ')
          ..write('functions: $functions, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          databases.hashCode,
          $mrjc(
              schemas.hashCode,
              $mrjc(
                  tables.hashCode,
                  $mrjc(
                      views.hashCode,
                      $mrjc(
                          storeProcedures.hashCode,
                          $mrjc(
                              functions.hashCode,
                              $mrjc(createdAt.hashCode,
                                  updatedAt.hashCode)))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is DatabaseInfo &&
          other.id == this.id &&
          other.databases == this.databases &&
          other.schemas == this.schemas &&
          other.tables == this.tables &&
          other.views == this.views &&
          other.storeProcedures == this.storeProcedures &&
          other.functions == this.functions &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DatabaseInfosCompanion extends UpdateCompanion<DatabaseInfo> {
  final Value<int> id;
  final Value<String> databases;
  final Value<String> schemas;
  final Value<String> tables;
  final Value<String> views;
  final Value<String> storeProcedures;
  final Value<String> functions;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const DatabaseInfosCompanion({
    this.id = const Value.absent(),
    this.databases = const Value.absent(),
    this.schemas = const Value.absent(),
    this.tables = const Value.absent(),
    this.views = const Value.absent(),
    this.storeProcedures = const Value.absent(),
    this.functions = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  DatabaseInfosCompanion.insert({
    this.id = const Value.absent(),
    this.databases = const Value.absent(),
    this.schemas = const Value.absent(),
    this.tables = const Value.absent(),
    this.views = const Value.absent(),
    this.storeProcedures = const Value.absent(),
    this.functions = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<DatabaseInfo> custom({
    Expression<int> id,
    Expression<String> databases,
    Expression<String> schemas,
    Expression<String> tables,
    Expression<String> views,
    Expression<String> storeProcedures,
    Expression<String> functions,
    Expression<DateTime> createdAt,
    Expression<DateTime> updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (databases != null) 'databases': databases,
      if (schemas != null) 'schemas': schemas,
      if (tables != null) 'tables': tables,
      if (views != null) 'views': views,
      if (storeProcedures != null) 'store_procedures': storeProcedures,
      if (functions != null) 'functions': functions,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  DatabaseInfosCompanion copyWith(
      {Value<int> id,
      Value<String> databases,
      Value<String> schemas,
      Value<String> tables,
      Value<String> views,
      Value<String> storeProcedures,
      Value<String> functions,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt}) {
    return DatabaseInfosCompanion(
      id: id ?? this.id,
      databases: databases ?? this.databases,
      schemas: schemas ?? this.schemas,
      tables: tables ?? this.tables,
      views: views ?? this.views,
      storeProcedures: storeProcedures ?? this.storeProcedures,
      functions: functions ?? this.functions,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (databases.present) {
      map['databases'] = Variable<String>(databases.value);
    }
    if (schemas.present) {
      map['schemas'] = Variable<String>(schemas.value);
    }
    if (tables.present) {
      map['tables'] = Variable<String>(tables.value);
    }
    if (views.present) {
      map['views'] = Variable<String>(views.value);
    }
    if (storeProcedures.present) {
      map['store_procedures'] = Variable<String>(storeProcedures.value);
    }
    if (functions.present) {
      map['functions'] = Variable<String>(functions.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DatabaseInfosCompanion(')
          ..write('id: $id, ')
          ..write('databases: $databases, ')
          ..write('schemas: $schemas, ')
          ..write('tables: $tables, ')
          ..write('views: $views, ')
          ..write('storeProcedures: $storeProcedures, ')
          ..write('functions: $functions, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $DatabaseInfosTable extends DatabaseInfos
    with TableInfo<$DatabaseInfosTable, DatabaseInfo> {
  final GeneratedDatabase _db;
  final String _alias;
  $DatabaseInfosTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _databasesMeta = const VerificationMeta('databases');
  GeneratedTextColumn _databases;
  @override
  GeneratedTextColumn get databases => _databases ??= _constructDatabases();
  GeneratedTextColumn _constructDatabases() {
    return GeneratedTextColumn(
      'databases',
      $tableName,
      true,
    );
  }

  final VerificationMeta _schemasMeta = const VerificationMeta('schemas');
  GeneratedTextColumn _schemas;
  @override
  GeneratedTextColumn get schemas => _schemas ??= _constructSchemas();
  GeneratedTextColumn _constructSchemas() {
    return GeneratedTextColumn(
      'schemas',
      $tableName,
      true,
    );
  }

  final VerificationMeta _tablesMeta = const VerificationMeta('tables');
  GeneratedTextColumn _tables;
  @override
  GeneratedTextColumn get tables => _tables ??= _constructTables();
  GeneratedTextColumn _constructTables() {
    return GeneratedTextColumn(
      'tables',
      $tableName,
      true,
    );
  }

  final VerificationMeta _viewsMeta = const VerificationMeta('views');
  GeneratedTextColumn _views;
  @override
  GeneratedTextColumn get views => _views ??= _constructViews();
  GeneratedTextColumn _constructViews() {
    return GeneratedTextColumn(
      'views',
      $tableName,
      true,
    );
  }

  final VerificationMeta _storeProceduresMeta =
      const VerificationMeta('storeProcedures');
  GeneratedTextColumn _storeProcedures;
  @override
  GeneratedTextColumn get storeProcedures =>
      _storeProcedures ??= _constructStoreProcedures();
  GeneratedTextColumn _constructStoreProcedures() {
    return GeneratedTextColumn(
      'store_procedures',
      $tableName,
      true,
    );
  }

  final VerificationMeta _functionsMeta = const VerificationMeta('functions');
  GeneratedTextColumn _functions;
  @override
  GeneratedTextColumn get functions => _functions ??= _constructFunctions();
  GeneratedTextColumn _constructFunctions() {
    return GeneratedTextColumn(
      'functions',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedDateTimeColumn _createdAt;
  @override
  GeneratedDateTimeColumn get createdAt => _createdAt ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  GeneratedDateTimeColumn _updatedAt;
  @override
  GeneratedDateTimeColumn get updatedAt => _updatedAt ??= _constructUpdatedAt();
  GeneratedDateTimeColumn _constructUpdatedAt() {
    return GeneratedDateTimeColumn(
      'updated_at',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        databases,
        schemas,
        tables,
        views,
        storeProcedures,
        functions,
        createdAt,
        updatedAt
      ];
  @override
  $DatabaseInfosTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'database_infos';
  @override
  final String actualTableName = 'database_infos';
  @override
  VerificationContext validateIntegrity(Insertable<DatabaseInfo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('databases')) {
      context.handle(_databasesMeta,
          databases.isAcceptableOrUnknown(data['databases'], _databasesMeta));
    }
    if (data.containsKey('schemas')) {
      context.handle(_schemasMeta,
          schemas.isAcceptableOrUnknown(data['schemas'], _schemasMeta));
    }
    if (data.containsKey('tables')) {
      context.handle(_tablesMeta,
          tables.isAcceptableOrUnknown(data['tables'], _tablesMeta));
    }
    if (data.containsKey('views')) {
      context.handle(
          _viewsMeta, views.isAcceptableOrUnknown(data['views'], _viewsMeta));
    }
    if (data.containsKey('store_procedures')) {
      context.handle(
          _storeProceduresMeta,
          storeProcedures.isAcceptableOrUnknown(
              data['store_procedures'], _storeProceduresMeta));
    }
    if (data.containsKey('functions')) {
      context.handle(_functionsMeta,
          functions.isAcceptableOrUnknown(data['functions'], _functionsMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at'], _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at'], _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DatabaseInfo map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DatabaseInfo.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DatabaseInfosTable createAlias(String alias) {
    return $DatabaseInfosTable(_db, alias);
  }
}

class QuerySaved extends DataClass implements Insertable<QuerySaved> {
  final int id;
  final String query;
  final bool saved;
  final int databaseInfoId;
  final DateTime lastExecution;
  final DateTime createdAt;
  final DateTime updatedAt;
  QuerySaved(
      {this.id,
      this.query,
      this.saved,
      this.databaseInfoId,
      this.lastExecution,
      this.createdAt,
      this.updatedAt});
  factory QuerySaved.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return QuerySaved(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      query:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}query']),
      saved: boolType.mapFromDatabaseResponse(data['${effectivePrefix}saved']),
      databaseInfoId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}database_info_id']),
      lastExecution: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_execution']),
      createdAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updatedAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || query != null) {
      map['query'] = Variable<String>(query);
    }
    if (!nullToAbsent || saved != null) {
      map['saved'] = Variable<bool>(saved);
    }
    if (!nullToAbsent || databaseInfoId != null) {
      map['database_info_id'] = Variable<int>(databaseInfoId);
    }
    if (!nullToAbsent || lastExecution != null) {
      map['last_execution'] = Variable<DateTime>(lastExecution);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  QuerySavedsCompanion toCompanion(bool nullToAbsent) {
    return QuerySavedsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      query:
          query == null && nullToAbsent ? const Value.absent() : Value(query),
      saved:
          saved == null && nullToAbsent ? const Value.absent() : Value(saved),
      databaseInfoId: databaseInfoId == null && nullToAbsent
          ? const Value.absent()
          : Value(databaseInfoId),
      lastExecution: lastExecution == null && nullToAbsent
          ? const Value.absent()
          : Value(lastExecution),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory QuerySaved.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return QuerySaved(
      id: serializer.fromJson<int>(json['id']),
      query: serializer.fromJson<String>(json['query']),
      saved: serializer.fromJson<bool>(json['saved']),
      databaseInfoId: serializer.fromJson<int>(json['databaseInfoId']),
      lastExecution: serializer.fromJson<DateTime>(json['lastExecution']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'query': serializer.toJson<String>(query),
      'saved': serializer.toJson<bool>(saved),
      'databaseInfoId': serializer.toJson<int>(databaseInfoId),
      'lastExecution': serializer.toJson<DateTime>(lastExecution),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  QuerySaved copyWith(
          {int id,
          String query,
          bool saved,
          int databaseInfoId,
          DateTime lastExecution,
          DateTime createdAt,
          DateTime updatedAt}) =>
      QuerySaved(
        id: id ?? this.id,
        query: query ?? this.query,
        saved: saved ?? this.saved,
        databaseInfoId: databaseInfoId ?? this.databaseInfoId,
        lastExecution: lastExecution ?? this.lastExecution,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('QuerySaved(')
          ..write('id: $id, ')
          ..write('query: $query, ')
          ..write('saved: $saved, ')
          ..write('databaseInfoId: $databaseInfoId, ')
          ..write('lastExecution: $lastExecution, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          query.hashCode,
          $mrjc(
              saved.hashCode,
              $mrjc(
                  databaseInfoId.hashCode,
                  $mrjc(lastExecution.hashCode,
                      $mrjc(createdAt.hashCode, updatedAt.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is QuerySaved &&
          other.id == this.id &&
          other.query == this.query &&
          other.saved == this.saved &&
          other.databaseInfoId == this.databaseInfoId &&
          other.lastExecution == this.lastExecution &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class QuerySavedsCompanion extends UpdateCompanion<QuerySaved> {
  final Value<int> id;
  final Value<String> query;
  final Value<bool> saved;
  final Value<int> databaseInfoId;
  final Value<DateTime> lastExecution;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const QuerySavedsCompanion({
    this.id = const Value.absent(),
    this.query = const Value.absent(),
    this.saved = const Value.absent(),
    this.databaseInfoId = const Value.absent(),
    this.lastExecution = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  QuerySavedsCompanion.insert({
    this.id = const Value.absent(),
    this.query = const Value.absent(),
    this.saved = const Value.absent(),
    this.databaseInfoId = const Value.absent(),
    this.lastExecution = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<QuerySaved> custom({
    Expression<int> id,
    Expression<String> query,
    Expression<bool> saved,
    Expression<int> databaseInfoId,
    Expression<DateTime> lastExecution,
    Expression<DateTime> createdAt,
    Expression<DateTime> updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (query != null) 'query': query,
      if (saved != null) 'saved': saved,
      if (databaseInfoId != null) 'database_info_id': databaseInfoId,
      if (lastExecution != null) 'last_execution': lastExecution,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  QuerySavedsCompanion copyWith(
      {Value<int> id,
      Value<String> query,
      Value<bool> saved,
      Value<int> databaseInfoId,
      Value<DateTime> lastExecution,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt}) {
    return QuerySavedsCompanion(
      id: id ?? this.id,
      query: query ?? this.query,
      saved: saved ?? this.saved,
      databaseInfoId: databaseInfoId ?? this.databaseInfoId,
      lastExecution: lastExecution ?? this.lastExecution,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (query.present) {
      map['query'] = Variable<String>(query.value);
    }
    if (saved.present) {
      map['saved'] = Variable<bool>(saved.value);
    }
    if (databaseInfoId.present) {
      map['database_info_id'] = Variable<int>(databaseInfoId.value);
    }
    if (lastExecution.present) {
      map['last_execution'] = Variable<DateTime>(lastExecution.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuerySavedsCompanion(')
          ..write('id: $id, ')
          ..write('query: $query, ')
          ..write('saved: $saved, ')
          ..write('databaseInfoId: $databaseInfoId, ')
          ..write('lastExecution: $lastExecution, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $QuerySavedsTable extends QuerySaveds
    with TableInfo<$QuerySavedsTable, QuerySaved> {
  final GeneratedDatabase _db;
  final String _alias;
  $QuerySavedsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _queryMeta = const VerificationMeta('query');
  GeneratedTextColumn _query;
  @override
  GeneratedTextColumn get query => _query ??= _constructQuery();
  GeneratedTextColumn _constructQuery() {
    return GeneratedTextColumn('query', $tableName, true,
        defaultValue: Constant(''));
  }

  final VerificationMeta _savedMeta = const VerificationMeta('saved');
  GeneratedBoolColumn _saved;
  @override
  GeneratedBoolColumn get saved => _saved ??= _constructSaved();
  GeneratedBoolColumn _constructSaved() {
    return GeneratedBoolColumn('saved', $tableName, true,
        defaultValue: Constant(false));
  }

  final VerificationMeta _databaseInfoIdMeta =
      const VerificationMeta('databaseInfoId');
  GeneratedIntColumn _databaseInfoId;
  @override
  GeneratedIntColumn get databaseInfoId =>
      _databaseInfoId ??= _constructDatabaseInfoId();
  GeneratedIntColumn _constructDatabaseInfoId() {
    return GeneratedIntColumn(
      'database_info_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _lastExecutionMeta =
      const VerificationMeta('lastExecution');
  GeneratedDateTimeColumn _lastExecution;
  @override
  GeneratedDateTimeColumn get lastExecution =>
      _lastExecution ??= _constructLastExecution();
  GeneratedDateTimeColumn _constructLastExecution() {
    return GeneratedDateTimeColumn(
      'last_execution',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedDateTimeColumn _createdAt;
  @override
  GeneratedDateTimeColumn get createdAt => _createdAt ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  GeneratedDateTimeColumn _updatedAt;
  @override
  GeneratedDateTimeColumn get updatedAt => _updatedAt ??= _constructUpdatedAt();
  GeneratedDateTimeColumn _constructUpdatedAt() {
    return GeneratedDateTimeColumn(
      'updated_at',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, query, saved, databaseInfoId, lastExecution, createdAt, updatedAt];
  @override
  $QuerySavedsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'query_saveds';
  @override
  final String actualTableName = 'query_saveds';
  @override
  VerificationContext validateIntegrity(Insertable<QuerySaved> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('query')) {
      context.handle(
          _queryMeta, query.isAcceptableOrUnknown(data['query'], _queryMeta));
    }
    if (data.containsKey('saved')) {
      context.handle(
          _savedMeta, saved.isAcceptableOrUnknown(data['saved'], _savedMeta));
    }
    if (data.containsKey('database_info_id')) {
      context.handle(
          _databaseInfoIdMeta,
          databaseInfoId.isAcceptableOrUnknown(
              data['database_info_id'], _databaseInfoIdMeta));
    }
    if (data.containsKey('last_execution')) {
      context.handle(
          _lastExecutionMeta,
          lastExecution.isAcceptableOrUnknown(
              data['last_execution'], _lastExecutionMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at'], _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at'], _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuerySaved map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return QuerySaved.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $QuerySavedsTable createAlias(String alias) {
    return $QuerySavedsTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ConnectionsTable _connections;
  $ConnectionsTable get connections => _connections ??= $ConnectionsTable(this);
  $DatabaseInfosTable _databaseInfos;
  $DatabaseInfosTable get databaseInfos =>
      _databaseInfos ??= $DatabaseInfosTable(this);
  $QuerySavedsTable _querySaveds;
  $QuerySavedsTable get querySaveds => _querySaveds ??= $QuerySavedsTable(this);
  ConnectionDao _connectionDao;
  ConnectionDao get connectionDao =>
      _connectionDao ??= ConnectionDao(this as Database);
  DatabaseInfoDao _databaseInfoDao;
  DatabaseInfoDao get databaseInfoDao =>
      _databaseInfoDao ??= DatabaseInfoDao(this as Database);
  QuerySavedDao _querySavedDao;
  QuerySavedDao get querySavedDao =>
      _querySavedDao ??= QuerySavedDao(this as Database);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [connections, databaseInfos, querySaveds];
}
