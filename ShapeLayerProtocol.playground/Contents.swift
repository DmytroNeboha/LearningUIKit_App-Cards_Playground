import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
        
//        // Круг
//        view.layer.addSublayer(CircleShape(size: CGSize(width: 200, height: 150), fillColor: UIColor.gray.cgColor))
//        // Квадрат
//        view.layer.addSublayer(SquareShape(size: CGSize(width: 200, height: 200), fillColor: UIColor.green.cgColor))
//        // Крест
//        view.layer.addSublayer(CrossShape(size: CGSize(width: 200, height: 150), fillColor: UIColor.black.cgColor))
//        // Закрашенный слой
//        view.layer.addSublayer(FillShape(size: CGSize(width: 200, height: 150), fillColor: UIColor.orange.cgColor))
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()


protocol ShapeLayerProtocol: CAShapeLayer {
    init(size: CGSize, fillColor: CGColor)
}

extension ShapeLayerProtocol {
    init() {
        fatalError("init() не может быть использован для создания экземпляра")
    }
}


// Создание круга
class CircleShape: CAShapeLayer, ShapeLayerProtocol {
    required init(size: CGSize, fillColor: CGColor) {
        super.init()
        
        // рассчитываем данные для круга, радиус равен половине меньшей из сторон
        let radius = ([size.width, size.height].min() ?? 0) / 2
        // центр круга равен центрам каждой из сторон
        let centerX = size.width / 2
        let centerY = size.height / 2
        
        // Рисуем круг
        let path = UIBezierPath(arcCenter: CGPoint(x: centerX, y: centerY), radius: radius, startAngle: 0, endAngle: .pi*2, clockwise: true)
        path.close()
        
        // инициализируем созданный путь
        self.path = path.cgPath
        // изменяем цвет
        self.fillColor = fillColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// Создание квадрата
class SquareShape: CAShapeLayer, ShapeLayerProtocol {
    required init(size: CGSize, fillColor: CGColor) {
        super.init()
        
        // сторона равна меньшей из сторон
        let edgeSize = ([size.width, size.height].min() ?? 0)
        
        // рисуем квадрат
        let rect = CGRect(x: 0, y: 0, width: edgeSize, height: edgeSize)
        let path = UIBezierPath(rect: rect)
        path.close()
        
        // инициализируем созданный путь
        self.path = path.cgPath
        // изменяем цвет
        self.fillColor = fillColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// Создание креста
class CrossShape: CAShapeLayer, ShapeLayerProtocol {
    required init(size: CGSize, fillColor: CGColor) {
        super.init()
        
        // рисуем крест
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: size.width, y: size.height))
        path.move(to: CGPoint(x: size.width, y: 0))
        path.addLine(to: CGPoint(x: 0, y: size.height))
        
        
        // инициализируем созданный путь
        self.path = path.cgPath
        // изменяем цвет
        self.strokeColor = fillColor
        self.lineWidth = 5
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



// Создание закрашенного слоя
class FillShape: CAShapeLayer, ShapeLayerProtocol {
    required init(size: CGSize, fillColor: CGColor) {
        super.init()
        let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        self.path = path.cgPath
        self.fillColor = fillColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}