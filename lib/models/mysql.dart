import 'package:mysql1/mysql1.dart';

class Mysql {
  static String host = '127.0.0.1',
                user = 'root',
                password = 'admin',
                db = 'mydbpp';
  static int port = 3306;

  Mysql();

  Future<MySqlConnection> getConnection() async {
    var setting = new ConnectionSettings(
      host: host,
      port: port,
      user: user,
      password: password,
      db: db
    );
    return await MySqlConnection.connect(setting);
  }
}
// Future Mysql {
//   final conn = await MySqlConnection.connect(ConnectionSettings(
//     host: 'localhost',
//     port: 3306,
//     user: 'root',
//     db: 'testdb',
//     password: 'secret'));
// }