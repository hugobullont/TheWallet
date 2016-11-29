/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess.Categories;

import Entities.Categories;
import java.util.List;

/**
 *
 * @author Hugo
 */
public interface ICategoryRepository {
    List<Categories> GetAllCategories();
}
