@IsTest
private inherited sharing class DataSettingsTest {
  private static final String TEST_USER_USERNAME = 'testuser@apexdata.unittests.com';

  @TestSetup
  private static void makeData() {
    Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
    User u = new User(
      Alias = 'tstusr',
      Email = TEST_USER_USERNAME,
      EmailEncodingKey = 'UTF-8',
      LastName = 'Testing',
      LanguageLocaleKey = 'en_US',
      LocaleSidKey = 'en_US',
      ProfileId = p.Id,
      TimeZoneSidKey = 'America/Los_Angeles',
      UserName = TEST_USER_USERNAME
    );
    insert u;
  }

  @IsTest
  private static void getInstance_noInstanceYet_instantiateAndReturnWithDefaults() {
    System.Test.startTest();
    DataSettings instance = DataSettings.getInstance();
    System.Test.stopTest();
    Assert.areEqual(
      true,
      instance.isFlsEnabled,
      'Should enable fls by default'
    );
    Assert.areEqual(
      false,
      instance.isMockDatabaseEnabled,
      'Should disable mock database by default'
    );
  }
  @IsTest
  private static void getInstance_instanceExists_returnExistingInstance() {
    DataSettings mockedSettings = new DataSettings();
    mockedSettings.isFlsEnabled = false;
    mockedSettings.isMockDatabaseEnabled = true;
    DataSettings.instance = mockedSettings;
    System.Test.startTest();
    DataSettings instance = DataSettings.getInstance();
    System.Test.stopTest();
    Assert.areEqual(
      false,
      instance.isFlsEnabled,
      'Should have fls disbaled based on existing instance'
    );
    Assert.areEqual(
      true,
      instance.isMockDatabaseEnabled,
      'Should have mock database enabled based on existing instance'
    );
  }
  @IsTest
  private static void enableFls_false_setToTrue() {
    DataSettings mockedSettings = new DataSettings();
    mockedSettings.isFlsEnabled = false;
    System.Test.startTest();
    mockedSettings.enableFls();
    System.Test.stopTest();
    Assert.areEqual(
      true,
      mockedSettings.isFlsEnabled,
      'Should enable FLS when enableFls is called'
    );
  }
  @IsTest
  private static void disableFls_true_setToFalse() {
    DataSettings mockedSettings = new DataSettings();
    mockedSettings.isFlsEnabled = true;
    System.Test.startTest();
    mockedSettings.disableFls();
    System.Test.stopTest();
    Assert.areEqual(
      false,
      mockedSettings.isFlsEnabled,
      'Should disable FLS when disableFls is called'
    );
  }
  @IsTest
  private static void enableMockDatabase_true_setToFalse() {
    DataSettings mockedSettings = new DataSettings();
    mockedSettings.isMockDatabaseEnabled = true;
    System.Test.startTest();
    mockedSettings.disableMockDatabase();
    System.Test.stopTest();
    Assert.areEqual(
      false,
      mockedSettings.isMockDatabaseEnabled,
      'Should disable the mock database when disableMockDatabase is called'
    );
  }
  @IsTest
  private static void enableMockDatabase_false_setToTrue() {
    DataSettings mockedSettings = new DataSettings();
    mockedSettings.isMockDatabaseEnabled = false;
    System.Test.startTest();
    mockedSettings.enableMockDatabase();
    System.Test.stopTest();
    Assert.areEqual(
      true,
      mockedSettings.isMockDatabaseEnabled,
      'Should enable the mock database when enableMockDatabase is called'
    );
  }
  @IsTest
  private static void isFlsEnforced_doNotBypassAndEnabled_returnTrue() {
    User u = [SELECT Id FROM User WHERE Username = :TEST_USER_USERNAME];
    DataSettings mockedSettings = new DataSettings();
    mockedSettings.isFlsEnabled = true;
    Boolean result;
    System.Test.startTest();
    System.runAs(u) {
      result = mockedSettings.isFlsEnforced();
    }
    System.Test.stopTest();
    Assert.areEqual(
      true,
      mockedSettings.isFlsEnabled,
      'Should return true when bypass is not set for user and fls is enabled'
    );
  }
  @IsTest
  private static void isFlsEnforced_doNotBypassAndDisabled_returnFalse() {
    User u = [SELECT Id FROM User WHERE Username = :TEST_USER_USERNAME];
    DataSettings mockedSettings = new DataSettings();
    mockedSettings.isFlsEnabled = false;
    Boolean result;
    System.Test.startTest();
    System.runAs(u) {
      result = mockedSettings.isFlsEnforced();
    }
    System.Test.stopTest();
    Assert.areEqual(
      true,
      mockedSettings.isFlsEnabled,
      'Should return false when bypass is not set for user and fls is disabled'
    );
  }
  @IsTest
  private static void isFlsEnforced_bypass_returnFalse() {
    User u = [SELECT Id FROM User WHERE Username = :TEST_USER_USERNAME];
    PermissionSet testPermSet = [
      SELECT Id
      FROM PermissioNSet
      WHERE Name = 'ApexDataTestingPermissionSet'
    ];
    PermissionSetAssignment assignment = new PermissionSetAssignment(
      AssigneeId = u.Id,
      PermissionSetId = testPermSet.Id
    );
    insert assignment;
    DataSettings mockedSettings = new DataSettings();
    mockedSettings.isFlsEnabled = true;
    Boolean result;
    System.Test.startTest();
    System.runAs(u) {
      result = mockedSettings.isFlsEnforced();
    }
    System.Test.stopTest();
    Assert.areEqual(
      true,
      mockedSettings.isFlsEnabled,
      'Should return false when bypass is set for user'
    );
  }
}
