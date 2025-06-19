class ApiKey {
  static const String email = 'email';
  static const String password = 'password';
  static const String loginId = 'id';
}

class Endpoints {
  static const String baseUrl = 'https://rack.powersmtp.solutions/api';
  static const String baseUrlImage = 'https://rack.powersmtp.solutions';
  static const String login = '$baseUrl/login.php';
  static const String getHotels = '$baseUrl/get_hotels.php';
  static const String getBuildings = '$baseUrl/get_buildings.php';
  static const String getRacksInfo = '$baseUrl/get_rack_info.php';
}
