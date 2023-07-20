/**
 * @description Exception container class for organizing exceptions specific to this data library
 *
 * @group ApexData
 * @author Tom Wilkins
 */
public inherited sharing class DataExceptions {
  public inherited sharing class SettingsException extends Exception {
  }
  public inherited sharing class FlsException extends Exception {
    @TestVisible
    private static final String INUSFFICIENT_ACCESS_MESSAGE = 'Insufficient {0} access to: {1}';
    @TestVisible
    private DataStringAdapter stringAdapter {
      get {
        if (this.stringAdapter == null) {
          this.stringAdapter = new DataStringAdapter();
        }
        return this.stringAdapter;
      }
      set;
    }
    @TestVisible
    private List<String> violations {
      get {
        if (this.violations == null) {
          this.violations = new List<String>();
        }
        return this.violations;
      }
      set;
    }
    @TestVisible
    private String operationType;
    /**
     * @description Constructor
     * @param access [System.AccessType](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_enum_System_AccessType.htm) that was used to determine FLS violation
     * @param violations Fields or Objects that failed the FLS check
     */
    public FLSException(System.AccessType access, List<String> violations) {
      this.operationType = this.stringAdapter.fromAccessType(access);
      this.violations = violations;
    }
    /**
     * @description Constructor
     * @param operation {@link DatabaseOperation} that was used to determine FLS violation
     * @param violations Fields of Objects that failed the FLS check
     */
    public FLSException(DatabaseOperation operation, List<String> violations) {
      this.operationType = this.stringAdapter.fromDatabaseOperation(operation);
      this.violations = violations;
    }
    /**
     * @description Returns FLS error message based on injected variables
     * @return Custom error message
     */
    public override String getMessage() {
      return String.format(
        INUSFFICIENT_ACCESS_MESSAGE,
        new List<String>{ operationType, String.join(this.violations, ',') }
      );
    }
  }
}
