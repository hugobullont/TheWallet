/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess.Types;

import Entities.Types;
import java.util.List;

/**
 *
 * @author Hugo
 */
public interface ITypeRepository {
    List<Types> GetAllTypes();
    
}
