/**
 * @descsription SObject inspector used to inspect, explore, and retrieve farious aspects of SObject records
 *
 * @group ApexData
 * @author Tom Wilkins
 */
public inherited sharing class SObjectInspector {
  @TestVisible
  private Schema.SObjectType sObjType;

  @TestVisible
  private Schema.DescribeSObjectResult describeResult {
    get {
      if (this.describeResult == null) {
        this.describeResult = this.sObjType.getDescribe();
      }
      return this.describeResult;
    }
    set;
  }

  /**
   * @description Constructor
   * @param sObjType Type of SObject to inspect
   */
  public SObjectInspector(Schema.SObjectType sObjType) {
    this.sObjType = sObjType;
  }
  /**
   * @description Constructor for parsing sobject information from an Id
   * @param recordId Id of the record to retrieve sObject information about
   */
  public SObjectInspector(Id recordId) {
    this.sObjType = recordId.getSobjectType();
  }
  /**
   * @description Returns all fields for the provided sobject type
   * @return All fields for the SObject type
   */
  public List<Schema.SObjectField> getAllFields() {
    return this.describeResult.fields.getMap().values();
  }
  /**
   * @description Returns a single field for the provided sobject type
   * @return The field captured by the fieldname, null if invalid field name for the sobject type
   */
  public Schema.SObjectField getField(String fieldName) {
    return this.describeResult.fields.getMap().get(fieldName);
  }
  /**
   * @description Returns the picklist values for the provided field
   * @param field Field to retrieve picklist values for
   * @return list of picklist values
   */
  public List<Schema.PicklistEntry> getPicklistValues(
    Schema.SObjectField field
  ) {
    return this.getPicklistValues(String.valueOf(field));
  }
  /**
   * @description Returns the picklist values for the provided field name
   * @param fieldName Name of the field to retrieve picklist values for
   * @return list of picklist values
   */
  public List<Schema.PicklistEntry> getPicklistValues(String fieldName) {
    return this.describeResult.fields.getMap()
      .get(fieldName)
      .getDescribe()
      .getPicklistValues();
  }
  /**
   * @description Returns the record type id for the provided record type developer name
   * @param recordTypeDevName The developer name of the record type to retrieve the id for
   * @return Record Id for the provided dev name, null if invalid record type dev name
   */
  public Id getRecordTypeId(String recordTypeDevName) {
    return this.describeResult.getRecordTypeInfosByDeveloperName()
      ?.get(recordTypeDevName)
      ?.getRecordTypeId();
  }
  /**
   * @description Returns the record type dev name for the provided record type id
   * @param recordTypeDevName The id of the record type to retrieve the developer name for
   * @return Record Id for the provided dev name, null if invalid record type id
   */
  public String getRecordTypeDeveloperName(Id recordTypeId) {
    return this.describeResult.getRecordTypeInfosById()
      ?.get(recordTypeId)
      ?.getDeveloperName();
  }
  /**
   * @description Returns whether or not the current user can delete the injected sobject type
   * @return True if can delete, false otherwise
   */
  public Boolean canDelete() {
    return this.describeResult.deletable();
  }
}
