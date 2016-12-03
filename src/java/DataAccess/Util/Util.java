/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess.Util;

import java.util.Calendar;

/**
 *
 * @author Hugo
 */
public class Util implements IUtil {

    @Override
    public String getActualMonthName() {
      String name="";
        switch( Calendar.getInstance().get(Calendar.MONTH))
       {
           case 0: name= "Enero"; break;
           case 1: name= "Febrero"; break;
           case 2: name= "Marzo"; break;
           case 3: name= "Abril"; break;
           case 4: name= "Mayo"; break;
           case 5: name= "Junio"; break;
           case 6: name= "Julio"; break;
           case 7: name= "Agosto"; break;
           case 8: name= "Septiembre"; break;
           case 9: name= "Octubre"; break;
           case 10: name= "Noviembre"; break;
           case 11: name= "Diciembre"; break;
       }
        return name;
    }

    @Override
    public int getActualMonth() {
        int month=0;
        month=Calendar.getInstance().get(Calendar.MONTH) + 1;
        return month;
    }
    
}
