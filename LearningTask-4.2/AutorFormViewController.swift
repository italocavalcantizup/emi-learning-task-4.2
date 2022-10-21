//
//  ViewController.swift
//  LearningTask-4.2
//
//  Created by rafael.rollo on 17/02/2022.
//

import UIKit

class AutorFormViewController: UIViewController {
    
    typealias MensagemValidacao = String
    
    @IBOutlet weak var fotoTextField: UITextField!
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var bioTextField: UITextField!
    @IBOutlet weak var tecnologiasTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func salvarBotaoPressionado(_ sender: UIButton) {
        
        switch formularioValido() {
        case (false, let mensagemValidacao):
            exibeMensagemErro(para: mensagemValidacao)
        default:
            cadastrarAutor()
        }
        
    }
    
    func formularioValido() -> (Bool, MensagemValidacao?) {
        
        if let foto = fotoTextField.text, foto.isEmpty {
            return (false, "Informe a URL da foto do autor.")
        }
        if let nome = nomeTextField.text, nome.isEmpty {
            return (false, "Nome não pode estar em branco.")
        }
        if let bio = bioTextField.text, bio.isEmpty {
            return (false, "A bio do autor não pode estar em branco.")
        }
        if let tecnologias = tecnologiasTextField.text, tecnologias.isEmpty {
            return (false, "Informe as tecnologias sobre as quais o autor escreve.")
        }
        
        return (true, nil)
    }
    
    func exibeMensagemErro(para mensagemValidacao: MensagemValidacao?) {
        let mensagem = mensagemValidacao ?? "Verifique os dados e tente novamente."
        
        let alerta = UIAlertController(title: "Erro", message: mensagem, preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "Ok", style: .cancel))
        self.present(alerta, animated: true)
    }
    
    func cadastrarAutor() {
        let alerta = UIAlertController(title: "Feito", message: "Autor cadastrado com sucesso", preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "Ok", style: .cancel))
        self.present(alerta, animated: true)
    }
    
}
