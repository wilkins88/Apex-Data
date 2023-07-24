@IsTest
private inherited sharing class SelectorTest {
  private static final String RELATION_NAME_1 = 'MyCustomRelation__r';
  private static final String RELATION_NAME_2 = 'MyOtherCustomRelation__r';

  @TestSetup
  private static void makeData() {
    Account acct1 = new Account(Name = 'Test Account 1');
    Account acct2 = new Account(Name = 'Test Account 2');
    Account acct3 = new Account(Name = 'Test Account 3');
    insert new List<Account>{ acct1, acct2, acct3 };
  }

  @IsTest
  private static void setFields_accountFields_fieldsSetCorrectly() {
    Selector testSelector = new AccountSelectorMock();
    System.Test.startTest();
    testSelector.setFields(
      new List<Schema.SObjectField>{ Account.Name, Account.Industry }
    );
    System.Test.stopTest();
    System.assertEquals(
      2,
      testSelector.fields.size(),
      'Should set both fields in the selector'
    );
    System.assertEquals(
      Account.name,
      testSelector.fields[0],
      'First field should be correct'
    );
    System.assertEquals(
      Account.Industry,
      testSelector.fields[1],
      'Second field should be correct'
    );
  }

  @IsTest
  private static void addRelatedListQuery_noEntriesExist_addNewEntry() {
    Selector testSelector = new AccountSelectorMock();
    System.Test.startTest();
    testSelector.addRelatedListQuery(
      RELATION_NAME_1,
      new List<Schema.SObjectField>{ Account.Industry }
    );
    System.Test.stopTest();
    System.assertEquals(
      1,
      testSelector.relatedListQueries.size(),
      'Should only have the 1 new entry'
    );
    System.assertEquals(
      true,
      testSelector.relatedListQueries.containsKey(RELATION_NAME_1),
      'Should have the entry set'
    );
    System.assertEquals(
      Account.Industry,
      testSelector.relatedListQueries.get(RELATION_NAME_1)[0]
    );
  }

  @IsTest
  private static void addRelatedListQuery_differentEntryExists_addNewEntry() {
    Selector testSelector = new AccountSelectorMock();
    testSelector.relatedListQueries.put(
      RELATION_NAME_2,
      new List<Schema.SObjectField>{ Contact.FirstName }
    );
    System.Test.startTest();
    testSelector.addRelatedListQuery(
      RELATION_NAME_1,
      new List<Schema.SObjectField>{ Account.Industry }
    );
    System.Test.stopTest();
    System.assertEquals(
      2,
      testSelector.relatedListQueries.size(),
      'Should contain 2 keys after adding'
    );
    System.assertEquals(
      true,
      testSelector.relatedListQueries.containsKey(RELATION_NAME_1),
      'Should have the new entry'
    );
    System.assertEquals(
      true,
      testSelector.relatedListQueries.containsKey(RELATION_NAME_2),
      'Should still have the old entry'
    );
    System.assertEquals(
      Account.Industry,
      testSelector.relatedListQueries.get(RELATION_NAME_1)[0],
      'Should have the entry set'
    );
  }

  @IsTest
  private static void addRelatedListQuery_sameEntryExists_replaceEntry() {
    Selector testSelector = new AccountSelectorMock();
    testSelector.relatedListQueries.put(
      RELATION_NAME_1,
      new List<Schema.SObjectField>{ Contact.FirstName }
    );
    System.Test.startTest();
    testSelector.addRelatedListQuery(
      RELATION_NAME_1,
      new List<Schema.SObjectField>{ Account.Industry }
    );
    System.Test.stopTest();
    System.assertEquals(
      1,
      testSelector.relatedListQueries.size(),
      'Should only have the 1 entry'
    );
    System.assertEquals(
      true,
      testSelector.relatedListQueries.containsKey(RELATION_NAME_1),
      'Should contain the correct entry'
    );
    System.assertEquals(
      Account.Industry,
      testSelector.relatedListQueries.get(RELATION_NAME_1)[0],
      'Should reset values for the entry'
    );
  }

  @IsTest
  private static void addCrossObjectQuery_noEntriesExist_addNewEntry() {
    Selector testSelector = new AccountSelectorMock();
    System.Test.startTest();
    testSelector.addCrossObjectQuery(
      RELATION_NAME_1,
      new List<Schema.SObjectField>{ Account.Industry }
    );
    System.Test.stopTest();
    System.assertEquals(
      1,
      testSelector.crossObjectQueries.size(),
      'Should only have the 1 new entry'
    );
    System.assertEquals(
      true,
      testSelector.crossObjectQueries.containsKey(RELATION_NAME_1),
      'Should have the entry set'
    );
    System.assertEquals(
      Account.Industry,
      testSelector.crossObjectQueries.get(RELATION_NAME_1)[0]
    );
  }

  @IsTest
  private static void addCrossObjectQuery_differentEntryExists_addNewEntry() {
    Selector testSelector = new AccountSelectorMock();
    testSelector.crossObjectQueries.put(
      RELATION_NAME_2,
      new List<Schema.SObjectField>{ Contact.FirstName }
    );
    System.Test.startTest();
    testSelector.addCrossObjectQuery(
      RELATION_NAME_1,
      new List<Schema.SObjectField>{ Account.Industry }
    );
    System.Test.stopTest();
    System.assertEquals(
      2,
      testSelector.crossObjectQueries.size(),
      'Should contain 2 keys after adding'
    );
    System.assertEquals(
      true,
      testSelector.crossObjectQueries.containsKey(RELATION_NAME_1),
      'Should have the new entry'
    );
    System.assertEquals(
      true,
      testSelector.crossObjectQueries.containsKey(RELATION_NAME_2),
      'Should still have the old entry'
    );
    System.assertEquals(
      Account.Industry,
      testSelector.crossObjectQueries.get(RELATION_NAME_1)[0],
      'Should have the entry set'
    );
  }

  @IsTest
  private static void addCrossObjectQuery_sameEntryExists_replaceEntry() {
    Selector testSelector = new AccountSelectorMock();
    testSelector.crossObjectQueries.put(
      RELATION_NAME_1,
      new List<Schema.SObjectField>{ Contact.FirstName }
    );
    System.Test.startTest();
    testSelector.addCrossObjectQuery(
      RELATION_NAME_1,
      new List<Schema.SObjectField>{ Account.Industry }
    );
    System.Test.stopTest();
    System.assertEquals(
      1,
      testSelector.crossObjectQueries.size(),
      'Should only have the 1 entry'
    );
    System.assertEquals(
      true,
      testSelector.crossObjectQueries.containsKey(RELATION_NAME_1),
      'Should contain the correct entry'
    );
    System.assertEquals(
      Account.Industry,
      testSelector.crossObjectQueries.get(RELATION_NAME_1)[0],
      'Should reset values for the entry'
    );
  }

  @IsTest
  private static void clearRelatedListQuery_entriesExists_clearEntries() {
    Selector testSelector = new AccountSelectorMock();
    testSelector.relatedListQueries.put(
      RELATION_NAME_1,
      new List<Schema.SObjectField>{ Account.Industry }
    );
    System.Test.startTest();
    testSelector.clearRelatedListQueries();
    System.Test.stopTest();
    System.assertEquals(
      0,
      testSelector.relatedListQueries.size(),
      'Should clear out all entries'
    );
  }

  @IsTest
  private static void clearCrossObjectQueries_entriesExists_clearEntries() {
    Selector testSelector = new AccountSelectorMock();
    testSelector.crossObjectQueries.put(
      RELATION_NAME_1,
      new List<Schema.SObjectField>{ Account.Industry }
    );
    System.Test.startTest();
    testSelector.clearCrossObjectQueries();
    System.Test.stopTest();
    System.assertEquals(
      0,
      testSelector.crossObjectQueries.size(),
      'Should clear out all entries'
    );
  }

  @IsTest
  private static void getById_multipleAccountsExist_retrieve1Account() {
    Account acct = [SELECT Id FROM Account LIMIT 1];
    Selector testSelector = new AccountSelectorMock();
    testSelector.fields = new List<Schema.SObjectField>{
      Account.Id,
      Account.Name
    };
    System.Test.startTest();
    List<Account> results = (List<Account>) testSelector.getById(
      new Set<Id>{ acct.Id }
    );
    System.Test.stopTest();
    System.assertEquals(
      1,
      results.size(),
      'Should only return the record for the provided id'
    );
    System.assertEquals(
      acct.Id,
      results[0].Id,
      'Should return the correct record'
    );
    System.assertEquals(
      true,
      results[0].isSet(Account.Name),
      'Should return set fields'
    );
    System.assertEquals(
      false,
      results[0].isSet(Account.Industry),
      'Should not return fields that are not set'
    );
  }

  @IsTest
  private static void getByName_2names_return1Record() {
    Selector testSelector = new AccountSelectorMock();
    testSelector.fields = new List<Schema.SObjectField>{
      Account.Id,
      Account.Name
    };
    System.Test.startTest();
    List<Account> results = (List<Account>) testSelector.getByName(
      new Set<String>{ 'Test Account 2', 'Not a name' }
    );
    System.Test.stopTest();
    Assert.areEqual(1, results.size(), 'Should return 1 result');
    Assert.areEqual(
      'Test Account 2',
      results[0].Name,
      'Should return the correct account'
    );
  }

  @IsTest
  private static void getAll_returnAllRescords() {
    Selector testSelector = new AccountSelectorMock();
    testSelector.fields = new List<Schema.SObjectField>{ Account.Id };
    System.Test.startTest();
    List<Account> results = (List<Account>) testSelector.getAll();
    System.Test.stopTest();
    Assert.areEqual(3, results.size(), 'Should return all 3 accounts');
  }

  private inherited sharing class AccountSelectorMock extends Selector {
    public override Schema.SObjectType getSObjectType() {
      return Account.getSObjectType();
    }
  }
}
