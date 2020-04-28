const String POSTGRES_NAME = 'Postgresql';
const String MYSQL_NAME = 'Mysql';
const String MARIA_DB_NAME = 'Maria DB';
const String SQL_SERVER_NAME = 'Sql Server';
const String ORACLE_NAME = 'Oracle';

Map<String, String> databaseImages =  {
  POSTGRES_NAME: 'postgresql.png',
  MYSQL_NAME: 'mysql.png',
  MARIA_DB_NAME: 'mariadb.png',
  SQL_SERVER_NAME: 'mssql.png',
  ORACLE_NAME: 'oracle.png',
};


Map<String, String> databaseUrl =  {
  POSTGRES_NAME: 'postgres',
  MYSQL_NAME: 'mysql.png',
  MARIA_DB_NAME: 'mariadb.png',
  SQL_SERVER_NAME: 'mssql.png',
  ORACLE_NAME: 'oracle.png',
};

Map<String, DefaultDatabaseConfig> databaseConfigs = {
  POSTGRES_NAME: DefaultDatabaseConfig(user: 'postgres', password: '', database: 'postgres', port: '5432', ssl: false),
  MYSQL_NAME: DefaultDatabaseConfig(user: '', password: '', database: '', port: '', ssl: false),
  MARIA_DB_NAME: DefaultDatabaseConfig(user: '', password: '', database: '', port: '', ssl: false),
  SQL_SERVER_NAME: DefaultDatabaseConfig(user: '', password: '', database: '', port: '', ssl: false),
  ORACLE_NAME: DefaultDatabaseConfig(user: '', password: '', database: '', port: '', ssl: false),
};

class DefaultDatabaseConfig {
  final String user;
  final String password;
  final String database;
  final String port;
  final bool ssl;

  DefaultDatabaseConfig({this.user, this.password, this.database, this.port, this.ssl});

}