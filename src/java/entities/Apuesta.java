/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

/**
 *
 * @author Alejandro
 */
public class Apuesta {
	private Short golesl;
	private Short golesv;
	private Long cuantas;

    public Apuesta() {
    }

    public Apuesta(Short golesl, Short golesv, Long cuantas) {
        this.golesl = golesl;
        this.golesv = golesv;
        this.cuantas = cuantas;
    }

    public Short getGolesl() {
        return golesl;
    }

    public void setGolesl(Short golesl) {
        this.golesl = golesl;
    }

    public Short getGolesv() {
        return golesv;
    }

    public void setGolesv(Short golesv) {
        this.golesv = golesv;
    }

    public Long getCuantas() {
        return cuantas;
    }

    public void setCuantas(Long cuantas) {
        this.cuantas = cuantas;
    }

    @Override
    public String toString() {
        return "Apuesta{" + "golesl=" + golesl + ", golesv=" + golesv + ", cuantas=" + cuantas + '}';
    }
        
}
