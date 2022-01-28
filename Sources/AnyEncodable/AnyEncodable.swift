public struct AnyEncodable: Encodable {

  public let body: (Encoder) throws -> Void

  public init(_ body: @escaping (Encoder) throws -> Void) {
    self.body = body
  }

  public init<T: Encodable>(_ value: T) {
    self.body = value.encode
  }

  public init(_ value: Encodable) {
    self.body = value.encode
  }

  public func encode(to encoder: Encoder) throws {
    try body(encoder)
  }
}
