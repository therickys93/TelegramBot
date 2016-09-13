import Foundation
import Glibc

class URL: CustomStringConvertible {
    let host: String
    let port: UInt16 = 80
    let query: String
    
    init(string: String) {
        let explodedStrings = string.characters.split(separator: "/", maxSplits: 2, omittingEmptySubsequences: true).map(String.init)
        if string.hasPrefix("http://") {
            host = explodedStrings[1]
            query = explodedStrings.count > 2 ? "/" + explodedStrings[2] : ""
        } else if string.hasPrefix("https://") {
            host = explodedStrings[1]
            query = explodedStrings.count > 2 ? "/" + explodedStrings[2] : ""
        } else {
            host = explodedStrings[0]
            query = explodedStrings.count > 1 ? "/" + explodedStrings[1] : ""
        }
    }
    internal var description: String {
        return "host: \(host) Query: \(query) Port: \(port)"
    }
}

class MakeRequest {

	let bufferSize = 20480
	var sock: Int32

	init() {
		sock = socket(AF_INET, Int32(SOCK_STREAM.rawValue), 0)
	}

	func fetch(_ urlString: String) -> (responseCode: String, headers: [String : String], response: String) {
		let url = URL(string: urlString)
		let ipAddress = self.getIPFromHost(url.host)
		var remote = sockaddr_in()
		remote.sin_family = sa_family_t(AF_INET);
		inet_pton(AF_INET, ipAddress, &remote.sin_addr.s_addr)
		remote.sin_port = htons(url.port)
		connect(sock, sockaddr_cast(&remote) , socklen_t(MemoryLayout<sockaddr>.size))
		let getRequest = "GET \(url.query) HTTP/1.1\r\nHost: \(url.host)\r\nConnection: keep-alive\r\nUser-Agent:Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36\r\nUpgrade-Insecure-Requests:1\r\n\r\n";
		let _ = getRequest.withCString { (bytes) in
			send(sock, bytes, Int(strlen(bytes)), 0)
		}
		var buf = [CChar](repeating: 0, count:Int(bufferSize))
		recv(sock, &buf, bufferSize, 0)
        let response = String(validatingUTF8: buf)!
        let exploded = response.componentsSeparatedByString("\r\n\r\n")
        let headers = exploded[0].componentsSeparatedByString("\r\n")
        let responseCode = headers[0].componentsSeparatedByString(" ")[1]
        var headersDictionary = [String : String]()
        for header in (headers.dropFirst()) {
          let headerExploded = header.componentsSeparatedByString(": ")
          headersDictionary[headerExploded[0]] = headerExploded[1]
        }  
        return (responseCode, headersDictionary, exploded.count > 1 ? exploded[1] : "")
	}

	private func getIPFromHost(_ hostName: String) -> String {
		let host = gethostbyname(hostName) 
		var ipAddressString = [CChar](repeating: 0, count:Int(INET_ADDRSTRLEN))
		inet_ntop(AF_INET, host?.pointee.h_addr_list[0], &ipAddressString, socklen_t(INET_ADDRSTRLEN))
		return String(validatingUTF8: ipAddressString)!
	}

	private func sockaddr_cast(_ p: UnsafeMutableRawPointer) -> UnsafeMutablePointer<sockaddr> {
		return UnsafeMutablePointer<sockaddr>(p.bindMemory(to: sockaddr.self, capacity: 20480))
	}

	private func htons(_ value: UInt16) -> UInt16 {
		return (value << 8) + (value >> 8);
	}
}

public extension String {

    public func componentsSeparatedByString(_ separator:  String) -> [String] {
        var components: [String] = []
        var searchString = self
        while let range = searchString.range(of: separator) {
            let searchStringCharacters = searchString.characters
            let first = String(searchStringCharacters.prefix(upTo: range.lowerBound))            
            if !first.isEmpty { components.append(first) }
            if range.upperBound == searchString.endIndex {
                return components.isEmpty ? [self] : components
            }
            searchString = String(searchStringCharacters.suffix(from: range.upperBound))
        }
        if !searchString.isEmpty { components.append(searchString) }
        return components
    }

}
