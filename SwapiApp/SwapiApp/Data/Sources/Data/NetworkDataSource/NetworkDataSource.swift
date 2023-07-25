import Foundation

let baseUrl = "https://swapi.dev/api"

protocol NetworkDataSourceProtocol {
	func getFilms() async throws -> GetFilmsResponse
}

public struct NetworkDataSource: NetworkDataSourceProtocol {

	enum NetworkError: Error {
		case invalidURL
		case requestFailed
		case invalidResponse
		case invalidData
	}

	let session: URLSession

	init(session: URLSession) {
		self.session = session
	}

	public init() {
		self.session = URLSession.shared
	}

	public func getFilms() async throws -> GetFilmsResponse {
		let suffixUrl = "/films"
		let urlString = baseUrl + suffixUrl

		guard let url = URL(string: urlString) else {
			throw NetworkError.invalidURL
		}

		let (data, response) = try await session.data(from: url)

		guard let httpResponse = response as? HTTPURLResponse else {
			throw NSError(domain: "Invalid response", code: 0, userInfo: nil)
		}

		guard (200...299).contains(httpResponse.statusCode) else {
			throw NSError(domain: "HTTP response error", code: httpResponse.statusCode, userInfo: nil)
		}

		do {
			let responseData = try JSONDecoder().decode(GetFilmsResponse.self, from: data)
			return responseData
		} catch {
			print(error)
			throw error
		}
	}
}
