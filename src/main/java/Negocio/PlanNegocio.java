/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Negocio;

import DAO.PlanDAO;
import DTO.Plan;
import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author Jorge Orlando Vera
 */
public class PlanNegocio implements Serializable{
    
    //private final ProductoDAO productoDao;    
    //private ArrayList<Producto> productos;
    private final PlanDAO planDao;
    private ArrayList<Plan> planes;

    public PlanNegocio() {
        planes = new ArrayList<>();
        planDao = new PlanDAO();
    }
    
   
    /*
    public ArrayList<Plan> getListaProductos() {
        return productos;
    }
    */
    public ArrayList<Plan> getListaPlanes() {
        return planes;
    }
    /*
        public void setListaProductos(ArrayList<Producto> productos) {
        this.productos = productos;
    }
    */
    public void setListaPlanes(ArrayList<Plan> planes) {
        this.planes = planes;
    }


    public String guardarPlan(Plan plan){
        String msg="";
        try {
            Plan planBd = planDao.buscarPlan(plan);
            if(planBd!=null){
                msg="Error: plan repetido";
            } else {
                boolean rta = planDao.guardarPlan(plan);
                
                if (rta) 
                    msg="Plan registrado con éxito";
                else
                    msg="Error al guardar los datos en la BD";
            }
        } catch (Exception e) {
            msg="Error al guardar los datos en la BD";
        }
            
        
        return msg;
    }
    

    public ArrayList<Plan> buscarPlanes(){
        ArrayList<Plan> planBD = new ArrayList<>();
        try {
            planBD = planDao.buscarPlanes();
        } catch (Exception e) {
        }
        return planBD;
    }
    

    public Plan buscarPlan(Plan plan) throws Exception{
        
        Plan planBd = planDao.buscarPlan(plan);
        
        
        return planBd;
    }

    
    public String editarPlan(Plan plan) throws Exception{
        String msg="";
        
        boolean rta = planDao.editarPlan(plan);

        if (rta) 
            msg="Plan actualizado con éxito";
        else
            msg="Error al actualizar el plan en la BD";
            
        
        return msg;
    }
    
    public String eliminarPlan(Plan plan) throws Exception{
        
        boolean planBd = planDao.eliminarPlan(plan);
        String msg="";
        
        if(planBd!=false){
            msg="Dato eliminado con exito";
        }
        else 
            msg = "Error, no se pudo eliminar";
        
        return msg;
    }
}
