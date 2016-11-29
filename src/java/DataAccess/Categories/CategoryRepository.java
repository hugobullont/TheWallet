/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess.Categories;

import Entities.Categories;
import Hibernate.TheWalletHibernateUtil;
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author Hugo
 */
public class CategoryRepository implements ICategoryRepository{

    @Override
    public List<Categories> GetAllCategories() {
       Session session = TheWalletHibernateUtil.getSessionFactory().openSession();
       session.beginTransaction();
       List<Categories> list = (List<Categories>) session.createQuery("FROM Categories").list();
       session.close();
       return list;
    }
    
}
