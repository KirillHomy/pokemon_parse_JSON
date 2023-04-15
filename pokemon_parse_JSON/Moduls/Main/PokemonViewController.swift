//
//  ViewController.swift
//  pokemon_parse_JSON
//
//  Created by Kirill Khomytsevych on 15.04.2023.
//

import UIKit

class PokemonViewController: UIViewController {

    // MARK: - Private variables
    private var model: PokemonList? = nil

    // MARK: - Private IBOutlet
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

}

// MARK: - private extension
private extension PokemonViewController {

    func setupUI() {
        setupTableView()
        retrievePokemons()
    }

    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    func retrievePokemons() {
        ApiManager.shared.retrievePokemons { responce in
            self.model = responce
            if let pokemons = responce.results, pokemons.count > 0 {
                for (index, name) in pokemons.enumerated() {
                    guard let name = name.name else { return }
                    print("\(index + 1)) Pokemon name - \(name.capitalized).")
                }
            }
        } fail: {
            print("Error")
        }
    }

}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension PokemonViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.model?.results?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = model?.results?[indexPath.row].name?.capitalized
        return cell ?? UITableViewCell()
    }

}
