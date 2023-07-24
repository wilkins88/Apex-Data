@IsTest
private inherited sharing class SelectorFactoryTest {
  @IsTest
  private static void create_validType_returnSelector() {
    SelectorFactory fact = new SelectorFactory();
    System.Test.startTest();
    AccountSelectorMock selectorMock = (AccountSelectorMock) fact.create(
      AccountSelectorMock.class
    );
    System.Test.stopTest();
    System.assertEquals(
      Account.getSObjectType(),
      selectorMock.getSObjectType(),
      'Should return a valid selector based on type'
    );
  }

  @IsTest
  private static void create_InvalidType_throwRuntimeError() {
    SelectorFactory fact = new SelectorFactory();
    String errorMessage = '';
    System.Test.startTest();
    try {
      Selector toFail = fact.create(SelectorFactory.class);
    } catch (System.TypeException e) {
      errorMessage = e.getMessage();
    }
    System.Test.stopTest();
    System.assert(errorMessage.containsIgnoreCase('Invalid conversion'));
  }

  private inherited sharing class AccountSelectorMock extends Selector {
    public override Schema.SObjectType getSObjectType() {
      return Account.getSObjectType();
    }
  }
}
