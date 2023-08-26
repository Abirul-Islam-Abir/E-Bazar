import 'package:ecommerce_firebase/utils/storage_key.dart';
import 'package:get_storage/get_storage.dart';

final storageInstance = GetStorage();

storeLoginData({email, password, remember }) {
  storageInstance.write(StorageKey.setEmailKey, email);
  storageInstance.write(StorageKey.setPasswordKey, password);
  storageInstance.write(StorageKey.setIsRemember, remember);
}

storeAccountCreatedData({email, password, photo}) {
  storageInstance.write(StorageKey.setEmailKey, email);
  storageInstance.write(StorageKey.setPasswordKey, password);
  storageInstance.write(StorageKey.setPhotoKey, photo);
}

storeCompleteProfileUserData({firstName, lastName, mobile, address}) {
  storageInstance.write(StorageKey.setFirstNameKey, firstName);
  storageInstance.write(StorageKey.setLastNameKey, lastName);
  storageInstance.write(StorageKey.setMobileKey, mobile);
  storageInstance.write(StorageKey.setAddressKey, address);
}
