package org.csu.myPetStore.persistence;

public interface LogDAO {
    void insertNewLog(String username,String logType, String objectId);

}
