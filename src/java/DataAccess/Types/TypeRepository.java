/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess.Types;

import Entities.Types;
import Hibernate.TheWalletHibernateUtil;
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author Hugo
 */
public class TypeRepository implements ITypeRepository{

    @Override
    public List<Types> GetAllTypes() {
       Session session = TheWalletHibernateUtil.getSessionFactory().openSession();
       session.beginTransaction();
       List<Types> list = (List<Types>) session.createQuery("FROM Types").list();
       session.close();
       return list;
    }
    
}
