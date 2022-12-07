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
        
        // Свойство lineCap
        shapeLayer.lineCap = .butt
        shapeLayer.lineCap = .square
        shapeLayer.lineCap = .round
        
        // Свойство lineDashPattern
//        shapeLayer.lineDashPattern = [3, 6]
        
        // определение фонового цвета
        shapeLayer.fillColor = UIColor.green.cgColor
        // Чтоб убрать цвет фигуры 2 варината:
//        shapeLayer.fillColor = nil // 1 вариант
//        shapeLayer.fillColor = UIColor.clear.cgColor
        
        
        // Свойство strokeStart и strokeEnd
//        shapeLayer.strokeStart = 0.6
//        shapeLayer.strokeEnd = 0.85
        
        // свойство lineJoin
        shapeLayer.lineJoin = .round
                
        
        // 3. Создание фигуры
        shapeLayer.path = getPath().cgPath
    }
    
    
    
    
    
    private func getPath() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 50, y: 50))
        path.addLine(to: CGPoint(x: 150, y: 50))
        path.addLine(to: CGPoint(x: 150, y: 150))
        // завершение фигуры (3-я линия)
        path.close()
        
        
        
        // Многосегментные пути
        // создание второго треугольника
        path.move(to: CGPoint(x: 50, y: 70))
        path.addLine(to: CGPoint(x: 150, y: 170))
        path.addLine(to: CGPoint(x: 50, y: 170))
        path.close()
        
        
        let path1 = UIBezierPath()
        path.move(to: CGPoint(x: 10, y: 210))
        path.addLine(to: CGPoint(x: 210, y: 210))
        path.addLine(to: CGPoint(x: 210, y: 310))
        path.addLine(to: CGPoint(x: 10, y: 310))
        path.close()
        
        // создание сущности "Прямоугольник"
        let rect = CGRect(x: 10, y: 310, width: 200, height: 100)
        
        // создание прямоугольника
        let path2 = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomRight, .topLeft], cornerRadii: CGSize(width: 30, height: 0))
        
        return path2
    }
    
    
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
