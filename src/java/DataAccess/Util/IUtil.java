/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess.Util;

import java.util.List;

/**
 *
 * @author Hugo
 */
public interface IUtil {
    String getActualMonthName();
    int getActualMonth();
    List<Integer> getMonthsTrans(int userId);
    String getMonthName(int monthValue);
}
