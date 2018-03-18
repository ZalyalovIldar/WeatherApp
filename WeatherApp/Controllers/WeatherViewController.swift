import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBOutlet weak var weatherTextView: UITextView!
    
    let city = "Kazan"
    let state = "RU"
    var cellViewModels = [WeatherCellViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let weatherApi = WeatherAPIClient()
        let weatherEndPoint = WeatherEndPoint.forecast(city: city, state: state)
        weatherApi.weather(with: weatherEndPoint) { (either) in
            switch either {
            case .value(let forecastText):
                self.cellViewModels = forecastText.forecastDays.map {
                    WeatherCellViewModel(url: $0.iconUrl, description: $0.description, descriptionName: $0.descriptionName)
                }
                DispatchQueue.main.sync {
                    
                    self.prepareView()
                }
            case .error( let error):
                print(error)
            }
        }
    }
    
    func prepareView()  {
        let cellViewModel = cellViewModels[0]
        weatherTextView.text = cellViewModel.description
        cityNameLabel.text = city
    }
    
}
