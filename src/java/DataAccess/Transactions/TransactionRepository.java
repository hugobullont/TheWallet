/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess.Transactions;

import Entities.Transactions;
import Hibernate.TheWalletHibernateUtil;
import java.math.BigDecimal;
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
    public List<Transactions> GetTransactionsPerMonth(int monthValue, int userId) {
       Session session = TheWalletHibernateUtil.getSessionFactory().openSession();
       session.beginTransaction();
       List<Transactions> list = (List<Transactions>) session.createQuery("from Transactions as t where month(t.date) ="+monthValue + "and t.users.idUser ="+ userId).list();
       session.close();
       return list;
    }

    @Override
    public double GetBalancePerMonth(int monthValue, int userId) {
        double balance = 0;
        List<Transactions> list = GetTransactionsPerMonth(monthValue, userId);
        for(Transactions temp : list)
        {
            BigDecimal bdV = temp.getValue();
            double transV = Double.valueOf(bdV.toString());
            
            //Expenses
            if(temp.getTypes().getIdType()==1)
            {
                balance = balance + (transV * -1);
            }
            //Incomes
            if(temp.getTypes().getIdType()==2)
            {
                balance = balance + (transV);
            }
        }
        return balance;
    }

    @Override
    public double GetIncomes(int monthValue, int userId) {
        double balance = 0;
        List<Transactions> list = GetTransactionsPerMonth(monthValue, userId);
        for (Transactions temp:list)
        {
            BigDecimal bdV = temp.getValue();
            double transV = Double.valueOf(bdV.toString());
            if (temp.getTypes().getIdType()==2)
            {
                balance = balance + (transV);
            }
        }
        return balance;
    }

    @Override
    public double GetExpenses(int monthValue, int userId) {
        double balance = 0;
        List<Transactions> list = GetTransactionsPerMonth(monthValue, userId);
        for (Transactions temp:list)
        {
            BigDecimal bdV = temp.getValue();
            double transV = Double.valueOf(bdV.toString());
            if (temp.getTypes().getIdType()==1)
            {
                balance = balance + (transV);
            }
        }
        return balance;
    }
    
}
