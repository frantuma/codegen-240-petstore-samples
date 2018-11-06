// Models.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation

protocol JSONEncodable {
    func encodeToJSON() -> Any
}

public enum ErrorResponse : Error {
    case HttpError(statusCode: Int, data: Data?, error: Error)
    case DecodeError(response: Data?, decodeError: DecodeError)
}

open class Response<T> {
    open let statusCode: Int
    open let header: [String: String]
    open let body: T?

    public init(statusCode: Int, header: [String: String], body: T?) {
        self.statusCode = statusCode
        self.header = header
        self.body = body
    }

    public convenience init(response: HTTPURLResponse, body: T?) {
        let rawHeader = response.allHeaderFields
        var header = [String:String]()
        for case let (key, value) as (String, String) in rawHeader {
            header[key] = value
        }
        self.init(statusCode: response.statusCode, header: header, body: body)
    }
}

public enum Decoded<ValueType> {
    case success(ValueType)
    case failure(DecodeError)
}

public extension Decoded {
    var value: ValueType? {
        switch self {
        case let .success(value):
            return value
        case .failure:
            return nil
        }
    }
}

public enum DecodeError {
    case typeMismatch(expected: String, actual: String)
    case missingKey(key: String)
    case parseError(message: String)
}

private var once = Int()
class Decoders {
    static fileprivate var decoders = Dictionary<String, ((AnyObject, AnyObject?) -> AnyObject)>()

    static func addDecoder<T>(clazz: T.Type, decoder: @escaping ((AnyObject, AnyObject?) -> Decoded<T>)) {
        let key = "\(T.self)"
        decoders[key] = { decoder($0, $1) as AnyObject }
    }

    static func decode<T>(clazz: T.Type, discriminator: String, source: AnyObject) -> Decoded<T> {
        let key = discriminator
        if let decoder = decoders[key], let value = decoder(source, nil) as? Decoded<T> {
            return value
        } else {
            return .failure(.typeMismatch(expected: String(describing: clazz), actual: String(describing: source)))
        }
    }

    static func decode<T>(clazz: [T].Type, source: AnyObject) -> Decoded<[T]> {
        if let sourceArray = source as? [AnyObject] {
            var values = [T]()
            for sourceValue in sourceArray {
                switch Decoders.decode(clazz: T.self, source: sourceValue, instance: nil) {
                case let .success(value):
                    values.append(value)
                case let .failure(error):
                    return .failure(error)
                }
            }
            return .success(values)
        } else {
            return .failure(.typeMismatch(expected: String(describing: clazz), actual: String(describing: source)))
        }
    }

    static func decode<T>(clazz: T.Type, source: AnyObject) -> Decoded<T> {
        switch Decoders.decode(clazz: T.self, source: source, instance: nil) {
    	    case let .success(value):
                return .success(value)
            case let .failure(error):
                return .failure(error)
        }
    }

    static open func decode<T: RawRepresentable>(clazz: T.Type, source: AnyObject) -> Decoded<T> {
        if let value = source as? T.RawValue {
            if let enumValue = T.init(rawValue: value) {
                return .success(enumValue)
            } else {
                return .failure(.typeMismatch(expected: "A value from the enumeration \(T.self)", actual: "\(value)"))
            }
        } else {
            return .failure(.typeMismatch(expected: "\(T.RawValue.self) matching a case from the enumeration \(T.self)", actual: String(describing: type(of: source))))
        }
    }

    static func decode<T, Key: Hashable>(clazz: [Key:T].Type, source: AnyObject) -> Decoded<[Key:T]> {
        if let sourceDictionary = source as? [Key: AnyObject] {
            var dictionary = [Key:T]()
            for (key, value) in sourceDictionary {
                switch Decoders.decode(clazz: T.self, source: value, instance: nil) {
                case let .success(value):
                    dictionary[key] = value
                case let .failure(error):
                    return .failure(error)
                }
            }
            return .success(dictionary)
        } else {
            return .failure(.typeMismatch(expected: String(describing: clazz), actual: String(describing: source)))
        }
    }

    static func decodeOptional<T: RawRepresentable>(clazz: T.Type, source: AnyObject?) -> Decoded<T?> {
        guard !(source is NSNull), source != nil else { return .success(nil) }
        if let value = source as? T.RawValue {
            if let enumValue = T.init(rawValue: value) {
                return .success(enumValue)
            } else {
                return .failure(.typeMismatch(expected: "A value from the enumeration \(T.self)", actual: "\(value)"))
            }
        } else {
            return .failure(.typeMismatch(expected: "\(T.RawValue.self) matching a case from the enumeration \(T.self)", actual: String(describing: type(of: source))))
        }
    }

    static func decode<T>(clazz: T.Type, source: AnyObject, instance: AnyObject?) -> Decoded<T> {
        initialize()
        if let sourceNumber = source as? NSNumber, let value = sourceNumber.int32Value as? T, T.self is Int32.Type {
            return .success(value)
        }
        if let sourceNumber = source as? NSNumber, let value = sourceNumber.int32Value as? T, T.self is Int64.Type {
     	    return .success(value)
        }
        if let intermediate = source as? String, let value = UUID(uuidString: intermediate) as? T, source is String, T.self is UUID.Type {
            return .success(value)
        }
        if let value = source as? T {
            return .success(value)
        }
        if let intermediate = source as? String, let value = Data(base64Encoded: intermediate) as? T {
            return .success(value)
        }

        let key = "\(T.self)"
        if let decoder = decoders[key], let value = decoder(source, instance) as? Decoded<T> {
           return value
        } else {
            return .failure(.typeMismatch(expected: String(describing: clazz), actual: String(describing: source)))
        }
    }

    //Convert a Decoded so that its value is optional. DO WE STILL NEED THIS?
    static func toOptional<T>(decoded: Decoded<T>) -> Decoded<T?> {
        return .success(decoded.value)
    }

    static func decodeOptional<T>(clazz: T.Type, source: AnyObject?) -> Decoded<T?> {
        if let source = source, !(source is NSNull) {
            switch Decoders.decode(clazz: clazz, source: source, instance: nil) {
            case let .success(value): return .success(value)
            case let .failure(error): return .failure(error)
            }
        } else {
            return .success(nil)
        }
    }

    static func decodeOptional<T>(clazz: [T].Type, source: AnyObject?) -> Decoded<[T]?> where T: RawRepresentable {
        if let source = source as? [AnyObject] {
            var values = [T]()
            for sourceValue in source {
                switch Decoders.decodeOptional(clazz: T.self, source: sourceValue) {
                case let .success(value): if let value = value { values.append(value) }
                case let .failure(error): return .failure(error)
                }
            }
            return .success(values)
        } else {
            return .success(nil)
        }
    }

    static func decodeOptional<T>(clazz: [T].Type, source: AnyObject?) -> Decoded<[T]?> {
        if let source = source as? [AnyObject] {
            var values = [T]()
            for sourceValue in source {
                switch Decoders.decode(clazz: T.self, source: sourceValue, instance: nil) {
                case let .success(value): values.append(value)
                case let .failure(error): return .failure(error)
                }
            }
            return .success(values)
        } else {
            return .success(nil)
        }
    }

    static func decodeOptional<T, Key: Hashable>(clazz: [Key:T].Type, source: AnyObject?) -> Decoded<[Key:T]?> {
        if let sourceDictionary = source as? [Key: AnyObject] {
            var dictionary = [Key:T]()
            for (key, value) in sourceDictionary {
                switch Decoders.decode(clazz: T.self, source: value, instance: nil) {
                case let .success(value): dictionary[key] = value
                case let .failure(error): return .failure(error)
                }
            }
            return .success(dictionary)
        } else {
            return .success(nil)
        }
    }

    static func decodeOptional<T: RawRepresentable, U: AnyObject>(clazz: T, source: AnyObject) -> Decoded<T?> where T.RawValue == U {
        if let value = source as? U {
            if let enumValue = T.init(rawValue: value) {
                return .success(enumValue)
            } else {
                return .failure(.typeMismatch(expected: "A value from the enumeration \(T.self)", actual: "\(value)"))
            }
        } else {
            return .failure(.typeMismatch(expected: "String", actual: String(describing: type(of: source))))
        }
    }


    private static var __once: () = {
        let formatters = [
            "yyyy-MM-dd",
            "yyyy-MM-dd'T'HH:mm:ssZZZZZ",
            "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ",
            "yyyy-MM-dd'T'HH:mm:ss'Z'",
            "yyyy-MM-dd'T'HH:mm:ss.SSS",
            "yyyy-MM-dd HH:mm:ss"
        ].map { (format: String) -> DateFormatter in
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.dateFormat = format
            return formatter
        }
        // Decoder for Date
        Decoders.addDecoder(clazz: Date.self) { (source: AnyObject, instance: AnyObject?) -> Decoded<Date> in
           if let sourceString = source as? String {
                for formatter in formatters {
                    if let date = formatter.date(from: sourceString) {
                        return .success(date)
                    }
                }
            }
            if let sourceInt = source as? Int {
                // treat as a java date
                return .success(Date(timeIntervalSince1970: Double(sourceInt / 1000) ))
            }
            if source is String || source is Int {
                return .failure(.parseError(message: "Could not decode date"))
            } else {
                return .failure(.typeMismatch(expected: "String or Int", actual: "\(source)"))
            }
        }

        // Decoder for ISOFullDate
        Decoders.addDecoder(clazz: ISOFullDate.self) { (source: AnyObject, instance: AnyObject?) -> Decoded<ISOFullDate> in
            if let string = source as? String,
               let isoDate = ISOFullDate.from(string: string) {
                return .success(isoDate)
            } else {
            	return .failure(.typeMismatch(expected: "ISO date", actual: "\(source)"))
            }
        }

        // Decoder for [ApiResponse]
        Decoders.addDecoder(clazz: [ApiResponse].self) { (source: AnyObject, instance: AnyObject?) -> Decoded<[ApiResponse]> in
            return Decoders.decode(clazz: [ApiResponse].self, source: source)
        }

        // Decoder for ApiResponse
        Decoders.addDecoder(clazz: ApiResponse.self) { (source: AnyObject, instance: AnyObject?) -> Decoded<ApiResponse> in
            if let sourceDictionary = source as? [AnyHashable: Any] {
                let _result = instance == nil ? ApiResponse() : instance as! ApiResponse
                switch Decoders.decodeOptional(clazz: Int32.self, source: sourceDictionary["code"] as AnyObject?) {
                
                case let .success(value): _result.code = value
                case let .failure(error): break
                
                }
                switch Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["type"] as AnyObject?) {
                
                case let .success(value): _result.type = value
                case let .failure(error): break
                
                }
                switch Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["message"] as AnyObject?) {
                
                case let .success(value): _result.message = value
                case let .failure(error): break
                
                }
                return .success(_result)
            } else {
                return .failure(.typeMismatch(expected: "ApiResponse", actual: "\(source)"))
            }
        }
        // Decoder for [Category]
        Decoders.addDecoder(clazz: [Category].self) { (source: AnyObject, instance: AnyObject?) -> Decoded<[Category]> in
            return Decoders.decode(clazz: [Category].self, source: source)
        }

        // Decoder for Category
        Decoders.addDecoder(clazz: Category.self) { (source: AnyObject, instance: AnyObject?) -> Decoded<Category> in
            if let sourceDictionary = source as? [AnyHashable: Any] {
                let _result = instance == nil ? Category() : instance as! Category
                switch Decoders.decodeOptional(clazz: Int64.self, source: sourceDictionary["id"] as AnyObject?) {
                
                case let .success(value): _result.id = value
                case let .failure(error): break
                
                }
                switch Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["name"] as AnyObject?) {
                
                case let .success(value): _result.name = value
                case let .failure(error): break
                
                }
                return .success(_result)
            } else {
                return .failure(.typeMismatch(expected: "Category", actual: "\(source)"))
            }
        }
        // Decoder for [Order]
        Decoders.addDecoder(clazz: [Order].self) { (source: AnyObject, instance: AnyObject?) -> Decoded<[Order]> in
            return Decoders.decode(clazz: [Order].self, source: source)
        }

        // Decoder for Order
        Decoders.addDecoder(clazz: Order.self) { (source: AnyObject, instance: AnyObject?) -> Decoded<Order> in
            if let sourceDictionary = source as? [AnyHashable: Any] {
                let _result = instance == nil ? Order() : instance as! Order
                switch Decoders.decodeOptional(clazz: Int64.self, source: sourceDictionary["id"] as AnyObject?) {
                
                case let .success(value): _result.id = value
                case let .failure(error): break
                
                }
                switch Decoders.decodeOptional(clazz: Int64.self, source: sourceDictionary["petId"] as AnyObject?) {
                
                case let .success(value): _result.petId = value
                case let .failure(error): break
                
                }
                switch Decoders.decodeOptional(clazz: Int32.self, source: sourceDictionary["quantity"] as AnyObject?) {
                
                case let .success(value): _result.quantity = value
                case let .failure(error): break
                
                }
                switch Decoders.decodeOptional(clazz: Date.self, source: sourceDictionary["shipDate"] as AnyObject?) {
                
                case let .success(value): _result.shipDate = value
                case let .failure(error): break
                
                }
                switch Decoders.decodeOptional(clazz: Order.Status.self, source: sourceDictionary["status"] as AnyObject?) {
                
                case let .success(value): _result.status = value
                case let .failure(error): break
                
                }
                switch Decoders.decodeOptional(clazz: Bool.self, source: sourceDictionary["complete"] as AnyObject?) {
                
                case let .success(value): _result.complete = value
                case let .failure(error): break
                
                }
                return .success(_result)
            } else {
                return .failure(.typeMismatch(expected: "Order", actual: "\(source)"))
            }
        }
        // Decoder for [Pet]
        Decoders.addDecoder(clazz: [Pet].self) { (source: AnyObject, instance: AnyObject?) -> Decoded<[Pet]> in
            return Decoders.decode(clazz: [Pet].self, source: source)
        }

        // Decoder for Pet
        Decoders.addDecoder(clazz: Pet.self) { (source: AnyObject, instance: AnyObject?) -> Decoded<Pet> in
            if let sourceDictionary = source as? [AnyHashable: Any] {
                let _result = instance == nil ? Pet() : instance as! Pet
                switch Decoders.decodeOptional(clazz: Int64.self, source: sourceDictionary["id"] as AnyObject?) {
                
                case let .success(value): _result.id = value
                case let .failure(error): break
                
                }
                switch Decoders.decodeOptional(clazz: Category.self, source: sourceDictionary["category"] as AnyObject?) {
                
                case let .success(value): _result.category = value
                case let .failure(error): break
                
                }
                switch Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["name"] as AnyObject?) {
                
                case let .success(value): _result.name = value
                case let .failure(error): break
                
                }
                switch Decoders.decodeOptional(clazz: [String].self, source: sourceDictionary["photoUrls"] as AnyObject?) {
                
                case let .success(value): _result.photoUrls = value
                case let .failure(error): break
                
                }
                switch Decoders.decodeOptional(clazz: [Tag].self, source: sourceDictionary["tags"] as AnyObject?) {
                
                case let .success(value): _result.tags = value
                case let .failure(error): break
                
                }
                switch Decoders.decodeOptional(clazz: Pet.Status.self, source: sourceDictionary["status"] as AnyObject?) {
                
                case let .success(value): _result.status = value
                case let .failure(error): break
                
                }
                return .success(_result)
            } else {
                return .failure(.typeMismatch(expected: "Pet", actual: "\(source)"))
            }
        }
        // Decoder for [Tag]
        Decoders.addDecoder(clazz: [Tag].self) { (source: AnyObject, instance: AnyObject?) -> Decoded<[Tag]> in
            return Decoders.decode(clazz: [Tag].self, source: source)
        }

        // Decoder for Tag
        Decoders.addDecoder(clazz: Tag.self) { (source: AnyObject, instance: AnyObject?) -> Decoded<Tag> in
            if let sourceDictionary = source as? [AnyHashable: Any] {
                let _result = instance == nil ? Tag() : instance as! Tag
                switch Decoders.decodeOptional(clazz: Int64.self, source: sourceDictionary["id"] as AnyObject?) {
                
                case let .success(value): _result.id = value
                case let .failure(error): break
                
                }
                switch Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["name"] as AnyObject?) {
                
                case let .success(value): _result.name = value
                case let .failure(error): break
                
                }
                return .success(_result)
            } else {
                return .failure(.typeMismatch(expected: "Tag", actual: "\(source)"))
            }
        }
        // Decoder for [User]
        Decoders.addDecoder(clazz: [User].self) { (source: AnyObject, instance: AnyObject?) -> Decoded<[User]> in
            return Decoders.decode(clazz: [User].self, source: source)
        }

        // Decoder for User
        Decoders.addDecoder(clazz: User.self) { (source: AnyObject, instance: AnyObject?) -> Decoded<User> in
            if let sourceDictionary = source as? [AnyHashable: Any] {
                let _result = instance == nil ? User() : instance as! User
                switch Decoders.decodeOptional(clazz: Int64.self, source: sourceDictionary["id"] as AnyObject?) {
                
                case let .success(value): _result.id = value
                case let .failure(error): break
                
                }
                switch Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["username"] as AnyObject?) {
                
                case let .success(value): _result.username = value
                case let .failure(error): break
                
                }
                switch Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["firstName"] as AnyObject?) {
                
                case let .success(value): _result.firstName = value
                case let .failure(error): break
                
                }
                switch Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["lastName"] as AnyObject?) {
                
                case let .success(value): _result.lastName = value
                case let .failure(error): break
                
                }
                switch Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["email"] as AnyObject?) {
                
                case let .success(value): _result.email = value
                case let .failure(error): break
                
                }
                switch Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["password"] as AnyObject?) {
                
                case let .success(value): _result.password = value
                case let .failure(error): break
                
                }
                switch Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["phone"] as AnyObject?) {
                
                case let .success(value): _result.phone = value
                case let .failure(error): break
                
                }
                switch Decoders.decodeOptional(clazz: Int32.self, source: sourceDictionary["userStatus"] as AnyObject?) {
                
                case let .success(value): _result.userStatus = value
                case let .failure(error): break
                
                }
                return .success(_result)
            } else {
                return .failure(.typeMismatch(expected: "User", actual: "\(source)"))
            }
        }
    }()

    static fileprivate func initialize() {
        _ = Decoders.__once
    }
}
