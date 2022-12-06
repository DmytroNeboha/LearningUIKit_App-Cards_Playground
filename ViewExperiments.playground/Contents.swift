  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
       setupViews()
    }
    
    // настройка представлений сцены
    private func setupViews() {
        self.view = getRootView()
        
        let redView = getRedView()
        let greenView = getGreenView()
        let whiteView = getWhiteView()
        let pinkView = getPinkView()
        
        set(view: greenView, toCenterOfView: redView)
        // позиционируем белое представление с помощю свойства center
        whiteView.center = greenView.center
        
        self.view.addSubview(redView)
        redView.addSubview(greenView)
        redView.addSubview(whiteView)
        self.view.addSubview(pinkView)

    }
    
    
    
    // создание представления розового цвета
    private func getPinkView() -> UIView {
        let viewFrame = CGRect(x: 50, y: 330, width: 100, height: 100)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .systemPink
        
        // Толщина границы
        view.layer.borderWidth = 5
        // Цвет границ
        view.layer.borderColor = UIColor.yellow.cgColor
        // Скругление углов
        view.layer.cornerRadius = 10
        // Видимость тени
        view.layer.shadowOpacity = 0.95
        // Радиус размытия тени
        view.layer.shadowRadius = 20
        // Смещение тени
        view.layer.shadowOffset = CGSize(width: 10, height: 20)
        // Цвет тени
        view.layer.shadowColor = UIColor.white.cgColor
        //  Прозрачность слоя
        view.layer.opacity = 0.7
        // Изменение фона
        view.layer.backgroundColor = UIColor.black.cgColor
        view.layer.backgroundColor = UIColor.systemPink.cgColor
        
        
        // создание дочернего слоя
        let layer = CALayer()
        // изменение фонового цвета
        layer.backgroundColor = UIColor.black.cgColor
        // изменение размеров и положения
        layer.frame = CGRect(x: 10, y: 10, width: 20, height: 20)
        // изменение радиуса скругления углов
        layer.cornerRadius = 10
        // добавление в иерархию слоев
        view.layer.addSublayer(layer)
        
        
        // вывод на консоль размеров представления
        print(view.frame)
        // поворот представления
//        view.transform = CGAffineTransform(rotationAngle: .pi/4)
        // вывод на консоль размеров представления
        print(view.frame)
        
        
        // Растяжение
//        view.transform = CGAffineTransform(scaleX: 1.5, y: 0.7)
        
        // Смещение
        view.transform = CGAffineTransform(translationX: 100, y: 5)
        
        // Множественное преобразования
        view.transform = CGAffineTransform(rotationAngle: .pi/3).scaledBy(x: 2, y: 0.8).translatedBy(x: 50, y: 50)
        
        // Свойтсво identity - применяют в анимации когда нужно отменить действия
        view.transform = CGAffineTransform.identity
        
        // Метод inverted()
        view.transform = CGAffineTransform(rotationAngle: .pi/4).inverted()
        
        
        return view
    }
    
    
    
    
    // создание представления белого цвета
    private func getWhiteView() -> UIView {
        let viewFrame = CGRect(x: 0, y: 0, width: 50, height: 50)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .white
        return view
    }
    
    // создание корневого представления
    private func getRootView() -> UIView {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }
    
    // создание красного представления
    private func getRedView() -> UIView {
        let viewFrame = CGRect(x: 50, y: 50, width: 250, height: 250)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .red
        view.clipsToBounds = true
        return view
    }
    
    private func getGreenView() -> UIView {
        let viewFrame = CGRect(x: 10, y: 10, width: 180, height: 180)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .green
        return view
    }
    
    
    
    
    private func set(view moveView: UIView, toCenterOfView baseView: UIView) {
        // размеры вложеного представления
        let moveViewWidth = moveView.frame.width
        let moveViewHeight = moveView.frame.height
        
        // размеры родительского представления
        let baseViewWidth = baseView.frame.width
        let baseViewHeight = baseView.frame.height
        
        // вычисление и изменение координат
        let newXCoordinate = (baseViewWidth - moveViewWidth) / 2
        let newYCoordinate = (baseViewHeight - moveViewHeight) / 2
        moveView.frame.origin = CGPoint(x: newXCoordinate, y: newYCoordinate)
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
