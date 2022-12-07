import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
        
        
        // создаём кривые на сцене
        createBezier(on: view)
    }
    
    
    
    // Создаём кривые на сцене
    private func createBezier(on view: UIView) {
        // 1. Создаём  графический контекст (слой). На нем в дальнейшем будут рисоваться кривые
        let shapeLayer = CAShapeLayer()
        // 2. Добавляем слой в качестве дочернего к черновому слою корневого представления
        view.layer.addSublayer(shapeLayer)
        // Изменение цвета линии
        shapeLayer.strokeColor = UIColor.gray.cgColor
        // Изменение толщины линии
        shapeLayer.lineWidth = 5
        
        // 3. Создание фигуры
        shapeLayer.path = getPath().cgPath
    }
    
    
    
    
    
    private func getPath() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 50, y: 50))
        
        path.addLine(to: CGPoint(x: 150, y: 50))
        path.addLine(to: CGPoint(x: 150, y: 150))
        return path
    }
    
    
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
