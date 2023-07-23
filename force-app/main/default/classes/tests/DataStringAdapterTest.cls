@IsTest
private inherited sharing class DataStringAdapterTest {
  @IsTest
  private static void fromAccessType_creatable_returnInsertString() {
    DataStringAdapter stringAdapter = new DataStringAdapter();
    System.Test.startTest();
    String result = stringAdapter.fromAccessType(System.AccessType.CREATABLE);
    System.Test.stopTest();
    Assert.areEqual(
      DataStringAdapter.INSERT_STRING,
      result,
      'Should return the insert string'
    );
  }
  @IsTest
  private static void fromAccessType_readable_returnReadString() {
    DataStringAdapter stringAdapter = new DataStringAdapter();
    System.Test.startTest();
    String result = stringAdapter.fromAccessType(System.AccessType.READABLE);
    System.Test.stopTest();
    Assert.areEqual(
      DataStringAdapter.READ_STRING,
      result,
      'Should return the read string'
    );
  }
  @IsTest
  private static void fromAccessType_updatable_returnUpdateString() {
    DataStringAdapter stringAdapter = new DataStringAdapter();
    System.Test.startTest();
    String result = stringAdapter.fromAccessType(System.AccessType.UPDATABLE);
    System.Test.stopTest();
    Assert.areEqual(
      DataStringAdapter.UPDATE_STRING,
      result,
      'Should return the update string'
    );
  }
  @IsTest
  private static void fromAccessType_upsertable_returnUpsertString() {
    DataStringAdapter stringAdapter = new DataStringAdapter();
    System.Test.startTest();
    String result = stringAdapter.fromAccessType(System.AccessType.UPSERTABLE);
    System.Test.stopTest();
    Assert.areEqual(
      DataStringAdapter.UPSERT_STRING,
      result,
      'Should return the upsert string'
    );
  }
  @IsTest
  private static void fromAccessType_null_returnEmptyString() {
    DataStringAdapter stringAdapter = new DataStringAdapter();
    System.Test.startTest();
    String result = stringAdapter.fromAccessType(null);
    System.Test.stopTest();
    Assert.areEqual('', result, 'Should return an empty string');
  }
  @IsTest
  private static void fromDatabaseOperation_insert_returnInsertString() {
    DataStringAdapter stringAdapter = new DataStringAdapter();
    System.Test.startTest();
    String result = stringAdapter.fromDatabaseOperation(
      DatabaseOperation.DML_INSERT
    );
    System.Test.stopTest();
    Assert.areEqual(
      DataStringAdapter.INSERT_STRING,
      result,
      'Should return the insert string'
    );
  }
  @IsTest
  private static void fromDatabaseOperation_update_returnUpdateString() {
    DataStringAdapter stringAdapter = new DataStringAdapter();
    System.Test.startTest();
    String result = stringAdapter.fromDatabaseOperation(
      DatabaseOperation.DML_UPDATE
    );
    System.Test.stopTest();
    Assert.areEqual(
      DataStringAdapter.UPDATE_STRING,
      result,
      'Should return the update string'
    );
  }
  @IsTest
  private static void fromDatabaseOperation_upsert_returnUpsertString() {
    DataStringAdapter stringAdapter = new DataStringAdapter();
    System.Test.startTest();
    String result = stringAdapter.fromDatabaseOperation(
      DatabaseOperation.DML_UPSERT
    );
    System.Test.stopTest();
    Assert.areEqual(
      DataStringAdapter.UPSERT_STRING,
      result,
      'Should return the upsert string'
    );
  }
  @IsTest
  private static void fromDatabaseOperation_delete_returnDeleteString() {
    DataStringAdapter stringAdapter = new DataStringAdapter();
    System.Test.startTest();
    String result = stringAdapter.fromDatabaseOperation(
      DatabaseOperation.DML_DELETE
    );
    System.Test.stopTest();
    Assert.areEqual(
      DataStringAdapter.DELETE_STRING,
      result,
      'Should return the delete string'
    );
  }
  @IsTest
  private static void fromDatabaseOperation_undelete_returnUndeleteString() {
    DataStringAdapter stringAdapter = new DataStringAdapter();
    System.Test.startTest();
    String result = stringAdapter.fromDatabaseOperation(
      DatabaseOperation.DML_UNDELETE
    );
    System.Test.stopTest();
    Assert.areEqual(
      DataStringAdapter.UNDELETE_STRING,
      result,
      'Should return the undelete string'
    );
  }
  @IsTest
  private static void fromDatabaseOperation_null_returnEmptyString() {
    DataStringAdapter stringAdapter = new DataStringAdapter();
    System.Test.startTest();
    String result = stringAdapter.fromDatabaseOperation(null);
    System.Test.stopTest();
    Assert.areEqual('', result, 'Should return an empty string');
  }
}
