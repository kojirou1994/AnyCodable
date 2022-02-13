import XCTest
@testable import AnyDecodable

final class AnyDecodableTests: XCTestCase {
  func testSimple() throws {
    struct Model: Equatable {
      let value: Int
      enum CodingKeys: String, CodingKey {
        case value
      }
    }

    let modelValue = Model(value: 12345)

    let intValueJSON = try JSONSerialization.data(withJSONObject: [Model.CodingKeys.value.stringValue : modelValue.value])
    let stringValueJSON = try JSONSerialization.data(withJSONObject: [Model.CodingKeys.value.stringValue : modelValue.value.description])

    enum NormalImpl: DecodableImpl {
      static func decode(from decoder: Decoder) throws -> Model {
        try .init(value: decoder.container(keyedBy: Model.CodingKeys.self).decode(Int.self, forKey: .value))
      }
    }

    enum StringValueImpl: DecodableImpl {
      static func decode(from decoder: Decoder) throws -> Model {
        try .init(value: Int(decoder.container(keyedBy: Model.CodingKeys.self).decode(String.self, forKey: .value))!)
      }
    }

    let decoder = JSONDecoder()
    XCTAssertEqual(modelValue, try! decoder.decode(AnyDecodable<NormalImpl>.self, from: intValueJSON).value)
    XCTAssertEqual(modelValue, try! decoder.decode(AnyDecodable<StringValueImpl>.self, from: stringValueJSON).value)
  }
}
