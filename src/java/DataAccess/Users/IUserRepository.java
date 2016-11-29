/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess.Users;

import Entities.Users;

/**
 *
 * @author Hugo
 */
public interface IUserRepository {
    void AddUser(Users objUser);
    void UpdateUser(Users objUser);
    Users GetUserByUsername(String username);
}
