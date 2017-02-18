import UIKit

class ViewController: UIViewController {
    
    let dataSource = DataSourceFactory().countryDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource.fetchAllCountries(success: { countries in
            print(countries)
        }) { e in
            print(e)
        }
        
        dataSource.fetchCountry(name: "Hungary", success: { country in
            print(country)
        }) { e in
            print(e)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

