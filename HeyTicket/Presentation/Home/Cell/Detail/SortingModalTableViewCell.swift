//
//  FilteringModalTableViewCell.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/14.
//

import UIKit
import HeyTicketKit

class SortingModalTableViewCell: BaseTableViewCell{
    
    var title: String = ""{
        didSet{
            titleLabel.text = title
        }
    }
    
    var isCellSelected = false {
        didSet{
            isCellSelected ? setSelectAttribute() : setDeselectAttribute()
        }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let borderLine: UIView = {
        let borderLine = UIView()
        borderLine.backgroundColor = Color.grey200
        return borderLine
    }()
    
    private let checkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Image.check
        return imageView
    }()
    
    override func hierarchy() {
        baseView.addSubviews([titleLabel, borderLine, checkImageView])
    }
    
    override func layout() {
        titleLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalToSuperview().offset(12.5)
            $0.centerY.equalToSuperview()
        }
        borderLine.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
        checkImageView.snp.makeConstraints{
            $0.width.height.equalTo(24)
            $0.top.equalToSuperview().offset(10)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
        }
    }
    
    
    private func setSelectAttribute(){
        titleLabel.setTypo(Typo.font(type: .SemiBold, size: 16))
        titleLabel.textColor = Color.grey750
        checkImageView.isHidden = false
    }
    
    private func setDeselectAttribute(){
        titleLabel.setTypo(Typo.font(type: .Regular, size: 16))
        titleLabel.textColor = Color.grey500
        checkImageView.isHidden = true
    }
}
