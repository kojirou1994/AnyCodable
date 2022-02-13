import Foundation
import AnyDecodable

extension JSONDecoder {
  public func decodeAny<T>(_ type: T.Type = T.self, from data: Data) throws -> T {
    try decode(AnyDecodable<AnyDecodableImpl<T>>.self, from: data).value
  }
}
