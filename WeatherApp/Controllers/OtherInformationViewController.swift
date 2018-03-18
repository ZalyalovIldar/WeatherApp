import UIKit

class OtherInformationViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var cellViewModels = [WeatherCellViewModel]()
    let reuseIdentefier = "WeatherItem"

    override func viewDidLoad() {
        super.viewDidLoad()
        apiBegin()
    }
    func apiBegin() {
        let weatherApi = WeatherAPIClient()
        let weatherEndPoint = WeatherEndPoint.forecast(city: "Kazan", state: "RU")
        weatherApi.weather(with: weatherEndPoint) { (either) in
            switch either {
            case .value(let forecastText):
                self.cellViewModels = forecastText.forecastDays.map {
                    WeatherCellViewModel(url: $0.iconUrl, description: $0.description, descriptionName: $0.descriptionName)
                }
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .error( let error):
                print(error)
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: collectionView.contentSize.width, height: collectionView.contentSize.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count - 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellViewModel = cellViewModels[indexPath.row + 1]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentefier, for: indexPath) as? OtherInformationCollectionViewCell
        let description = cellViewModel.description
        let name = cellViewModel.descriptionName
        cell?.prepareCell(description: description, name: name)
        cellViewModel.loadImage { (image) in
            cell?.otherCellImageView.image = image
        }
        return cell!
    }
}
