/**
 * @description Adapter for processing various strings/enums to provide consistency throughout the app
 *
 * @group ApexData
 * @author Tom Wilkins
 */
public inherited sharing class DataStringAdapter {
  @TestVisible
  private static final String READ_STRING = 'Read';
  @TestVisible
  private static final String INSERT_STRING = 'Insert';
  @TestVisible
  private static final String UPDATE_STRING = 'Update';
  @TestVisible
  private static final String UPSERT_STRING = 'Upsert';
  @TestVisible
  private static final String DELETE_STRING = 'Delete';
  @TestVisible
  private static final String UNDELETE_STRING = 'Undelete';

  /**
   * @description Returns the string mapping for the provided STD Lib access type enum
   * @param access (System.AccessType)[https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_enum_System_AccessType.htm] Enum to generate string for
   * @return Standardized string for the provided access type
   */
  public String fromAccessType(System.AccessType access) {
    switch on (access) {
      when READABLE {
        return READ_STRING;
      }
      when CREATABLE {
        return INSERT_STRING;
      }
      when UPDATABLE {
        return UPDATE_STRING;
      }
      when UPSERTABLE {
        return UPSERT_STRING;
      }
      when else {
        return '';
      }
    }
  }
  /**
   * @description Returns the string mapping for the provided custom Database operation unem
   * @param operation {@link DatabaseOperation} Enum to generate string for
   * @return Standardized string for the provided database operation
   */
  public String fromDatabaseOperation(DatabaseOperation operation) {
    switch on (operation) {
      when DML_INSERT {
        return INSERT_STRING;
      }
      when DML_UPDATE {
        return UPDATE_STRING;
      }
      when DML_UPSERT {
        return UPSERT_STRING;
      }
      when DML_DELETE {
        return DELETE_STRING;
      }
      when DML_UNDELETE {
        return UNDELETE_STRING;
      }
      when else {
        return '';
      }
    }
  }
}
