package com.model;

import java.sql.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import com.pojo.Attendance;
import com.pojo.Billing;
import com.pojo.Complaint;
import com.pojo.Customer;
import com.pojo.Employee;
import com.pojo.Manageincoming;
import com.pojo.Manageoutgoing;
import com.pojo.Manageproduct;
import com.pojo.Managesupplier;
import com.pojo.Productgroup;
import com.pojo.Quatation;
import com.pojo.Register;
import com.pojo.Salary;
import com.pojo.Stockdetails;

public class BLManager {
	SessionFactory sf = new Configuration().configure().buildSessionFactory();

	public boolean validemailpass(String email, String pass) {
		Register reg = searchByEmailIdp(email, pass);
		if (reg != null && reg.getEmail().equals(email) && reg.getPassword().equals(pass)) {
			return true;
		} else {
			return false;
		}

	}

	public Manageproduct searchByProductId(int productId) {
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Manageproduct.class);
		cr.add(Restrictions.eq("productId", productId));
		Manageproduct p=(Manageproduct) cr.uniqueResult();
		s.close();
		return p;
	}

	private Register searchByEmailIdp(String email, String pass) {
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Register.class);
		cr.add(Restrictions.eq("email", email));
		cr.add(Restrictions.eq("password", pass));
		Register r = (Register) cr.uniqueResult();
		return r;
	}
	public Manageincoming searchincoming(int intstock){
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Manageincoming.class);
		cr.add(Restrictions.eq("instock",intstock));
		Manageincoming ms=(Manageincoming) cr.uniqueResult();
		s.close();
		return ms;
	}
	public void deleteProduct(Manageproduct mp) {
		// TODO Auto-generated method stub
		Session s = sf.openSession();
		Transaction t=s.beginTransaction();
		s.delete(mp);
		t.commit();
		s.close();
	}
	public List<Manageincoming> searchInStock( int pid){
		Session s = sf.openSession();
		String hql="FROM Manageincoming m WHERE m.productgroup=?";
		Query q=s.createQuery(hql);
		q.setInteger(0, pid);
		List<Manageincoming> mi=q.list();
		
		return mi;
		
	}
	public List<Manageoutgoing> searchOutStock( int pid){
		Session s = sf.openSession();
		String hql="FROM Manageoutgoing m WHERE m.productgroup=?";
		Query q=s.createQuery(hql);
		q.setInteger(0, pid);
		List<Manageoutgoing> mi=q.list();
		
		return mi;
	}

	public Register serachbyemail(String email) {
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Register.class);
		cr.add(Restrictions.eq("email", email));
		Register r = (Register) cr.uniqueResult();
		return r;
	}
	public void updateManageProduct(Manageproduct mp) {
		// TODO Auto-generated method stub
		Session s = sf.openSession();
		Transaction t=s.beginTransaction();
		s.update(mp);
		t.commit();
		s.close();
	}
	public List<Managesupplier> searchSuplierList(){
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Managesupplier.class);
		List<Managesupplier> l=cr.list();
		s.close();
		return l;
	}
	public  List<Stockdetails> searchStockList(){
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Stockdetails.class);
		List<Stockdetails> l=cr.list();
		s.close();
		return l;
	}
	public List<Manageproduct> searchManageProductList(){
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Manageproduct.class);
		List<Manageproduct> l=cr.list();
		s.close();
		return l;
	}
	public Productgroup searchbyproductGroupName(String productGroupName) {
		// TODO Auto-generated method stub
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Productgroup.class);
		cr.add(Restrictions.eq("productGroupName", productGroupName));
		Productgroup p=(Productgroup) cr.uniqueResult();
		s.close();
		return p;
	}
	public void saveManageProduct(Manageproduct mp) {
		// TODO Auto-generated method stub
		Session s = sf.openSession();
		Transaction t=s.beginTransaction();
		s.save(mp);
		t.commit();
		s.close();
	}
	public Managesupplier searchbysuplierName(String suplierName) {
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Managesupplier.class);
		cr.add(Restrictions.eq("suplierName", suplierName));
		Managesupplier p=(Managesupplier) cr.uniqueResult();
		s.close();
		return p;
	}
	public void saveemployee(Employee emp) {
		Session s = sf.openSession();
		Transaction t = s.beginTransaction();
		s.save(emp);
		t.commit();
		s.close();
	}

	public List<Employee> serachemployeelist() {
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Employee.class);
		List<Employee> e = cr.list();
		return e;
	}

	public List<Customer> serachcustomerlist() {
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Customer.class);
		List<Customer> e = cr.list();
		return e;
	}

	public List<Salary> serachsalarylist() {
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Salary.class);
		List<Salary> e = cr.list();
		return e;
	}

	public Employee serachbyempid(int empid) {
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Employee.class);
		cr.add(Restrictions.eq("employeeId", empid));
		Employee r = (Employee) cr.uniqueResult();
		return r;
	}

	public void saveattendance(Attendance ad) {
		Session s = sf.openSession();
		Transaction t = s.beginTransaction();
		s.save(ad);
		t.commit();
		s.close();
	}

	public void savesalary(Salary s) {
		Session s1 = sf.openSession();
		Transaction t = s1.beginTransaction();
		s1.save(s);
		t.commit();
		s1.close();
	}

	public List<Salary> serachbymonthlist(String month) {
		Session s = sf.openSession();

		String hql = " From Salary s where s.month=? ";
		Query q = s.createQuery(hql);
		q.setString(0, month);

		List<Salary> l = q.list();
		return l;
	}

	public List<Customer> serachcustlist() {
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Customer.class);
		List<Customer> e = cr.list();
		return e;
	}

	public List<Complaint> serachcomplaintlist() {
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Complaint.class);
		List<Complaint> e = cr.list();
		return e;
	}

	public void savecustomer(Customer c) {
		Session s1 = sf.openSession();
		Transaction t = s1.beginTransaction();
		s1.save(c);
		t.commit();
		s1.close();
	}

	public List<Customer> serachbycustname(String cname) {
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Customer.class);
		cr.add(Restrictions.ilike("cname", cname, MatchMode.ANYWHERE));
		List<Customer> c = cr.list();
		return c;
	}

	public Customer serachbycname(String cname) {
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Customer.class);
		cr.add(Restrictions.eq("cname", cname));
		Customer r = (Customer) cr.uniqueResult();
		s.close();
		return r;
	}

	public Complaint serachbycomid(int id) {
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Complaint.class);
		cr.add(Restrictions.eq("comid", id));
		Complaint r = (Complaint) cr.uniqueResult();
		return r;
	}

	public Employee serachbyename(String ename) {
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Employee.class);
		cr.add(Restrictions.eq("fname", ename));
		Employee r = (Employee) cr.uniqueResult();
		return r;
	}

	public void savecomplaint(Complaint com) {
		Session s1 = sf.openSession();
		Transaction t = s1.beginTransaction();
		s1.save(com);
		t.commit();
		s1.close();
	}

	public void updatecomplaint(Complaint com) {
		Session s1 = sf.openSession();
		Transaction t = s1.beginTransaction();
		s1.update(com);
		t.commit();
		s1.close();
	}

	public List<Complaint> serachbyfdatetotdate(Date fdate, Date tdate) {
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Complaint.class);
		cr.add(Restrictions.between("statusdate", fdate, tdate));
		List<Complaint> list = cr.list();
		return list;
	}

	public void deletecomplaint(Complaint com) {
		Session s1 = sf.openSession();
		Transaction t = s1.beginTransaction();
		s1.delete(com);
		t.commit();
		s1.close();
	}

	public Employee serachbyempid(String email) {
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Employee.class);
		cr.add(Restrictions.eq("email", email));
		Employee r = (Employee) cr.uniqueResult();
		return r;
	}

	public List<Attendance> searchbyattendence(int eid) {
		Session s = sf.openSession();
		String hql = "From Attendance a where a.employee=?";

		Query q = s.createQuery(hql);
		q.setInteger(0, eid);
		List<Attendance> al = q.list();
		return al;
	}

	public List<Long> searchbynoOfleavs(int id) {
		Session s1 = sf.openSession();
		String hql = "select count(a.aid)From Attendance a where a.status='Absent' and  a.employee=?";
		Query q = s1.createQuery(hql);
		q.setInteger(0, id);

		List<Long> l = q.list();
		return l;
	}
	
	public List<Productgroup> searchProductGroupList() {
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Productgroup.class);
		List<Productgroup> p=cr.list();
		s.close();
		return p;
	}
	public List<Manageincoming> searchManageIncomingList(){
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Manageincoming.class);
		List<Manageincoming> l=cr.list();
		return l;
	}

	public Productgroup searchByProdGrpName(String pname) {
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Productgroup.class);
		cr.add(Restrictions.eq("productGroupName",pname));
		Productgroup p=(Productgroup) cr.uniqueResult();
		s.close();
		return p;
	}

	public void saveSupplierDetails(Managesupplier ms) {

		Session s = sf.openSession();
		Transaction t = s.beginTransaction();
		s.save(ms);
		t.commit();
		s.close();
		
	}
	public List<Managesupplier> supplierDetails()
	{
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Managesupplier.class);
		List<Managesupplier> ms=cr.list();
		s.close();
		return ms;
	}

	public List<Stockdetails> searchstockdetailsList()
	{
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Stockdetails.class);
		List<Stockdetails> ms=cr.list();
		s.close();
		return ms;
	}

	public Managesupplier ProductSearchBypId(int suplierId1) {
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Managesupplier.class);
		cr.add(Restrictions.eq("suplierId",suplierId1));
		Managesupplier ms=(Managesupplier) cr.uniqueResult();
		s.close();
		return ms;
	}

	public void updateSuplier(Managesupplier ms) {
		
		Session s = sf.openSession();
		Transaction t = s.beginTransaction();
		s.update(ms);
		t.commit();
		s.close();
	}

	

	public void deleteProduct(Managesupplier ms) {
		Session s1 = sf.openSession();
		Transaction t = s1.beginTransaction();
		s1.delete(ms);
		t.commit();
		s1.close();
		
		
	}

	public Managesupplier SupplierSearchBysupplierId(int suplierId) {
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Managesupplier.class);
		cr.add(Restrictions.eq("suplierId",suplierId));
		Managesupplier ms=(Managesupplier) cr.uniqueResult();
		s.close();
		return ms;
	}


	public List<Manageproduct> serachproductlist() {
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Manageproduct.class);
		List<Manageproduct> c = cr.list();
		return c;
	}


	public Manageproduct searchbypdoctname(String pname) {
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Manageproduct.class);
		cr.add(Restrictions.eq("productName",pname));
		Manageproduct t=(Manageproduct) cr.uniqueResult();
		return t;
	}

	public void savequatation(Quatation q) 
	{
		Session s1 = sf.openSession();
		Transaction t = s1.beginTransaction();
		s1.save(q);
		t.commit();
		s1.close();
	}

	public List<Quatation> serachquatationlist() {
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Quatation.class);
		List<Quatation> c = cr.list();		
		return c;
	}
	
	public List<Manageoutgoing> searchOutgoingList() {
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Manageoutgoing.class);
		List<Manageoutgoing> c = cr.list();		
		return c;
	}

	public Quatation searchbypdoctname1(String pname) 
	{
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Quatation.class,"mag");
		cr.createAlias("mag.manageproduct","m");
		cr.add(Restrictions.eq("m.productName",pname));
		Quatation t=(Quatation) cr.uniqueResult();
		return t;
	}
	public void updateProductGroup(Productgroup pg) {
		// TODO Auto-generated method stub
		Session s = sf.openSession();
		Transaction t=s.beginTransaction();
		s.update(pg);
		t.commit();
		s.close();
	}
	public Productgroup searchbyProductGroupId(int productGroupId) {
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Productgroup.class);
		cr.add(Restrictions.eq("productGroupId", productGroupId));
		Productgroup p=(Productgroup) cr.uniqueResult();
		s.close();
		return p;
	}
	public void deleteProductGroup(Productgroup pg) {
		// TODO Auto-generated method stub
		Session s = sf.openSession();
		Transaction t=s.beginTransaction();
		s.delete(pg);
		t.commit();
		s.close();
	}
	public void saveproductGroupName(Productgroup pg) {
		// TODO Auto-generated method stub
		Session s = sf.openSession();
		Transaction t=s.beginTransaction();
		s.save(pg);
		t.commit();
		s.close();
		
	}

	public Manageoutgoing searchoutcoming(int outstock) {
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Manageoutgoing.class);
		cr.add(Restrictions.eq("outstock",outstock));
		Manageoutgoing ms=(Manageoutgoing) cr.uniqueResult();
		s.close();
		return ms;
	}

	public void saveStockDetails(Stockdetails sd) {
		Session s = sf.openSession();
		Transaction t=s.beginTransaction();
		s.save(sd);
		t.commit();
		s.close();
	}

	public Billing searchbypdoctname12(String pname, String cname) {
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Billing.class,"mag");
		cr.createAlias("mag.manageproduct","m");
		cr.createAlias("mag.customer","m1");
		cr.add(Restrictions.eq("m.productName",pname));
		cr.add(Restrictions.eq("m1.cname",cname));
		Billing t=(Billing) cr.uniqueResult();
		return t;
	}

	public void savebillingnow(Billing bill) {
		Session s = sf.openSession();
		Transaction t=s.beginTransaction();
		s.save(bill);
		t.commit();
		s.close();
	}

	public void saveOutgoing(Manageoutgoing mo)
	{
		Session s = sf.openSession();
		Transaction t=s.beginTransaction();
		s.save(mo);
		t.commit();
		s.close();
	}

	public Manageoutgoing searchByouid(int moid) {
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Manageoutgoing.class);
		cr.add(Restrictions.eq("moid",moid));
		Manageoutgoing ms=(Manageoutgoing) cr.uniqueResult();
		s.close();
		return ms;
	}

	public void updateoutstock(Manageoutgoing mi) {
		Session s = sf.openSession();
		Transaction t=s.beginTransaction();
		s.update(mi);
		t.commit();
		s.close();
	}

	public Managesupplier searchbysupplierName(String suplierName)
	{
		Session s = sf.openSession();
		Criteria cr = s.createCriteria(Managesupplier.class);
		cr.add(Restrictions.eq("suplierName",suplierName));
		Managesupplier ms=(Managesupplier) cr.uniqueResult();
		return ms;
	}

	public void saveStockincoming(Manageincoming mi) {
		Session s = sf.openSession();
		Transaction t=s.beginTransaction();
		s.save(mi);
		t.commit();
		s.close();
	}

	public void Stockdetails1(Stockdetails sd) {
		Session s = sf.openSession();
		Transaction t=s.beginTransaction();
		s.save(sd);
		t.commit();
		s.close();
	}
}
