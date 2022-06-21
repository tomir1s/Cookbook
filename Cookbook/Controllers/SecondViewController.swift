//
//  SecondViewController.swift
//  Cookbook
//
//  Created by Jafar Asimov on 6/19/22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryAndTimeStack: UIStackView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ingredientsStack: UIStackView!
    @IBOutlet weak var cookingDescriptionLabel: UILabel!
    
    @IBOutlet weak var favoriteButon: UIBarButtonItem!
    
    var dessert: Dessert!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateFavoriteButtonImage()
        
        title = dessert.name
        imageView.image = UIImage(named: dessert.image)
        titleLabel.text = dessert.name
        
        //
        let categoryLabel = UILabel()
        categoryLabel.textColor = .gray
        categoryLabel.text = dessert.category
        
        let timeLabel = UILabel()
        timeLabel.textColor = .gray
        timeLabel.text = "Время приготовления: \(dessert.time)"
        
        categoryAndTimeStack.addArrangedSubview(categoryLabel)
        categoryAndTimeStack.addArrangedSubview(timeLabel)
        
        //
        descriptionLabel.text = dessert.description
        
        // ingredients
        for ingredient in dessert.ingredients {
            let label = UILabel()
            label.text = ingredient
            ingredientsStack.addArrangedSubview(label)
        }
        
        //
        cookingDescriptionLabel.text = dessert.cookingDescription
    }
    
    private func updateFavoriteButtonImage() {
        if dessert.isFavorite {
            favoriteButon.image = UIImage(systemName: "star.fill")
        } else {
            favoriteButon.image = UIImage(systemName: "star")
        }
        
    }

    @IBAction func didTapFavoriteButton(_ sender: Any) {
        dessert.isFavorite.toggle()
        updateFavoriteButtonImage()
        let favoritesVC = FavoritesViewController()
        // Update isFavorite for dessert by ID in desserts
        // найти индекс дессерта по айди дессерта
        if let index = desserts.firstIndex(where: { $0.id == dessert.id}) {
            desserts[index].isFavorite = dessert.isFavorite
        }
        
        print(favorites)
        if dessert.isFavorite {
            // Add to favorites Array
            favorites.append(dessert)

        } else {
            if favorites.contains(where: { $0.id == dessert.id }) {
                if let index = favorites.firstIndex(where: { $0.id == dessert.id}) {
                    favorites.remove(at: index)
                }
            }
        }
        print(favorites)
        
        NotificationCenter.default.post(name: .updateFavorites, object: nil)
        
    }
    
    
}
