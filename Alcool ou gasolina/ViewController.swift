//
//  ViewController.swift
//  Alcool ou gasolina
//
//  Created by Rodrigo Abreu on 31/10/17.
//  Copyright © 2017 Rodrigo Abreu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var resultadoLegenda: UILabel!
    @IBOutlet var precoAlcoolCampo: UITextField!
    @IBOutlet var precoGasolinaCampo: UITextField!
    
    @IBAction func calcularCombustivel(_ sender: Any) {
        
        if let precoAlcool = precoAlcoolCampo.text{
            if let precoGasolina = precoGasolinaCampo.text{
                
                //Validar valores difitados
                let validaCampos = self.validarCampos(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                
                if validaCampos{
                    //calcular melhor combustivel
                    self.calcularMelhorPreco(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                    
                }else{
                    resultadoLegenda.text = " Digite os preços para calcular!"
                }
                
            }
        }
        
    
    }
    
    func calcularMelhorPreco(precoAlcool: String, precoGasolina: String){
        
        //Converter valores textos para numeros
        if let valorAlcool = Double(precoAlcool){
            if let valorGasolina = Double(precoGasolina){
                
                /* Faz cáculo (precoAlcool / precoGasolina)
                 * Se o resultado >= 0.7 melhor utilizar gasolina
                 * Senão melhor utilizar Álcool
                 * */
                
                let resultadoPreco = valorAlcool / valorGasolina
                
                if resultadoPreco >= 0.7 {
                    self.resultadoLegenda.text = "Melhor utilizar Gasolina!"
                }else{
                    self.resultadoLegenda.text = "Melhor utilizar Álcool!"
                }
                
                
            }
        }
    
        
    }
    
    func validarCampos(precoAlcool: String, precoGasolina: String) -> Bool{
        
        var camposValidados = true
        
        if precoAlcool.isEmpty{
            camposValidados = false
        }else if precoGasolina.isEmpty{
            camposValidados = false
        }
        
        return camposValidados
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

