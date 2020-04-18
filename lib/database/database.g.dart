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

  @override
  ConnectionsCompanion createCompanion(bool nullToAbsent) {
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
  VerificationContext validateIntegrity(ConnectionsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    }
    if (d.vendor.present) {
      context.handle(
          _vendorMeta, vendor.isAcceptableValue(d.vendor.value, _vendorMeta));
    }
    if (d.host.present) {
      context.handle(
          _hostMeta, host.isAcceptableValue(d.host.value, _hostMeta));
    }
    if (d.port.present) {
      context.handle(
          _portMeta, port.isAcceptableValue(d.port.value, _portMeta));
    }
    if (d.databaseName.present) {
      context.handle(
          _databaseNameMeta,
          databaseName.isAcceptableValue(
              d.databaseName.value, _databaseNameMeta));
    }
    if (d.schema.present) {
      context.handle(
          _schemaMeta, schema.isAcceptableValue(d.schema.value, _schemaMeta));
    }
    if (d.user.present) {
      context.handle(
          _userMeta, user.isAcceptableValue(d.user.value, _userMeta));
    }
    if (d.password.present) {
      context.handle(_passwordMeta,
          password.isAcceptableValue(d.password.value, _passwordMeta));
    }
    if (d.ssh.present) {
      context.handle(_sshMeta, ssh.isAcceptableValue(d.ssh.value, _sshMeta));
    }
    if (d.databaseInfoId.present) {
      context.handle(
          _databaseInfoIdMeta,
          databaseInfoId.isAcceptableValue(
              d.databaseInfoId.value, _databaseInfoIdMeta));
    } else if (isInserting) {
      context.missing(_databaseInfoIdMeta);
    }
    if (d.createdAt.present) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableValue(d.createdAt.value, _createdAtMeta));
    }
    if (d.updatedAt.present) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableValue(d.updatedAt.value, _updatedAtMeta));
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
  Map<String, Variable> entityToSql(ConnectionsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.vendor.present) {
      map['vendor'] = Variable<String, StringType>(d.vendor.value);
    }
    if (d.host.present) {
      map['host'] = Variable<String, StringType>(d.host.value);
    }
    if (d.port.present) {
      map['port'] = Variable<String, StringType>(d.port.value);
    }
    if (d.databaseName.present) {
      map['database_name'] = Variable<String, StringType>(d.databaseName.value);
    }
    if (d.schema.present) {
      map['schema'] = Variable<String, StringType>(d.schema.value);
    }
    if (d.user.present) {
      map['user'] = Variable<String, StringType>(d.user.value);
    }
    if (d.password.present) {
      map['password'] = Variable<String, StringType>(d.password.value);
    }
    if (d.ssh.present) {
      map['ssh'] = Variable<bool, BoolType>(d.ssh.value);
    }
    if (d.databaseInfoId.present) {
      map['database_info_id'] = Variable<int, IntType>(d.databaseInfoId.value);
    }
    if (d.createdAt.present) {
      map['created_at'] = Variable<DateTime, DateTimeType>(d.createdAt.value);
    }
    if (d.updatedAt.present) {
      map['updated_at'] = Variable<DateTime, DateTimeType>(d.updatedAt.value);
    }
    return map;
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

  @override
  DatabaseInfosCompanion createCompanion(bool nullToAbsent) {
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
  VerificationContext validateIntegrity(DatabaseInfosCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.databases.present) {
      context.handle(_databasesMeta,
          databases.isAcceptableValue(d.databases.value, _databasesMeta));
    }
    if (d.schemas.present) {
      context.handle(_schemasMeta,
          schemas.isAcceptableValue(d.schemas.value, _schemasMeta));
    }
    if (d.tables.present) {
      context.handle(
          _tablesMeta, tables.isAcceptableValue(d.tables.value, _tablesMeta));
    }
    if (d.views.present) {
      context.handle(
          _viewsMeta, views.isAcceptableValue(d.views.value, _viewsMeta));
    }
    if (d.storeProcedures.present) {
      context.handle(
          _storeProceduresMeta,
          storeProcedures.isAcceptableValue(
              d.storeProcedures.value, _storeProceduresMeta));
    }
    if (d.functions.present) {
      context.handle(_functionsMeta,
          functions.isAcceptableValue(d.functions.value, _functionsMeta));
    }
    if (d.createdAt.present) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableValue(d.createdAt.value, _createdAtMeta));
    }
    if (d.updatedAt.present) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableValue(d.updatedAt.value, _updatedAtMeta));
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
  Map<String, Variable> entityToSql(DatabaseInfosCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.databases.present) {
      map['databases'] = Variable<String, StringType>(d.databases.value);
    }
    if (d.schemas.present) {
      map['schemas'] = Variable<String, StringType>(d.schemas.value);
    }
    if (d.tables.present) {
      map['tables'] = Variable<String, StringType>(d.tables.value);
    }
    if (d.views.present) {
      map['views'] = Variable<String, StringType>(d.views.value);
    }
    if (d.storeProcedures.present) {
      map['store_procedures'] =
          Variable<String, StringType>(d.storeProcedures.value);
    }
    if (d.functions.present) {
      map['functions'] = Variable<String, StringType>(d.functions.value);
    }
    if (d.createdAt.present) {
      map['created_at'] = Variable<DateTime, DateTimeType>(d.createdAt.value);
    }
    if (d.updatedAt.present) {
      map['updated_at'] = Variable<DateTime, DateTimeType>(d.updatedAt.value);
    }
    return map;
  }

  @override
  $DatabaseInfosTable createAlias(String alias) {
    return $DatabaseInfosTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ConnectionsTable _connections;
  $ConnectionsTable get connections => _connections ??= $ConnectionsTable(this);
  $DatabaseInfosTable _databaseInfos;
  $DatabaseInfosTable get databaseInfos =>
      _databaseInfos ??= $DatabaseInfosTable(this);
  ConnectionDao _connectionDao;
  ConnectionDao get connectionDao =>
      _connectionDao ??= ConnectionDao(this as Database);
  DatabaseInfoDao _databaseInfoDao;
  DatabaseInfoDao get databaseInfoDao =>
      _databaseInfoDao ??= DatabaseInfoDao(this as Database);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [connections, databaseInfos];
}
