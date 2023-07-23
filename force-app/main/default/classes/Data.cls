/**
 * @description Static accessor class for providing a static facade over stateless instance classes (to support mocking/testing)
 *
 * @group ApexData
 * @author Tom Wilkins
 */
public inherited sharing class Data {
  // public getters, TestVisible private setters
  @TestVisible
  public static DataSettings settings {
    get {
      if (settings == null) {
        settings = DataSettings.getInstance();
      }
      return settings;
    }
    private set;
  }
  @TestVisible
  public static Dml dml {
    get {
      if (DataSettings.getInstance().shouldUseMockDatabase()) {
        dml = new Dml(new MockDatabaseConnection());
      } else {
        dml = new Dml(new DatabaseConnection());
      }
      return dml;
    }
    private set;
  }
}
