@IsTest
private inherited sharing class DatabaseConnectionTest {
  @IsTest
  private static void insertRecords_noOptions_recordInserted() {
    ApexDataTestObject__c testObj = new ApexDataTestObject__c();
    DatabaseConnection conn = new DatabaseConnection();
    System.Test.startTest();
    List<Database.SaveResult> results = conn.insertRecords(
      new List<SObject>{ testObj },
      null
    );
    System.Test.stopTest();
    Assert.areEqual(
      1,
      results.size(),
      'Should return the 1 result from the insert operation'
    );
    List<ApexDataTestObject__c> resultingObject = [
      SELECT Id
      FROM ApexDataTestObject__c
    ];
    Assert.areEqual(
      1,
      resultingObject.size(),
      'Should only create the 1 record'
    );
    Assert.areEqual(
      resultingObject[0].Id,
      results[0].getId(),
      'Id of the records should match'
    );
  }

  @IsTest
  private static void insertRecords_withOptions_recordInserted() {
    ApexDataTestObject__c testObj = new ApexDataTestObject__c();
    Database.DMLOptions options = new Database.DMLOptions();
    options.OptAllOrNone = true;
    DatabaseConnection conn = new DatabaseConnection();
    System.Test.startTest();
    List<Database.SaveResult> results = conn.insertRecords(
      new List<SObject>{ testObj },
      options
    );
    System.Test.stopTest();
    Assert.areEqual(
      1,
      results.size(),
      'Should return the 1 result from the insert operation'
    );
    List<ApexDataTestObject__c> resultingObject = [
      SELECT Id
      FROM ApexDataTestObject__c
    ];
    Assert.areEqual(
      1,
      resultingObject.size(),
      'Should only create the 1 record'
    );
    Assert.areEqual(
      resultingObject[0].Id,
      results[0].getId(),
      'Id of the records should match'
    );
  }
  @IsTest
  private static void updateRecords_noOptions_recordUpdated() {
    ApexDataTestObject__c testObj = new ApexDataTestObject__c(
      TestExternalId__c = '123'
    );
    insert testObj;
    testObj.TestExternalId__c = 'abc';
    DatabaseConnection conn = new DatabaseConnection();
    System.Test.startTest();
    List<Database.SaveResult> results = conn.updateRecords(
      new List<SObject>{ testObj },
      null
    );
    System.Test.stopTest();
    Assert.areEqual(
      1,
      results.size(),
      'Should return the 1 result from the update operation'
    );
    List<ApexDataTestObject__c> resultingObject = [
      SELECT Id, TestExternalId__c
      FROM ApexDataTestObject__c
    ];
    Assert.areEqual(
      1,
      resultingObject.size(),
      'Should only create the 1 record'
    );
    Assert.areEqual(
      resultingObject[0].Id,
      results[0].getId(),
      'Id of the records should match'
    );
    Assert.areEqual(
      'abc',
      resultingObject[0].TestExternalId__c,
      'External id field should be updated'
    );
  }

  @IsTest
  private static void updateRecords_withOptions_recordUpdated() {
    ApexDataTestObject__c testObj = new ApexDataTestObject__c(
      TestExternalId__c = '123'
    );
    insert testObj;
    testObj.TestExternalId__c = 'abc';
    Database.DMLOptions options = new Database.DMLOptions();
    options.OptAllOrNone = true;
    DatabaseConnection conn = new DatabaseConnection();
    System.Test.startTest();
    List<Database.SaveResult> results = conn.updateRecords(
      new List<SObject>{ testObj },
      options
    );
    System.Test.stopTest();
    Assert.areEqual(
      1,
      results.size(),
      'Should return the 1 result from the update operation'
    );
    List<ApexDataTestObject__c> resultingObject = [
      SELECT Id, TestExternalId__c
      FROM ApexDataTestObject__c
    ];
    Assert.areEqual(
      1,
      resultingObject.size(),
      'Should only create the 1 record'
    );
    Assert.areEqual(
      resultingObject[0].Id,
      results[0].getId(),
      'Id of the records should match'
    );
    Assert.areEqual(
      'abc',
      resultingObject[0].TestExternalId__c,
      'Id of the records should match'
    );
  }
  @IsTest
  private static void upsertRecords_recordExists_recordUpdated() {
    ApexDataTestObject__c testObj = new ApexDataTestObject__c();
    insert testObj;
    testObj.TestText__c = '123';
    DatabaseConnection conn = new DatabaseConnection();
    System.Test.startTest();
    List<Database.UpsertResult> results = conn.upsertRecords(
      new List<SObject>{ testObj },
      true
    );
    System.Test.stopTest();
    Assert.areEqual(
      1,
      results.size(),
      'Should return the 1 result from the upsert operation'
    );
    List<ApexDataTestObject__c> resultingObject = [
      SELECT Id, TestText__c
      FROM ApexDataTestObject__c
    ];
    Assert.areEqual(
      1,
      resultingObject.size(),
      'Should only create the 1 record'
    );
    Assert.areEqual(
      resultingObject[0].Id,
      results[0].getId(),
      'Id of the records should match'
    );
    Assert.areEqual(
      '123',
      resultingObject[0].TestText__c,
      'Should update the object appropriately'
    );
  }

  @IsTest
  private static void upsertRecords_recordDoesntExist_recordInserted() {
    ApexDataTestObject__c testObj = new ApexDataTestObject__c();
    Database.DMLOptions options = new Database.DMLOptions();
    options.OptAllOrNone = true;
    DatabaseConnection conn = new DatabaseConnection();
    System.Test.startTest();
    List<Database.UpsertResult> results = conn.upsertRecords(
      new List<SObject>{ testObj },
      true
    );
    System.Test.stopTest();
    Assert.areEqual(
      1,
      results.size(),
      'Should return the 1 result from the upsert operation'
    );
    List<ApexDataTestObject__c> resultingObject = [
      SELECT Id
      FROM ApexDataTestObject__c
    ];
    Assert.areEqual(
      1,
      resultingObject.size(),
      'Should only create the 1 record'
    );
    Assert.areEqual(
      resultingObject[0].Id,
      results[0].getId(),
      'Id of the records should match'
    );
  }
  @IsTest
  private static void upsertRecords_recordExistExternalId_recordUpdated() {
    ApexDataTestObject__c testObj = new ApexDataTestObject__c(
      TestExternalId__c = 'abc'
    );
    insert testObj;
    testObj.TestText__c = '123';
    DatabaseConnection conn = new DatabaseConnection();
    System.Test.startTest();
    List<Database.UpsertResult> results = conn.upsertRecords(
      new List<SObject>{ testObj },
      ApexDataTestObject__c.TestExternalId__c,
      true
    );
    System.Test.stopTest();
    Assert.areEqual(
      1,
      results.size(),
      'Should return the 1 result from the upsert operation'
    );
    List<ApexDataTestObject__c> resultingObject = [
      SELECT Id, TestText__c
      FROM ApexDataTestObject__c
    ];
    Assert.areEqual(
      1,
      resultingObject.size(),
      'Should only create the 1 record'
    );
    Assert.areEqual(
      resultingObject[0].Id,
      results[0].getId(),
      'Id of the records should match'
    );
    Assert.areEqual(
      '123',
      resultingObject[0].TestText__c,
      'Should update the object appropriately'
    );
  }

  @IsTest
  private static void upsertRecords_recordDoesntExistExternalId_recordInserted() {
    ApexDataTestObject__c testObj = new ApexDataTestObject__c(
      TestExternalId__c = 'abc'
    );
    Database.DMLOptions options = new Database.DMLOptions();
    options.OptAllOrNone = true;
    DatabaseConnection conn = new DatabaseConnection();
    System.Test.startTest();
    List<Database.UpsertResult> results = conn.upsertRecords(
      new List<SObject>{ testObj },
      ApexDataTestObject__c.TestExternalId__c,
      true
    );
    System.Test.stopTest();
    Assert.areEqual(
      1,
      results.size(),
      'Should return the 1 result from the upsert operation'
    );
    List<ApexDataTestObject__c> resultingObject = [
      SELECT Id
      FROM ApexDataTestObject__c
    ];
    Assert.areEqual(
      1,
      resultingObject.size(),
      'Should only create the 1 record'
    );
    Assert.areEqual(
      resultingObject[0].Id,
      results[0].getId(),
      'Id of the records should match'
    );
  }

  @IsTest
  private static void deleteRecords_recordExistsWithFlag_recordDeleted() {
    ApexDataTestObject__c testObj = new ApexDataTestObject__c();
    insert testObj;
    DatabaseConnection conn = new DatabaseConnection();
    System.Test.startTest();
    List<Database.DeleteResult> results = conn.deleteRecords(
      new List<Id>{ testObj.Id },
      true
    );
    System.Test.stopTest();
    Assert.areEqual(
      1,
      results.size(),
      'Should return the 1 result from the delete operation'
    );
    List<ApexDataTestObject__c> resultingObject = [
      SELECT Id
      FROM ApexDataTestObject__c
    ];
    Assert.areEqual(
      0,
      resultingObject.size(),
      'Should delete the only existing record'
    );
  }

  @IsTest
  private static void undeleteRecords_recordExistsAndDeletedWithFlag_recordUndeleted() {
    ApexDataTestObject__c testObj = new ApexDataTestObject__c();
    insert testObj;
    delete testObj;
    DatabaseConnection conn = new DatabaseConnection();
    System.Test.startTest();
    List<Database.UndeleteResult> results = conn.undeleteRecords(
      new List<Id>{ testObj.Id },
      true
    );
    System.Test.stopTest();
    Assert.areEqual(
      1,
      results.size(),
      'Should return the 1 result from the undelete operation'
    );
    List<ApexDataTestObject__c> resultingObject = [
      SELECT Id
      FROM ApexDataTestObject__c
    ];
    Assert.areEqual(
      1,
      resultingObject.size(),
      'Should undelete the only existing record'
    );
    Assert.areEqual(
      testObj.Id,
      resultingObject[0].Id,
      'Should undelete the correct record'
    );
  }
}
