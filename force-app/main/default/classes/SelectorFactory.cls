/**
 * @description Factory class for producing selectors to allow decoupling of construction
 * and utilization
 *
 * @group ApexData
 * @author Tom Wilkins
 */
public inherited sharing class SelectorFactory {
  /**
   * @description Creates the selector established by the provided type and
   * casts it to a selector. Will throw a runtime exception if the type provided is not
   * a concrete selector class
   */
  public Selector create(Type selectorType) {
    return (Selector) selectorType.newInstance();
  }
}
