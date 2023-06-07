//
//  UITableView+extension.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/04.
//

import UIKit

extension UITableView{

    final func register<T: BaseTableViewCell>(cellType: T.Type) {
        register(cellType.self, forCellReuseIdentifier: cellType.cellIdentifier)
    }
    
    final func dequeueReusableCell<T: BaseTableViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: cellType.cellIdentifier, for: indexPath) as? T else {
          fatalError(
            "Failed to dequeue a cell with identifier \(cellType.cellIdentifier) matching type \(cellType.self). "
              + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
              + "and that you registered the cell beforehand"
          )
        }
        return cell
    }
    
    final func cellForRow<T: BaseTableViewCell>(at indexPath: IndexPath, cellType: T.Type) -> T? {
        guard let cell = cellForRow(at: indexPath) as? T else { return nil }
        return cell
    }
}
