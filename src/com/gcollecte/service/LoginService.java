package com.gcollecte.service;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.gcollecte.hibernate.util.HibernateUtil;
import com.gcollecte.model.Compagne;
import com.gcollecte.model.Locateur;
import com.gcollecte.model.Permis;
import com.gcollecte.model.Projet;
import com.gcollecte.model.User;
import com.gcollecte.model.Puits;


public class LoginService {

	public boolean authenticateUser(String userId, String password) {
    	User user =getUserByUserId(userId);
    	List<User> users =getListOfUsers(); 
    	System.out.println(users.size());
        if(user!=null && user.getLogin().equals(userId) && user.getPassword().equals(password)){
            return true;
        }else{ 
            return false;
        }
    	
    }

    public User getUserByUserId(String userId) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        User user = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from User where login='"+userId+"'");
            user = (User)query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return user;
    }
    public User getUser(String userId) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        User user = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from User where id='"+userId+"'");
            user = (User)query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return user;
    }
    public List<User> getListOfUsers(){
        List<User> list = new ArrayList<User>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;        
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from User").list();                        
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
    public int getListOfUser(){
        List<User> list = new ArrayList<User>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;        
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from User").list();                        
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list.size();
    }
    public int getListOfPermiss(){
        List<Permis> list = new ArrayList<Permis>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;        
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from Permis").list();                        
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list.size();
    }
    public int getListOfPuits(){
        List<Puits> list = new ArrayList<Puits>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;        
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from Puits").list();                        
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list.size();
    }
    public int getListOfLocateurs(){
        List<Locateur> list = new ArrayList<Locateur>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;        
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from Locateur").list();                        
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list.size();
    }
    public int getListOfCompagnes(){
        List<Compagne> list = new ArrayList<Compagne>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;        
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from Compagne").list();                        
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list.size();
    }
    
    
    
    public boolean isUserExists(User projet){
	   	 Session session = HibernateUtil.openSession();
	   	 boolean result = false;
	   	 Transaction tx = null;
	   	 try{
	   		 tx = session.getTransaction();
	   		 tx.begin();
	   		 Query query = session.createQuery("from User where first_name='"+projet.getFirst_name()+"' AND last_name='"+projet.getLast_name()+"'");
	   		User projett = (User)query.uniqueResult();
	   		 tx.commit();
	   		 if(projett!=null) result = true;
	   	 }catch(Exception ex){
	   		 if(tx!=null){
	   			 tx.rollback();
	   		 }
	   	 }finally{
	   		 session.close();
	   	 }
	   	 return result;
	   }
    
    public boolean addprojett(User projet){
	   	 Session session = HibernateUtil.openSession();
	   	
	   	 Transaction tx = null;	
	   	 try {
	   		 tx = session.getTransaction();
	   		 tx.begin();
	   		 session.saveOrUpdate(projet);		
	   		 tx.commit();
	   	 } catch (Exception e) {
	   		 if (tx != null) {
	   			 tx.rollback();
	   		 }
	   		 e.printStackTrace();
	   	 } finally {
	   		 session.close();
	   	 }	
	   	 return true;
	   }
    
    public boolean addprojet(User projet){
	   	 Session session = HibernateUtil.openSession();
	 if(isUserExists(projet)) return false;	
	 else {
	   	 Transaction tx = null;	
	   	 try {
	   		 tx = session.getTransaction();
	   		 tx.begin();
	   		 session.saveOrUpdate(projet);		
	   		 tx.commit();
	   	 } catch (Exception e) {
	   		 if (tx != null) {
	   			 tx.rollback();
	   		 }
	   		 e.printStackTrace();
	   	 } finally {
	   		 session.close();
	   	 }	
	   	 return true;
	   }
    }
    public void delete(String userId){
        
        Session session = HibernateUtil.openSession();
        Transaction tx = null;        
        try {
        	String x = "DELETE FROM User stud WHERE stud.id=:id";
        	Query query = session.createQuery(x);
        	query.setParameter("id", Long.valueOf(userId));
        	int rowCount = query.executeUpdate();
        	if (rowCount == 0) {
        	System.out.println("No data found to delete");
        	} else {
        	System.out.println("Your record is deleted");
        	}

        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        
    }
}
