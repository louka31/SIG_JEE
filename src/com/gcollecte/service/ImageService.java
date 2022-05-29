package com.gcollecte.service;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.gcollecte.hibernate.util.HibernateUtil;
import com.gcollecte.model.Image;
import com.gcollecte.model.Permis;
import com.gcollecte.model.User;



public class ImageService {
    public Image getImagebyImageId(String ImageId) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        Image com = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from Image where Id='"+ImageId+"'");
            com = (Image)query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return com;
    }
    public Image getImage(String ImageId) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        Image compagne=null;
		try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from Image where Id='"+ImageId+"'");
            compagne = (Image)query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return compagne;
    }
    
    
    public boolean isUserExists(Image x){
	   	 Session session = HibernateUtil.openSession();
	   	 boolean result = false;
	   	 Transaction tx = null;
	   	 try{
	   		 tx = session.getTransaction();
	   		 tx.begin();
	   		 Query query = session.createQuery("from Image where enregistrement ='"+x.getEnregistrement()+"'");
	   		Image projett = (Image)query.uniqueResult();
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
    
    
    
    public boolean addiimage(Image user) {
        Session session = HibernateUtil.openSession();
	   	 if(isUserExists(user)) return false;	
	   	 else {
        Transaction tx = null;
       
        try {
            tx = session.getTransaction();
            tx.begin();
           session.saveOrUpdate(user);
           
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return true ;
        }
    }
    
    
    
    
    
	
    public List<Image> getListOfImage(){
        List<Image> list = new ArrayList<Image>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;        
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from Image").list();                        
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
    
    public int getListOfImages(){
        List<Image> list = new ArrayList<Image>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;        
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from Image").list();                        
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
    public void addimage(Image user) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
       
        try {
            tx = session.getTransaction();
            tx.begin();
           session.saveOrUpdate(user);
           
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
       
    }
    public void delete(String Id){
        
        Session session = HibernateUtil.openSession();
        Transaction tx = null;        
        try {
        	String x = "DELETE FROM Image stud WHERE stud.id=:id";
        	Query query = session.createQuery(x);
        	query.setParameter("id", Long.valueOf(Id));
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
