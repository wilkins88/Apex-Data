/**
 * @description Class used for mocking sObjects to generate fake ids, data, etc.
 *
 * @group ApexData
 * @auther Tom Wilkins
 */
@IsTest
public inherited sharing class SObjectMocker {
  @TestVisible
  private static Map<Schema.SObjectType, Integer> currentIndex {
    get {
      if (currentIndex == null) {
        currentIndex = new Map<Schema.SObjectType, Integer>();
      }
      return currentIndex;
    }
    set;
  }
  @TestVisible
  private SmartDataFactory dataFactory {
    get {
      if (this.dataFactory == null) {
        this.dataFactory = new SmartDataFactory();
      }
      return this.dataFactory;
    }
    set;
  }
  @TestVisible
  private Map<String, List<SObject>> relatedLists {
    get {
      if (this.relatedLists == null) {
        this.relatedLists = new Map<String, List<SObject>>();
      }
      return this.relatedLists;
    }
    set;
  }
  @TestVisible
  private Boolean generateids = false;
  @TestVisible
  private Schema.SObjectType sObjType;
  @TestVisible
  private System.Type sObjClassType;

  /**
   * @description Constructor
   * @param sObjType The type of sobject that should be mocked by this instance
   */
  public SObjectMocker(Schema.SObjectType sObjType) {
    this(sObjType, null);
  }

  /**
   * @description Constructor - Both schema and system types
   * @param sObjType The type of sobject that should be mocked by this instance
   * @param sObjClasstype The class type of object -- should match the sobject type injected
   */
  public SObjectMocker(Schema.SObjectType sObjType, System.Type sObjClassType) {
    this.sObjType = sObjType;
    this.sObjClassType = sObjClassType;
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
  /**
   * @description Sets whether or not the mocker should generate ids for records
   * @param generateIds Whether or not the mocker should generated ids
   * @return Reference to the invoking object
   */
  public SObjectMocker shouldGenerateIds(Boolean generateIds) {
    this.generateIds = generateIds;
    return this;
  }
  /**
   * @description Sets a related list that will be created with each generated SObject
   * @param relatedListName API name for the related list
   * @param relatedListRecords Records to be captured as a part of the related list
   * @return Reference to the invoking object
   */
  public SObjectMocker setRelatedList(
    String relatedListName,
    List<SObject> relatedListRecords
  ) {
    this.relatedLists.put(relatedListName, relatedListRecords);
    return this;
  }
}
