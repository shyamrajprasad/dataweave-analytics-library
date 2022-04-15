/**
* This module provides basic functionality for analyzing
* datasets of numeric and non-numeric values.
*/
%dw 2.0

/** 
* Returns the mean of an array of numbers,
* or `null` if the array is empty.
*
* === Parameters
*
* [%header, cols="1,1,3"]
* |===
* | Name | Type | Description
* | `values` | `Array<Number&#62;` | Array of numeric or null values.
* |===
*
* === Example
*
* This example shows how `mean` behaves with an array of numbers.
*
* ==== Source
*
* [source,DataWeave,linenums]
* ----
* %dw 2.0
* output application/json
*
* import mean from AnalyticsModule
* ---
* mean([1, 2, 3, 4, 5])
*
* ----
*
* ==== Output
*
* [source,Json,linenums]
* ----
* 3
* ----
*
* === Example
*
* This example shows how `mean` behaves with an empty array.
*
* ==== Source
*
* [source,DataWeave,linenums]
* ----
* %dw 2.0
* output application/json
*
* import mean from AnalyticsModule
* ---
* mean([]) default null
*
* ----
*
* ==== Output
*
* [source,Json,linenums]
* ----
* null
* ----
*
*/
fun mean(values: Array<Number>): Number | Null = 
  if (isEmpty(values))
    null
  else
    sum(values) / sizeOf(values)

/**
* Helper function that enables `mean` to work with a `null` value.
*/
fun mean(values: Null): Null = null


/** 
* Returns the number of occurrences of each
* distinct element in an array.
*
* === Parameters
*
* [%header, cols="1,1,3"]
* |===
* | Name | Type | Description
* | `values` | `Array<T&#62;` | The array of values to evaluate.
* |===
*
* === Example
*
* This example shows how `frequencies` behaves with an array of numbers.
*
* ==== Source
*
* [source,DataWeave,linenums]
* ----
* %dw 2.0
* output application/json
*
* import frequencies from AnalyticsModule
* ---
* frequencies([1, 2, 11, 1, 1, 2])
*
* ----
*
* ==== Output
*
* [source,Json,linenums]
* ----
* [
*   {value: 1, occurrences: 3},
*   {value: 2, occurrences: 2},
*   {value: 11, occurrences: 1}
* ]
* ----
*
*/
fun frequencies<T>(values: Array<T>): Array<{value: T, occurrences: Number}> = do {
  var uniques = values distinctBy ((item, index) -> item)
  ---
  uniques map ((item, index) -> {
    value: item,
    occurrences: sizeOf(values find item)
  })
}

/**
* Helper function that enables `frequencies` to work with a `null` value.
*/
fun frequencies(values: Null): Null = null

