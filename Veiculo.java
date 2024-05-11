/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.dry.entendaobjetosoo;

import javax.swing.JOptionPane;

/**
 *
 * @author Home
 */
public class Veiculo {
    public int veiAno;
    public String veiNome;

    public void exibirAtributos() {
        JOptionPane.showMessageDialog(null, "Ano do Veículo: " + veiAno + "\n" + " Nome do Veículo: " + veiNome);
    }

    public void veiculoAcelerar() {
        JOptionPane.showMessageDialog(null, "Acelerando o veículo!!");
    }

    public void veiculoFrear() {
        JOptionPane.showMessageDialog(null, "Freando o véiculo!!");
    }
}
