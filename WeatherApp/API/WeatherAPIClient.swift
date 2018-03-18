import Foundation

class WeatherAPIClient: APIClient {
    var session: URLSession
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    func weather(with endpoint: WeatherEndPoint, complition: @escaping (Either<ForecastText, APIError>) -> Void) {
        let request = endpoint.request
        self.fetch(with: request) { (either: Either<Weather, APIError>) in
            switch either   {
            case .value(let weather):
                let textForecast = weather.forecast.forecastText
                complition(.value(textForecast))
            case .error(let error):
                complition(.error(error))
            }
        }
    }
}
