#if os(Linux)
import Glibc
#else
import Darwin
#endif

public struct Environment {

    public init() { }

    public func getVar(_ name: String) -> String? {
        guard let out = getenv(name) else { return nil }
        return String(validatingUTF8: out)
    }

    public func removeVar(_ name: String) {
        unsetenv(name)
    }

    public func setVar(_ name: String, value: String, replace: Bool = true) {
        setenv(name, value, replace ? 1 : 0)
    }
    
    public subscript(key: String) -> String? {
        get {
            return getVar(key)
        }
        nonmutating set(newValue) {
            if let newVal = newValue {
                setVar(key, value: newVal, replace: true)
            } else {
                removeVar(key)
            }
        }
    }
}

public let Env = Environment()
