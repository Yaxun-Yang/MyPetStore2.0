package org.csu.myPetStore.service;

import org.csu.myPetStore.persistence.AccountDAO;
import org.csu.myPetStore.persistence.impl.AccountDAOimpl;
import org.csu.myPetStore.domain.Account;

public class AccountService {
    
    private AccountDAO accountDAO;
        
    public AccountService() {
            accountDAO = new AccountDAOimpl();
    }

    public Account getAccount(String username) {
        return accountDAO.getAccountByUsername(username);
    }

    public Account getAccount(String username, String password) {
        return accountDAO.getAccountByUsernameAndPassword(username, password);
    }
    
    public void insertAccount(Account account) {
        accountDAO.insertAccount(account);
        accountDAO.insertProfile(account);
        accountDAO.insertSignOn(account);
    }
    
    public void updateAccount(Account account) {
        accountDAO.updateAccount(account);
        accountDAO.updateProfile(account);

        if (account.getPassword() != null && account.getPassword().length() > 0) {
            accountDAO.updateSignOn(account);
        }
    }





}
