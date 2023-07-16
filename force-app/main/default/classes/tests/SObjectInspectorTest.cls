@IsTest
private inherited sharing class SObjectInspectorTest {
  @IsTest
  private static void getAllFields_account_fieldsReturned() {
    SObjectInspector insp = new SObjectInspector(Account.getSObjectType());
    System.Test.startTest();
    List<Schema.SObjectField> fields = insp.getAllFields();
    System.Test.stopTest();
    Assert.isTrue(fields.size() > 0, 'Should return some field values');
  }
  @IsTest
  private static void getField_industryOnAccount_returnField() {
    SObjectMocker mocker = new SObjectMocker(Account.getSObjectType());
    SObjectInspector insp = new SObjectInspector(mocker.generateMockId());
    System.Test.startTest();
    Schema.SObjectField field = insp.getField('Industry');
    System.Test.stopTest();
    assert.areEqual(
      'Industry',
      field.getDescribe().getName(),
      'Should return the correct field'
    );
  }
  @IsTest
  private static void getPicklistValues_industryOnAccount_returnValues() {
    SObjectInspector insp = new SObjectInspector(Account.getSObjectType());
    System.Test.startTest();
    List<Schema.PicklistEntry> values = insp.getPicklistValues(
      Account.Industry
    );
    System.Test.stopTest();
    System.debug(values);
    Assert.isTrue(
      values.size() > 0,
      'Should return some picklist values for industry'
    );
  }
  @IsTest
  private static void getRecordTypeDeveloperName_mockedRecordTypeId_returnNull() {
    SObjectMocker mocker = new SObjectMocker(RecordType.getSObjectType());
    SObjectInspector insp = new SObjectInspector(Account.getSObjectType());
    System.Test.startTest();
    String devName = insp.getRecordTypeDeveloperName(mocker.generateMockId());
    System.Test.stopTest();
    Assert.isNull(devName, 'Dev name should not exist for mocked id');
  }
  @IsTest
  private static void getRecordTypeId_noRecordTypeEnabled_returnNull() {
    SObjectInspector insp = new SObjectInspector(Account.getSObjectType());
    System.Test.startTest();
    Id rtId = insp.getRecordTypeDeveloperName('Master');
    System.Test.stopTest();
    Assert.isNull(rtId, 'Should return no id for sobject with no record type');
  }
}
