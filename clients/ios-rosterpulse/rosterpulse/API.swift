// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class TopProductsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query TopProducts {
      topProducts {
        __typename
        upc
      }
    }
    """

  public let operationName: String = "TopProducts"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("topProducts", type: .list(.object(TopProduct.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(topProducts: [TopProduct?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "topProducts": topProducts.flatMap { (value: [TopProduct?]) -> [ResultMap?] in value.map { (value: TopProduct?) -> ResultMap? in value.flatMap { (value: TopProduct) -> ResultMap in value.resultMap } } }])
    }

    public var topProducts: [TopProduct?]? {
      get {
        return (resultMap["topProducts"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [TopProduct?] in value.map { (value: ResultMap?) -> TopProduct? in value.flatMap { (value: ResultMap) -> TopProduct in TopProduct(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [TopProduct?]) -> [ResultMap?] in value.map { (value: TopProduct?) -> ResultMap? in value.flatMap { (value: TopProduct) -> ResultMap in value.resultMap } } }, forKey: "topProducts")
      }
    }

    public struct TopProduct: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Product"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("upc", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(upc: String) {
        self.init(unsafeResultMap: ["__typename": "Product", "upc": upc])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var upc: String {
        get {
          return resultMap["upc"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "upc")
        }
      }
    }
  }
}
