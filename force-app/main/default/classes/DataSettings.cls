/**
 * @description Data Settings singleton for managing security and other data interaction settings
 * through the application
 *
 * @group ApexData
 * @author Tom Wilkins
 */
public inherited sharing virtual class DataSettings {
  @TestVisible
  private static final String CAN_ONLY_ENABLE_MOCK_DB_IN_TEST = 'Mock database can only be enabled in tests.';

  @TestVisible
  private static DataSettings instance;

  @TestVisible
  private Boolean isFlsEnabled {
    get {
      if (this.isFlsEnabled == null) {
        this.isFlsEnabled = true;
      }
      return this.isFlsEnabled;
    }
    set;
  }
  @TestVisible
  private Boolean isMockDatabaseEnabled {
    get {
      if (this.isMockDatabaseEnabled == null) {
        this.isMockDatabaseEnabled = false;
      }
      return this.isMockDatabaseEnabled;
    }
    set;
  }

  /**
   * @description Singleton accessor for the data settings class
   * @return Reference to the DataSettings singleton
   */
  public static DataSettings getInstance() {
    if (instance == null) {
      instance = new DataSettings();
    }
    return instance;
  }

  /**
   * @description Returns whether or not FLS is currently enforced for data transactions
   * Note that this will always return false for any users with the Bypass FLS custom permission
   * @return True if fls should be enforced, false otherwise
   */
  public Boolean isFlsEnforced() {
    if (FeatureManagement.checkPermission('Bypass_FLS')) {
      return false;
    }
    return this.isFlsEnabled;
  }

  /**
   * @description Enables FLS for subsequent data actions
   */
  public void enableFls() {
    this.isFlsEnabled = true;
  }

  /**
   * @description Disables FLS for subsequent data actions
   */
  public void disableFls() {
    this.isFlsEnabled = false;
  }

  /**
   * @description Enables the mock database for tests
   */
  public void enableMockDatabase() {
    if (!System.Test.isRunningTest()) {
      throw new DataExceptions.SettingsException(
        CAN_ONLY_ENABLE_MOCK_DB_IN_TEST
      );
    }
    this.isMockDatabaseEnabled = true;
  }

  /**
   * @description Disables the mock database for tests
   */
  public void disableMockDatabase() {
    this.isMockDatabaseEnabled = false;
  }

  /**
   * @description Protected constructor for affording mocking if needed without exposing to client code
   */
  @TestVisible
  protected DataSettings() {
  }
}
