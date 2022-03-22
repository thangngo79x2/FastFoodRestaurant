package com.webmvc.chiken.model.DAO;

import com.webmvc.chiken.model.entity.CustomerEntity;
import com.webmvc.chiken.model.entity.DiscountEntity;
import com.webmvc.chiken.util.HibernateUtil;

import javax.persistence.*;

public class DiscountDB {
    public static DiscountEntity getDiscountByCode(String code){

        EntityManagerFactory emf = HibernateUtil.getEMF();
        EntityManager em = emf.createEntityManager();
        TypedQuery<DiscountEntity> customer;
        DiscountEntity results = null;
        try {
            customer = em.createQuery("select d from DiscountEntity d where d.discountCode = ?1", DiscountEntity.class);
            customer.setParameter(1,code);


            results   =  customer.getSingleResult();

        } catch (Exception e) {
            System.out.println(e.getMessage());

        } finally {
            em.close();

        }
        return results;
    }
    public static void inset(DiscountEntity discount){
        EntityManagerFactory emf = HibernateUtil.getEMF();
        EntityManager em = emf.createEntityManager();
        EntityTransaction transaction = em.getTransaction();
        DiscountEntity results = null;
        try {
            transaction.begin();
            em.persist(discount);
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
}
