private var storage: [ObjectIdentifier: (Decoder) throws -> Any] = .init()

public enum AnyDecodableImpl<Decoded>: DecodableImpl {

  public static func decode(from decoder: Decoder) throws -> Decoded {
    guard let method = storage[.init(Decoded.self)] else {
      fatalError("didn't set up!")
    }
    return try method(decoder) as! Decoded
  }

  public static func setup() where Decoded: Decodable {
    storage[.init(Decoded.self)] = Decoded.init(from:)
  }

  public static func setup(_ body: @escaping (Decoder) throws -> Decoded) {
    storage[.init(Decoded.self)] = body
  }

  public static func remove() {
    storage[.init(Decoded.self)] = nil
  }

  public static func removeAll() where Decoded == Void {
    storage = .init()
  }

}
