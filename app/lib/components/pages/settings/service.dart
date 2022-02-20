import 'package:app/components/pages/settings/model.dart';
import 'package:app/resources/generic_service.dart';

class SettingsService extends GenericService<SettingsModel>{
  @override
  void delete(SettingsModel object) {
    print(object);
  }

  @override
  List<SettingsModel> list() {
    print([]);
    return [];
  }

  @override
  void save(SettingsModel object) {
    print(object);
  }

  @override
  void update(SettingsModel object) {
    print(object);
  }
  
}