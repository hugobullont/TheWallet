/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess.Transactions;

import Entities.Transactions;
import Hibernate.TheWalletHibernateUtil;
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author Usuario
 */
public class TransactionRepository implements ITransactionRepository {

    @Override
    public void AddTransaction(Transactions objTr) {
        Session session = TheWalletHibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(objTr);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public List<Transactions> GetTransactionsPerMonth(int monthValue) {
       Session session = TheWalletHibernateUtil.getSessionFactory().openSession();
       session.beginTransaction();
       List<Transactions> list = (List<Transactions>) session.createQuery("from Transactions as t where month(t.date) ="+monthValue).list();
       session.close();
       return list;
    }

    @Override
    public double GetBalancePerMonth(int monthValue) {
        double balance = 0;
        List<Transactions> list = GetTransactionsPerMonth(monthValue);
        for(Transactions temp : list)
        {
            double value=0;
            
        }
        return balance;
    }
    
}
