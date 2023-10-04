//
//  CatsGalleryViewController.swift
//  CatsGallery
//
//  Created by Jackson Matheus on 03/10/23.
//

import UIKit

class CatsGalleryViewController: UIViewController {
    
    static let padding: CGFloat = 16.0
    
    
    private var collectionView: UICollectionView?
    private var cancelLabels = Set<AnyCancellable>()
    var viewModel = CatsGalleryViewModel()

    
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Clique \n no botão \n para baixar \n nas imagens"
        label.textAlignment = .center
        label.textColor = .gray
        
        label.numberOfLines = 0
        
        return label
    }()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
    }
    
    
    private func setupLabel(){
        self.view.addSubview(label)
        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(equalToConstant: 500),
            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    
    private func setupNavigatorBar(){
        self.navigationItem.title = "Gallery"
        
        let buttonImage = UIImage(systemName: "arrow.clockwise.circle")
        let buttonItem = UIBarButtonItem(image: buttonImage, style: .plain, target: self, action: #selector(didTapRefreshButton))
        
        
        navigationItem.rightBarButtonItem = buttonItem
    }
    
    
    
    private func erase(){
        self.label.isHidden = true
        //        self.viewModel.erase()
        
        self.collectionView?.reloadData()
    }
    
    private func downloadImages(){
        
    }
}

extension CatsGalleryViewController {
    @objc private func didTapRefreshButton(){
        
    }
}


extension CatsGalleryViewController {
    private func setupCollectionView(){
        let layout = setupUICollectionViewFlowLayout()
        
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let  collectionView = collectionView else { return }
        
        
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.identifier)
        collectionView.dataSource  = self
        
        
        self.view.addSubview(collectionView)
    }
    
    private func setupUICollectionViewFlowLayout() -> UICollectionViewFlowLayout {
        
        let layout = UICollectionViewFlowLayout()
        
        let itemSize = self.view.frame.width * 0.18
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = Self.padding
        layout.minimumInteritemSpacing = Self.padding
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        
        return layout
        
    }
    
    
    private func setupCollectionViewConstraints(_ collectionView: UICollectionView){
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Self.padding),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Self.padding)
            
            
        ])
    }
}

extension CatsGalleryViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.viewModel.totalDisplay
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.collectionView?.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as? ImageCell else {
            print("Could not instantiate ImageCell.")
            return UICollectionViewCell()
        }
        
        
        if indexPath.row >= self.viewModel.imagesData.count {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "id", for: indexPath)
        }
        
        let imageData = viewModel.imagesData[indexPath.row]
        let catImage = UIImage(data: imageData)
        let placeholder = UIImage(named: "placeholder")
        
        cell.imageView.image = catImage ?? placeholder
        return cell
    }
    
}



