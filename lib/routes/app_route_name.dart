class RouteName {
  static const splashScreen = '/Splash_Screen';
  static const loginScreen = '/Login_Screen';
  static const verifyEmailScreen = '/Verify_Email_Screen';
  static const otpVerificationScreen = '/Otp_Verification_Screen';
  static const setPasswordScreen = '/Set_Password_Screen';
  static const createUserAccountScreen = '/Create_User_Account_Screen';
  static const addNewTaskScreen = '/Add_New_Task_Screen';
  static const updateProfileScreen = '/Update_Profile_Screen';
  static const homeScreen = '/Home_Screen';
  static const newTaskList = '/New_Task_List';
  static const noInternetScreen = '/No_Internet_Screen';
  static const onboardingScreen = '/On_Boarding_Screen';
  static const completeProfileScreen = '/Complete_Profile_Screen';
  static const loginSuccessScreen = '/Login_Success_Screen';
  static const matchScreen = '/Match_Screen';
  static const userAccountList = '/User_Account_List';
  static const helpCenterScreen = '/Help_Center_Screen';
  static const favoritesScreen = '/Favorites_Screen';
  static const historyScreen = '/History_Screen';
  static const settingsScreen = '/Settings_Screen';
  static const aboutScreen = '/About_Screen';
  static const logOutScreen = '/Log_Out_Screen';
  static const mapScreen = '/Map_Screen';

  // Helper function to generate unique route names
  static String generateUniqueRouteName() {
    return '/${DateTime.now().millisecondsSinceEpoch}';
  }

  // Don't create a constructor
  RouteName._();
}
