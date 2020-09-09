//
//  OnBoardingViewController.swift
//  aobaApp-iOS
//
//  Created by José Guilherme Bestel on 21/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class OnBoardingViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var buttonNegocio: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var slides:[Slide] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        slides = createSlides()
        setupSlideScrollView(slides: slides)
                   
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
    }
    
    func createSlides() -> [Slide] {
        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.imageBoardingView.image = UIImage(named: "onboarding1")
        slide1.descriptionTextView.text = "Aoba é a rede que conecta o agricultor ao mercado, do campo para a cidade. E se você quiser nós também cuidamos da coleta e da entrega."
        
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.imageBoardingView.image = UIImage(named: "onboarding2")
        slide2.descriptionTextView.text = "Se você é agricultor, pode anunciar e vender seus produtos em nosso mercado online, assim compradores de todo o Brasil podem te encontrar"
        
        let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide3.imageBoardingView.image = UIImage(named: "onboarding3")
        slide3.descriptionTextView.text = "Se você busca alimentos de qualidade e praticidade para o seu negócio, encontre os melhores produtos e fornecedores de confiança em nossa plataforma, feche a compra e agende sua entrega."
        
        let slide4:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide4.imageBoardingView.image = UIImage(named: "onboarding4")
        slide4.descriptionTextView.text = "Nós buscamos o alimento com o produtor no CEASA e levamos até o comerciante final. E ambos ainda podem acompanhar todo o trajeto da carga!"
        
        return [slide1, slide2, slide3, slide4]
    }
    
    func setupSlideScrollView(slides : [Slide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        scrollView.alwaysBounceHorizontal = true

        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        
        if(Int(pageIndex) == 3){
            UIView.animate(withDuration: 1.0, animations: {
                self.pageControl.alpha = 0.0
                self.pageControl.isHidden = true
                self.buttonNegocio.alpha = 1.0
                self.buttonNegocio.isHidden = false
            })
        }else{
            UIView.animate(withDuration: 1.0, animations: {
               self.pageControl.alpha = 1.0
               self.pageControl.isHidden = false
               self.buttonNegocio.alpha = 0.0
               self.buttonNegocio.isHidden = true
           })
        }

        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
         /*
          *
          */
        setupSlideScrollView(slides: slides)
    }

}

extension UIScrollView {

    func scrollTo(horizontalPage: Int? = 0, verticalPage: Int? = 0, animated: Bool? = true) {
        var frame: CGRect = self.frame
        frame.origin.x = frame.size.width * CGFloat(horizontalPage ?? 0)
        frame.origin.y = frame.size.width * CGFloat(verticalPage ?? 0)
        self.scrollRectToVisible(frame, animated: animated ?? true)
    }

}
