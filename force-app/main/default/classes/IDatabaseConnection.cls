/**
 * @description Base interface for datqabase connections. Primarily used to decouple libraries
 * from standard DML and to support mocking
 *
 * @group ApexData
 * @author Tom Wilkins
 */
public interface IDatabaseConnection {
  /**
   * @description Inserts a collection of records with dml options
   * @param records Records to insert
   * @param options Dml options to set for dml operation
   * @return Save results from the insert operation
   */
  List<Database.SaveResult> insertRecords(
    List<SObject> records,
    Database.DMLOptions options
  );
  /**
   * @description Updates a collection of records with dml options
   * @param records Records to update
   * @param options Dml options to set for dml operation
   * @return Save results from the update operation
   */
  List<Database.SaveResult> updateRecords(
    List<SObject> records,
    Database.DMLOptions options
  );
  /**
   * @description Upserts a collection of records with an all or none flag
   * @param records Records to update
   * @param allOrNone Whether or not the upsert operation should be all or none
   * @return Upsert results from the upsert operation
   */
  List<Database.UpsertResult> upsertRecords(
    List<SObject> records,
    Boolean allOrNone
  );
  /**
   * @description Upserts a collection of records with an all or none flag
   * @param records Records to update
   * @param externalIdField External Id field to upsert on
   * @param allOrNone Whether or not the upsert operation should be all or none
   * @return Upsert results from the upsert operation
   */
  List<Database.UpsertResult> upsertRecords(
    List<SObject> records,
    Schema.SObjectField externalIdField,
    Boolean allOrNone
  );
  /**
   * @description Deletes a collection of records with an all or none flag
   * @param recordIds Ids of records to delete
   * @param allOrNone Whether or not the delete operation should be all or none
   * @return Delete results from the delete operation
   */
  List<Database.DeleteResult> deleteRecords(
    List<Id> recordIds,
    Boolean allOrNone
  );
  /**
   * @description Undeletes a collection of records with an all or none flag
   * @param recordIds Ids of records to undelete
   * @param allOrNone Whether or not the undelete operation should be all or none
   * @return Undelete results from the undelete operation
   */
  List<Database.UndeleteResult> undeleteRecords(
    List<Id> recordIds,
    Boolean allOrNone
  );
}
