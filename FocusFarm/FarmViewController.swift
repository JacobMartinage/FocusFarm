// FarmViewController.swift

import UIKit

struct Animal : Codable {
    var name: String
    var image: String
    
    static func randomAnimal() -> Animal {
        print("rand animal got called")
        let animalNames = ["Chicken", "Cow", "Pig", "Duck"]
        let randomIndex = Int.random(in: 0..<animalNames.count)
        let randomName = animalNames[randomIndex]
        
        //name to image
        let imageName = randomName.lowercased() + "Image"
        
        return  Animal(name: randomName, image: imageName)
    }
}

class FarmViewController: UIViewController, UITableViewDataSource, TimerViewControllerDelegate {
    public var animals: [Animal] = []

    @IBOutlet weak var tableView: UITableView!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.rowHeight = 125
        let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath) as! AnimalCell

        // Check if the index path is within the range of the 'animals' array
        guard indexPath.row < animals.count else {
            print("Error: Index out of range for 'animals' array.")
            return cell
        }

        let animal = animals[indexPath.row]
        cell.AnimalName.text = animal.name

        // Check if the image name is not nil before creating the UIImage
        let imageName = animal.image
        // Debugging print statements
        print("Image Name:", imageName)
        if let image = UIImage(named: imageName) {
            print("UIImage:", image)
            cell.AnimalImage.image = image
        } else {
            print("Error: Unable to create UIImage from image name:", imageName)
        }

        return cell
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadAnimals()
        tableView.reloadData()
    }

    func timerDidCompleteWithNewAnimal(_ newAnimal: Animal) {
        print("transferred to farmview")
        animals.append(newAnimal)
        print(animals)
        //print(animals[0])
        let animal = animals[0]
        print(animal.name)
        print(animal.image)
        
        saveAnimals()
        tableView.reloadData()
        
    }
    
    // Load animals from UserDefaults
    private func loadAnimals() {
        if let data = UserDefaults.standard.data(forKey: "animals"),
            let decodedAnimals = try? JSONDecoder().decode([Animal].self, from: data) {
            animals = decodedAnimals
        }
    }

    // Save animals to UserDefaults
    private func saveAnimals() {
        if let encodedData = try? JSONEncoder().encode(animals) {
            UserDefaults.standard.set(encodedData, forKey: "animals")
        }
    }
}
