class AppStrings {
  static const String appName = 'Rack Manager';
  static const String logoImage = 'Logo image';
  static const String uploadImage = 'Upload image';
  static const String add = 'Add';
  static const String addRack = 'Add Rack';
  static const String export = 'Export';
  static const String notExportBuildings =
      'Cannot export: buildings not loaded';
  static const String notExportRacks = 'Cannot export: racks not loaded';
  static const String rack = 'Rack';
  static const String racks = 'Racks';
  static const String hotel = 'Hotel';
  static const String ourClients = 'Our Clients';
  static const String building = 'Building';
  static String successMessage(messageName) {
    return 'The $messageName has been added successfully';
  }

  static String successMessageEdit(messageName) {
    return 'The $messageName has been edited successfully';
  }
}
