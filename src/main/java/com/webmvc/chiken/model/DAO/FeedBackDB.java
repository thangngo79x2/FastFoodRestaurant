package com.webmvc.chiken.model.DAO;

import com.webmvc.chiken.model.entity.CategoriesEntity;
import com.webmvc.chiken.model.entity.CustomerEntity;
import com.webmvc.chiken.model.entity.FeedbackEntity;
import com.webmvc.chiken.util.HibernateUtil;

import javax.persistence.*;
import java.util.ArrayList;

public class FeedBackDB {
    public static void inset(FeedbackEntity feedback){
        EntityManagerFactory emf = HibernateUtil.getEMF();
        EntityManager em = emf.createEntityManager();
        EntityTransaction transaction = em.getTransaction();
        CustomerEntity results = null;
        try {
            transaction.begin();
            em.persist(feedback);
            transaction.commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            if (transaction.isActive()){
                transaction.rollback();
            }
            em.close();

        }

    }
    public static ArrayList<FeedbackEntity> getListFeedback(){

        EntityManagerFactory emf = HibernateUtil.getEMF();
        EntityManager em = emf.createEntityManager();
        TypedQuery<FeedbackEntity> feedback;
        ArrayList<FeedbackEntity> results = null;
        try {
            feedback = em.createQuery("select c from FeedbackEntity c ", FeedbackEntity.class);

            results   = (ArrayList<FeedbackEntity>) feedback.getResultList();

        } catch (Exception e) {
            System.out.println(e.getMessage());

        } finally {
            em.close();

        }
        return results;
    }
}
