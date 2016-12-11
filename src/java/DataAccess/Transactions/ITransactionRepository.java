/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess.Transactions;

import Entities.Transactions;
import java.util.List;

/**
 *
 * @author Usuario
 */
public interface ITransactionRepository {
    void AddTransaction(Transactions objTr);
    List<Transactions> GetTransactionsPerMonth(int monthValue, int userId);
    double GetBalancePerMonth(int monthValue, int userId);
    double GetIncomes(int monthValue, int userId);
    double GetExpenses(int monthValue, int userId);
    List<Transactions> GetAllTransactionsPerUser(int userId);
}
