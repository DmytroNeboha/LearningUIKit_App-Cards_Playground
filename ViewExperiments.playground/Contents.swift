  
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
        
        set(view: greenView, toCenterOfView: redView)
        // позиционируем белое представление с помощю свойства center
        whiteView.center = greenView.center
        
        self.view.addSubview(redView)
        redView.addSubview(greenView)
        redView.addSubview(whiteView)
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
