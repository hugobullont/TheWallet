/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess.Users;

import Entities.Users;
import Hibernate.TheWalletHibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Hugo
 */
public class UserRepository implements IUserRepository{

    @Override
    public void AddUser(Users objUser) {
        Session session = TheWalletHibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(objUser);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public void UpdateUser(Users objUser) {
        Session session = TheWalletHibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.update(objUser);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public Users GetUserByUsername(String username) {
       Session session = TheWalletHibernateUtil.getSessionFactory().openSession();
       session.beginTransaction();
       Criteria criteria = session.createCriteria(Users.class);
       Users user = (Users) criteria.add(Restrictions.eq("username",username)).uniqueResult();
       session.close();
       return user;
    }
    
}
