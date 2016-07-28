#if os(Linux)
import Glibc
#else
import Darwin
#endif
import CEnvironment

public struct Environment {

    public init() { }
    
    /// Returns the value for `name` in the environment, nil if not present.
    public func getVar(_ name: String) -> String? {
        guard let out = getenv(name) else { return nil }
        return String(validatingUTF8: out)
    }

    /// Removes the value for `name` in the environment.
    public func removeVar(_ name: String) {
        unsetenv(name)
    }

    /// Sets `value` for `name` in the environment, `replace` controls whether potential
    /// existing value should be overwritten.
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
    
    /// Returns the dictionary of all environment variables, keyed by their name.
    /// Note that some values might be empty strings, as that is valid in the environment.
    public func all() -> [String: String] {
        var env = environ
        var pairs: [String: String] = [:]
        while let cpair = env?.pointee {
            defer { env = env?.successor() }

            let pairString = String(cString: cpair)
            let pair = pairString
                .characters
                .split(separator: "=", maxSplits: 2, omittingEmptySubsequences: false)
                .map(String.init)

            if pair.count == 2 {
                pairs[pair[0]] = pair[1]
            }
        }
        return pairs
    }
}

public let Env = Environment()
