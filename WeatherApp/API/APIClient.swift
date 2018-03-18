enum Either<V,E : Error> {
    case value(V)
    case error(E)
}
enum APIError: Error {
    case apiError
    case badResponse
    case jsonDecoder
    case unknown(String)
    
}
