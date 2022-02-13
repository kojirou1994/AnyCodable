import Foundation

public protocol DecodableImpl {
  associatedtype Decoded
  static func decode(from decoder: Decoder) throws -> Decoded
}

public struct AnyDecodable<Impl: DecodableImpl>: Decodable {

  public let value: Impl.Decoded

  public init(from decoder: Decoder) throws {
    value = try Impl.decode(from: decoder)
  }

}
