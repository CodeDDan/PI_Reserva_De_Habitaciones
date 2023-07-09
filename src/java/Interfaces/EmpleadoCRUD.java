/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interfaces;

import Modelo.Empleado;
import java.util.List;

/**
 *
 * @author Daniel
 */
public interface EmpleadoCRUD {

    public boolean add(Empleado empleado);

    public boolean edit(Empleado empleado);

    public boolean delete(int emp_id);

    public List listar();

    public Empleado list(int emp_id);
}
