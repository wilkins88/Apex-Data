/**
 * @description Dml service class for implementing flexible, secure-by-default conn write operations
 * Should be used in place of standard DML and/or Database operations
 *
 * @group ApexData
 * @author Tom Wilkins
 */
public inherited sharing class Dml {
  @TestVisible
  private static IDatabaseConnection conn {
    get {
      if (DataSettings.getInstance().enableMockDatabase()) {
        conn = new MockDatabaseConnection();
      } else {
        conn = new DatabaseConnection();
      }
      return conn;
    }
    set;
  }
  /**
   * @description Inserts a single record
   * @param record Record to insert
   * @return Database.SaveResult from the dml operation
   * @throws DataExceptions.FlsException {@link DataExceptions.FlsException}
   */
  public static Database.SaveResult insertRecord(SObject record) {
    return insertRecords(new List<SObject>{ record })[0];
  }
  /**
   * @description Inserts a single record with DML options
   * @param record Record to insert
   * @param options [Database.DMLOptions](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_database_dmloptions.htm) for the dml operation
   * @return Database.SaveResult from the dml operation
   * @throws DataExceptions.FlsException {@link DataExceptions.FlsException}
   */
  public static Database.SaveResult insertRecord(
    SObject record,
    Database.DMLOptions options
  ) {
    return insertRecords(new List<SObject>{ record }, options)[0];
  }
  /**
   * @description Inserts a collection of records
   * @param record Records to insert
   * @return List<Database.SaveResult> from the dml operation
   * @throws DataExceptions.FlsException {@link DataExceptions.FlsException}
   */
  public static List<Database.SaveResult> insertRecords(List<SObject> records) {
    return insertRecords(records, null);
  }
  /**
   * @description Inserts a collection of records with DML options
   * @param record Records to insert
   * @param options [Database.DMLOptions](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_database_dmloptions.htm) for the dml operation
   * @return List<Database.SaveResult> from the dml operation
   * @throws DataExceptions.FlsException {@link DataExceptions.FlsException}
   */
  public static List<Database.SaveResult> insertRecords(
    List<SObject> records,
    Database.DMLOptions options
  ) {
    List<Database.SaveResult> results = conn.insertRecords(
      enforceFLS(records, System.AccessType.CREATABLE),
      options
    );
    return results;
  }
  /**
   * @description Updates a single record
   * @param record Record to update
   * @return Database.SaveResult from the dml operation
   * @throws DataExceptions.FlsException {@link DataExceptions.FlsException}
   */
  public static Database.SaveResult updateRecord(SObject record) {
    return updateRecords(new List<SObject>{ record })[0];
  }
  /**
   * @description Updates a single record with DML options
   * @param record Record to update
   * @param options [Database.DMLOptions](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_database_dmloptions.htm) for the dml operation
   * @return Database.SaveResult from the dml operation
   * @throws DataExceptions.FlsException {@link DataExceptions.FlsException}
   */
  public static Database.SaveResult updateRecord(
    SObject record,
    Database.DMLOptions options
  ) {
    return updateRecords(new List<SObject>{ record }, options)[0];
  }
  /**
   * @description Updates a collection of records
   * @param record Records to update
   * @return List<Database.SaveResult> from the dml operation
   * @throws DataExceptions.FlsException {@link DataExceptions.FlsException}
   */
  public static List<Database.SaveResult> updateRecords(List<SObject> records) {
    return updateRecords(records, null);
  }
  /**
   * @description Updates a collection of records with DML options
   * @param record Records to update
   * @param options [Database.DMLOptions](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_database_dmloptions.htm) for the dml operation
   * @return List<Database.SaveResult> from the dml operation
   * @throws DataExceptions.FlsException {@link DataExceptions.FlsException}
   */
  public static List<Database.SaveResult> updateRecords(
    List<SObject> records,
    Database.DMLOptions options
  ) {
    List<Database.SaveResult> results = conn.updateRecords(
      enforceFLS(records, System.AccessType.UPDATABLE),
      options
    );
    return results;
  }
  /**
   * @description Upserts a single record
   * @param record Record to upsert
   * @return Database.UpsertResult from the dml operation
   * @throws DataExceptions.FlsException {@link DataExceptions.FlsException}
   */
  public static Database.UpsertResult upsertRecord(SObject record) {
    return upsertRecords(new List<SObject>{ record })[0];
  }
  /**
   * @description Upserts a collection of records
   * @param record Records to upsert
   * @return List<Database.UpsertResult> from the dml operation
   * @throws DataExceptions.FlsException {@link DataExceptions.FlsException}
   */
  public static List<Database.UpsertResult> upsertRecords(
    List<SObject> records
  ) {
    return upsertRecords(records, true);
  }
  /**
   * @description Upserts a collection of records
   * @param record Records to upsert
   * @param allOrNone Whether partial conn writes should be allowed
   * @return List<Database.UpsertResult> from the dml operation
   * @throws DataExceptions.FlsException {@link DataExceptions.FlsException}
   */
  public static List<Database.UpsertResult> upsertRecords(
    List<SObject> records,
    Boolean allOrNone
  ) {
    List<Database.UpsertResult> results = conn.upsertRecords(
      enforceFLS(records, System.AccessType.UPSERTABLE),
      allOrNone
    );
    return results;
  }
  /**
   * @description Deletes a single record
   * @param record Record to delete
   * @return Database.DeleteResult from the dml operation
   * @throws DataExceptions.FlsException {@link DataExceptions.FlsException}
   */
  public static Database.DeleteResult deleteRecord(SObject record) {
    return deleteRecords(new List<SObject>{ record })[0];
  }
  /**
   * @description Deletes a single record
   * @param recordId Id of the record to delete
   * @return Database.DeleteResult from the dml operation
   * @throws DataExceptions.FlsException {@link DataExceptions.FlsException}
   */
  public static Database.DeleteResult deleteRecord(Id recordId) {
    return deleteRecords(new List<Id>{ recordId })[0];
  }
  /**
   * @description Deletes a collection of records
   * @param records Records to delete
   * @return List<Database.DeleteResult> from the dml operation
   * @throws DataExceptions.FlsException {@link DataExceptions.FlsException}
   */
  public static List<Database.DeleteResult> deleteRecords(
    List<SObject> records
  ) {
    return deleteRecords(records, true);
  }
  /**
   * @description Deletes a collection of records
   * @param records Records to delete
   * @param allOrNone Whether partial conn writes should be allowed
   * @return List<Database.DeleteResult> from the dml operation
   * @throws DataExceptions.FlsException {@link DataExceptions.FlsException}
   */
  public static List<Database.DeleteResult> deleteRecords(
    List<SObject> records,
    Boolean allOrNone
  ) {
    List<Id> recordIds = new List<Id>();
    for (SObject record : records) {
      recordIds.add(record.Id);
    }
    return deleteRecords(recordIds, allOrNone);
  }
  /**
   * @description Deletes a collection of records
   * @param recordIds Ids of the records to delete
   * @return List<Database.DeleteResult> from the dml operation
   * @throws DataExceptions.FlsException {@link DataExceptions.FlsException}
   */
  public static List<Database.DeleteResult> deleteRecords(List<Id> recordIds) {
    return deleteRecords(recordIds, true);
  }
  /**
   * @description Deletes a collection of records
   * @param recordIds Ids of the records to delete
   * @param allOrNone Whether partial conn writes should be allowed
   * @return List<Database.DeleteResult> from the dml operation
   * @throws DataExceptions.FlsException {@link DataExceptions.FlsException}
   */
  public static List<Database.DeleteResult> deleteRecords(
    List<Id> recordIds,
    Boolean allOrNone
  ) {
    List<Database.DeleteResult> results = conn.deleteRecords(
      enforceFLS(recordIds, DatabaseOperation.DML_DELETE),
      allOrNone
    );
    return results;
  }
  /**
   * @description Undeletes a single record
   * @param recordIds Id of the record to undelete
   * @return Database.UndeleteResult from the dml operation
   * @throws DataExceptions.FlsException {@link DataExceptions.FlsException}
   */
  public static Database.UndeleteResult undeleteRecord(Id recordId) {
    return undeleteRecords(new List<Id>{ recordId })[0];
  }
  /**
   * @description Undeletes a collection of records
   * @param recordIds Ids of the records to undelete
   * @return List<Database.UndeleteResult> from the dml operation
   * @throws DataExceptions.FlsException {@link DataExceptions.FlsException}
   */
  public static List<Database.UndeleteResult> undeleteRecords(
    List<Id> recordIds
  ) {
    return undeleteRecords(recordIds, true);
  }
  /**
   * @description Undeletes a collection of records
   * @param recordIds Ids of the records to undelete
   * @param allOrNone Whether partial conn writes should be allowed
   * @return List<Database.UndeleteResult> from the dml operation
   * @throws DataExceptions.FlsException {@link DataExceptions.FlsException}
   */
  public static List<Database.UndeleteResult> undeleteRecords(
    List<Id> recordIds,
    Boolean allOrNone
  ) {
    List<Database.UndeleteResult> results = conn.undeleteRecords(
      enforceFLS(recordIds, DatabaseOperation.DML_UNDELETE),
      allOrNone
    );
    return results;
  }

  /**
   * @description Helper that enforces FLS on records based on
   * data settings. Used for most operations.
   * @param records Records to check permissions on
   * @param accessCheckType [System.AccessType](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_enum_System_AccessType.htm) type to use to check perms
   * @return Valid records to execute DML on
   * @throws DataExceptions.FlsException {@link DataExceptions.FlsException}
   */
  @TestVisible
  private static List<SObject> enforceFLS(
    List<SObject> records,
    System.AccessType accessCheckType
  ) {
    // not enforcing fls just early exit with the original records
    if (!DataSettings.getInstance().isFlsEnforced()) {
      return records;
    }
    System.SObjectAccessDecision decision = System.Security.stripInaccessible(
      accessCheckType,
      records
    );
    if (decision.getRemovedFields().isEmpty()) {
      return records;
    } else {
      Set<String> removedFields = new Set<String>();
      for (String sObj : decision.getRemovedFields().keySet()) {
        for (String field : decision.getRemovedFields().get(sObj)) {
          removedFields.add(sObj + '.' + field);
        }
      }
      throw new DataExceptions.FLSException(
        accessCheckType,
        new List<String>(removedFields)
      );
    }
  }
  /**
   * @description Helper that enforces FLS on records based on
   * data settings. Used for delete operations.
   * @param recordIds Ids of records to check permissions on
   * @param operation {@link DatabaseOperation} type to use to check perms
   * @return Valid records to execute DML on
   * @throws DataExceptions.FlsException {@link DataExceptions.FlsException}
   */
  @TestVisible
  private static List<Id> enforceFLS(
    List<Id> recordIds,
    DatabaseOperation operation
  ) {
    if (!SecuritySettings.getInstance().isFlsEnforced()) {
      return recordIds;
    }
    Set<String> objectsWithoutAccess = new Set<String>();
    for (Id recordId : recordIds) {
      SObjectInspector insp = new SObjectInspector(recordId);
      if (
        (operation == DatabaseOperation.DML_DELETE && !insp.canDelete()) ||
        (operation == DatabaseOperation.DML_UNDELETE && !insp.canDelete())
      ) {
        objectsWithoutAccess.add(String.valueOf(insp.getSObjectType()));
      }
    }
    if (!objectsWithoutAccess.isEmpty()) {
      throw new DataExceptons.FlsException(
        operation,
        new List<String>(objectsWithoutAccess)
      );
    }
    return recordIds;
  }
}
