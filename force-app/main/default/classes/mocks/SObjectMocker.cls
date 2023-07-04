/**
 * @description Class used for mocking sObjects to generate fake ids, data, etc.
 *
 * @group ApexData
 * @auther Tom Wilkins
 */
@IsTest
public inherited sharing class SObjectMocker {
  private static Map<Schema.SObjectType, Integer> currentIndex {
    get {
      if (currentIndex == null) {
        currentIndex = new Map<Schema.SObjectType, Integer>();
      }
      return currentIndex;
    }
    set;
  }

  private Schema.SObjectType sObjType;

  /**
   * @description Constructor
   * @param sObjType The type of sobject that should be mocked by this instance
   */
  public SObjectMocker(Schema.SObjectType sObjType) {
    this.sObjType = sObjType;
    if (!currentIndex.containsKey(this.sObjType)) {
      currentIndex.put(this.sObjType, 0);
    }
  }

  /**
   * @description Generates a mock id for the injected sobject type
   * @return Mock Id for the injected sobject type
   */
  public Id generateMockId() {
    String result = String.valueOf(currentIndex.get(this.sObjType));
    currentIndex.put(this.sObjType, currentIndex.get(this.sObjType) + 1);
    return this.sObjType.getDescribe().getKeyPrefix() +
      '0'.repeat(12 - result.length()) +
      result;
  }
}
