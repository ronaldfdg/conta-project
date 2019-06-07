package dao;

import bean.kardex;
import java.util.ArrayList;

public class dao {

    public static ArrayList<kardex> listaCta = new ArrayList<>();
    
    public void registrarCuenta(kardex k) {
        listaCta.add(k);
    }
    
    public void editarCuenta(int numero, String tipo)
    {
        kardex p = new kardex();
        switch(tipo){
            case "peps":
                p = listaCta.get(0);
                break;
            case "ueps":
                p = listaCta.get(listaCta.size()-1);
                break;
            case "pmp":
                double pp = 0;
                int c = 0;
                for(int i = 0; i < listaCta.size(); i++)
                {
                    if(listaCta.get(i).getEntrada() > 0)
                    {
                        pp+=listaCta.get(i).getPrecio();
                        System.out.println(pp);
                        c++;
                    }
                }
                pp = pp/c;
                p.setEntrada(0);
                p.setSalida(numero);
                p.setExistencia(listaCta.get(listaCta.size()-1).getExistencia());
                p.setPrecio(pp);
                break;
            default:
                System.out.println("nada");
        }
        
        listaCta.add(new kardex(0, numero, p.getPrecio(), /*p.getExistencia()*//*0*/((numero)*-1)));
        
    }
    
    public void limpiar (){
        listaCta.clear();
    }

}
