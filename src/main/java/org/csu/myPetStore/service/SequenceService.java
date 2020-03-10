package org.csu.myPetStore.service;

import org.csu.myPetStore.persistence.SequenceDAO;
import org.csu.myPetStore.persistence.impl.SequenceDAOimpl;

public class SequenceService {
    SequenceDAO sequenceDAO;
   public SequenceService()
    {
        sequenceDAO = new SequenceDAOimpl();
    }
    public int getOderNum()
    {

        return sequenceDAO.getOrderNum();
    }

}
