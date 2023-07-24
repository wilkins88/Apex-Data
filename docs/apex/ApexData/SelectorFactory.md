---
layout: default
---
# SelectorFactory

Factory class for producing selectors to allow decoupling of construction
and utilization


**Group** ApexData


**Author** Tom Wilkins

## Methods
### `public create(Type selectorType)`

Creates the selector established by the provided type and casts it to a selector. Will throw a runtime exception if the type provided is not a concrete selector class

---
