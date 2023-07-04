/**
 * @description Mock database implementation for providing basic db functionality without requiring a coupling
 * to the Salesforce DB (which then imposes that any operation that involves dml must be unit tested)
 *
 * @group ApexData
 * @author Tom Wilkins
 */
@IsTest
public inherited sharing class MockDatabaseConnection implements IDatabaseConnection {
  @TestVisible
  private Map<Id, SObject> state {
    get {
      if (this.state == null) {
        this.state = new Map<Id, SObject>();
      }
      return this.state;
    }
    set;
  }

  @TestVisible
  private Map<Id, SObject> deletedState {
    get {
      if (this.deletedState == null) {
        this.deletedState = new Map<Id, SObject>();
      }
      return this.deletedState;
    }
    set;
  }

  @TestVisible
  private Map<Schema.SObjectType, List<SObject>> recordsBySObject {
    get {
      if (this.recordsBySObject == null) {
        this.recordsBySObject = new Map<Schema.SObjectType, List<SObject>>();
      }
      return this.recordsBySObject;
    }
    set;
  }

  @TestVisible
  private Boolean shouldSucceed {
    get {
      if (this.shouldSucceed == false) {
        this.shouldSucceed = true;
      }
      return this.shouldSucceed;
    }
    set;
  }

  @TestVisible
  private String mockedErrorMessage {
    get {
      if (this.mockedErrorMessage == null) {
        this.mockedErrorMessage = 'Mocked Error Message.';
      }
      return this.mockedErrorMessage;
    }
    set;
  }

  @TestVisible
  private String mockedErrorStatusCode {
    get {
      if (this.mockedErrorStatusCode == null) {
        this.mockedErrorStatusCode = 'MOCKED_ERROR';
      }
      return this.mockedErrorStatusCode;
    }
    set;
  }

  @TestVisible
  private List<String> mockedErrorFields {
    get {
      if (this.mockedErrorFields == null) {
        this.mockedErrorFields = new List<String>{ 'Name' };
      }
      return this.mockedErrorFields;
    }
    set;
  }

  /**
   * @description Returns a record by record id, null if the id doesn't exists
   * @param recordId Id of the record to retrieve
   * @return Record if it exists, null otherwise
   */
  public SObject getRecord(Id recordId) {
    return this.state.get(recordId);
  }
  /**
   * @description Returns a deleted record by record id, null if the id doesn't exists
   * @param recordId Id of the record to retrieve
   * @return Record if it exists, null otherwise
   */
  public SObject getDeletedRecord(Id recordId) {
    return this.deletedState.get(recordId);
  }
  /**
   * @description Returns all records for a particular SObject
   * @param sObjType The type of sobject to retrieve records for
   * @return List of all records for the requested SObject type
   */
  public List<SObject> getAllRecordsForSObject(Schema.SObjectType sObjType) {
    List<SObject> records = this.recordsBySObject.get(sObjType);
    return records == null ? new List<SObject>() : records;
  }
  /**
   * @description Sets the error state to allow for error testing
   * @param errorMessage Error message to returned in the result
   * @param errorCode Error code to be retured in the result
   * @param fields Error fields to be returned in the result
   */
  public void setErrorState(
    String errorMessage,
    String errorCode,
    List<String> fields
  ) {
    this.mockedErrorMessage = errorMessage;
    this.mockedErrorStatusCode = errorCode;
    this.mockedErrorFields = fields;
    this.shouldSucceed = false;
  }
  /**
   * @description Clears error state
   */
  public void clearErrorState() {
    this.mockedErrorMessage = null;
    this.mockedErrorStatusCode = null;
    this.mockedErrorFields = null;
    this.shouldSucceed = true;
  }
  /**
   * @see {@link IDatabaseConnection}
   */
  public List<Database.SaveResult> insertRecords(
    List<SObject> records,
    Database.DMLOptions options
  ) {
    List<Map<String, Object>> results = new List<Map<String, Object>>();
    for (SObject record : records) {
      record.Id = new SObjectMocker(record.getSObjectType()).generateMockId();
      this.state.put(record.Id, record);
      this.addRecordToSObjectGroup(record);
      results.add(this.buildBaseResult(record.Id));
    }
    return (List<Database.SaveResult>) JSON.deserialize(
      JSON.serialize(results),
      List<Database.SaveResult>.class
    );
  }
  /**
   * @see {@link IDatabaseConnection}
   */
  public List<Database.SaveResult> updateRecords(
    List<SObject> records,
    Database.DMLOptions options
  ) {
    List<Map<String, Object>> results = new List<Map<String, Object>>();
    for (SObject record : records) {
      if (String.isNotBlank(record.Id)) {
        this.state.put(record.Id, record);
        this.addRecordToSObjectGroup(record);
        results.add(this.buildBaseResult(record.Id));
      }
    }
    return (List<Database.SaveResult>) JSON.deserialize(
      JSON.serialize(results),
      List<Database.SaveResult>.class
    );
  }
  /**
   * @see {@link IDatabaseConnection}
   */
  public List<Database.UpsertResult> upsertRecords(
    List<SObject> records,
    Boolean allOrNone
  ) {
    List<Map<String, Object>> results = new List<Map<String, Object>>();
    for (SObject record : records) {
      Boolean isInsert = false;
      if (String.isBlank(record.Id)) {
        record.Id = new SObjectMocker(record.getSObjectType()).generateMockId();
        isInsert = true;
      }
      this.state.put(record.Id, record);
      this.addRecordToSObjectGroup(record);
      results.add(this.buildUpsertResult(record.Id, isInsert));
    }
    return (List<Database.UpsertResult>) JSON.deserialize(
      JSON.serialize(results),
      List<Database.UpsertResult>.class
    );
  }
  /**
   * @see {@link IDatabaseConnection}
   */
  public List<Database.UpsertResult> upsertRecords(
    List<SObject> records,
    Schema.SObjectField externalIdField,
    Boolean allOrNone
  ) {
    List<Map<String, Object>> results = new List<Map<String, Object>>();
    String fieldName = String.valueOf(externalIdField);
    for (SObject record : records) {
      List<SObject> existingRecords = this.recordsBySObject.get(
        record.getSObjectType()
      );
      for (SObject existingRecord : existingRecords) {
        if (record.get(fieldName) === existingRecord.get(fieldName)) {
          record.Id = existingRecord.Id;
          break;
        }
      }
      Boolean isInsert = false;
      if (String.isBlank(record.Id)) {
        record.Id = new SObjectMocker(record.getSObjectType()).generateMockId();
        isInsert = true;
      }
      this.state.put(record.Id, record);
      this.addRecordToSObjectGroup(record);
      results.add(this.buildUpsertResult(record.Id, isInsert));
    }
    return (List<Database.UpsertResult>) JSON.deserialize(
      JSON.serialize(results),
      List<Database.UpsertResult>.class
    );
  }
  /**
   * @see {@link IDatabaseConnection}
   */
  public List<Database.DeleteResult> deleteRecords(
    List<Id> recordIds,
    Boolean allOrNone
  ) {
    List<Map<String, Object>> results = new List<Map<String, Object>>();
    for (Id recordId : recordIds) {
      if (this.state.containsKey(recordId)) {
        this.deletedState.put(recordId, this.state.get(recordId));
        this.state.remove(recordId);
      } else {
        this.deletedState.put(
          recordId,
          recordId.getSobjectType().newSObject(recordId)
        );
      }
    }
    return (List<Database.DeleteResult>) JSON.deserialize(
      JSON.serialize(results),
      List<Database.DeleteResult>.class
    );
  }
  /**
   * @see {@link IDatabaseConnection}
   */
  public List<Database.UndeleteResult> undeleteRecords(
    List<Id> recordIds,
    Boolean allOrNone
  ) {
    List<Map<String, Object>> results = new List<Map<String, Object>>();
    for (Id recordId : recordIds) {
      if (this.deletedState.containsKey(recordId)) {
        this.state.put(recordId, this.deletedState.get(recordId));
        this.deletedState.remove(recordId);
      } else {
        this.state.put(
          recordId,
          recordId.getSobjectType().newSObject(recordId)
        );
      }
    }
    return (List<Database.UndeleteResult>) JSON.deserialize(
      JSON.serialize(results),
      List<Database.UndeleteResult>.class
    );
  }
  /**
   * @description Helper that adds a record to its appropriate sobject grouping
   * @param record record to be grouped
   */
  private void addRecordToSObjectGroup(SObject record) {
    Schema.SObjectType sObjType = record.getSObjectType();
    if (!this.recordsBySObject.containsKey(sObjType)) {
      this.recordsBySObject.put(sObjType, new List<SObject>());
    }
    this.recordsBySObject.get(sObjType).add(record);
  }
  /**
   * @description Builds the base result that can be serialized into various Database result objects
   * @param recordId Id of the record to have the result returned for
   * @return Map that can be converted to most save result types (excluding upsert)
   */
  private Map<String, Object> buildBaseResult(Id recordId) {
    Map<String, Object> result = new Map<String, Object>{
      'success' => this.shouldSucceed,
      'id' => recordId
    };
    if (!this.shouldSucceed) {
      result.put(
        'errors',
        new List<Map<String, Object>>{
          new Map<String, Object>{
            'message' => this.mockedErrorMessage,
            'statusCode' => this.mockedErrorStatusCode,
            'fields' => this.mockedErrorFields
          }
        }
      );
    }
    return result;
  }
  /**
   * @description Builds the upsert result that can be serialized and returned from upsert operations
   * @param recordId Id of the record to have the result returned for
   * @return Map that can be converted to an upsert result
   */
  private Map<String, Object> buildUpsertResult(Id recordId, Boolean isInsert) {
    Map<String, Object> result = this.buildBaseResult(recordId);
    result.put('created', isInsert);
    return result;
  }
}
