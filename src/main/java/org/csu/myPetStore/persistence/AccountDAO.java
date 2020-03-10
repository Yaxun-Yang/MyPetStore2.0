package org.csu.myPetStore.persistence;

import org.csu.myPetStore.domain.Account;

public interface AccountDAO {
    Account getAccountByUsername(String username);

    Account getAccountByUsernameAndPassword(String username, String password);

    void insertAccount(Account account);

    void insertProfile(Account account);

    void insertSignOn(Account account);

    void updateAccount(Account account);

    void updateProfile(Account account);

    void updateSignOn(Account account);
}
