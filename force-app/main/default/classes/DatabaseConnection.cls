/**
 * @description Standard database connection that wraps the system Database API for various dml operations.
 *
 * @group ApexData
 * @author Tom Wilkins
 */
public inherited sharing class DatabaseConnection implements IDatabaseConnection {
  /**
   * @see {@link IDatabaseConnection}
   */
  public List<Database.SaveResult> insertRecords(
    List<SObject> records,
    Database.DMLOptions options
  ) {
    if (options == null) {
      return Database.insert(records);
    } else {
      return Database.insert(records, options);
    }
  }
  /**
   * @see {@link IDatabaseConnection}
   */
  public List<Database.SaveResult> updateRecords(
    List<SObject> records,
    Database.DMLOptions options
  ) {
    if (options == null) {
      return Database.update(records);
    } else {
      return Database.update(records, options);
    }
  }
  /**
   * @see {@link IDatabaseConnection}
   */
  public List<Database.UpsertResult> upsertRecords(
    List<SObject> records,
    Boolean allOrNone
  ) {
    return Database.upsert(records, allOrNone);
  }
  /**
   * @see {@link IDatabaseConnection}
   */
  public List<Database.UpsertResult> upsertRecords(
    List<SObject> records,
    Schema.SObjectField externalIdField,
    Boolean allOrNone
  ) {
    return Database.upsert(records, externalIdField, allOrNone);
  }
  /**
   * @see {@link IDatabaseConnection}
   */
  public List<Database.DeleteResult> deleteRecords(
    List<Id> recordIds,
    Boolean allOrNone
  ) {
    return Database.delete(recordIds, allOrNone);
  }
  /**
   * @see {@link IDatabaseConnection}
   */
  public List<Database.UndeleteResult> undeleteRecords(
    List<Id> recordIds,
    Boolean allOrNone
  ) {
    return Database.undelete(recordIds, allOrNone);
  }
}
