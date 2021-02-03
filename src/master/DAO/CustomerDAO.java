package master.DAO;

import java.sql.*;

import master.DTO.CustomerBillDTO;
import master.DTO.CustomerMainDTO;
import master.DTO.CustomerRiceDTO;
import master.utilities.ConnectionFactory;

public class CustomerDAO {

	Statement st = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String insert_custMain = "insert into cust_main values(?,?,?,?,?,?)";
	String insert_custRice = "insert into cust_rice values(?,?,?,?,?,?,?,?)";
	String insert_custBill = "insert into cust_bill values(?,?,?,?,?)";

	String upd_stockRice = "update stock_rice set nofbag=? where rice_id=? and bag=?";
	String select_stockRice = "select nofbag from stock_rice where rice_id=? and bag=?";

	String upd_custMain = "update cust_main set total_bill=?,total_pay=?,total_due=? where cid=?";
	String select_cust = "select total_bill,total_pay,total_due from cust_main where cid=?";

	String select_CustCid = "select cid from cust_main";

	ConnectionFactory obj = new ConnectionFactory();
	Connection cn = obj.getCon();

	public void InsertCustMain(CustomerMainDTO cmdto) {

		try {
			ps = cn.prepareStatement(insert_custMain);
			ps.setString(1, cmdto.getCid());
			ps.setString(2, cmdto.getCname());
			ps.setString(3, cmdto.getPhno());
			ps.setString(4, cmdto.getTotal_bill());
			ps.setString(5, cmdto.getTotal_pay());
			ps.setString(6, cmdto.getTotal_due());

			ps.executeUpdate();
			cn.commit();

		} catch (SQLException se) {
			se.printStackTrace();
		}

	}

	public void InsertCustRice(CustomerRiceDTO crdto) {

		try {
			ps = cn.prepareStatement(insert_custRice);
			ps.setString(1, crdto.getCdate());
			ps.setString(2, crdto.getCid());
			ps.setString(3, crdto.getRice_id());
			ps.setString(4, crdto.getBag());
			ps.setString(5, crdto.getNofbag());
			ps.setString(6, crdto.getTotal_weight());
			ps.setString(7, crdto.getRate_quin());
			ps.setString(8, crdto.getPrice());
			ps.executeUpdate();

			int nnofbag = Integer.parseInt(crdto.getNofbag());

			ps = cn.prepareStatement(select_stockRice);
			ps.setString(1, crdto.getRice_id());
			ps.setString(2, crdto.getBag());
			rs = ps.executeQuery();
			if (rs.next()) {

				int prevNofbag = Integer.parseInt(rs.getString(1));
				int number = prevNofbag - nnofbag;
				String snum = String.valueOf(number);

				ps = cn.prepareStatement(upd_stockRice);
				ps.setString(1, snum);
				ps.setString(2, crdto.getRice_id());
				ps.setString(3, crdto.getBag());
				ps.executeUpdate();
			}
			cn.commit();
		} catch (SQLException se) {
			se.printStackTrace();
		}

	}

	public void InsertCustBill(CustomerBillDTO cbdto) {

		try {
			ps = cn.prepareStatement(insert_custBill);
			ps.setString(1, cbdto.getCdate());
			ps.setString(2, cbdto.getCid());
			ps.setString(3, cbdto.getTotal_bill());
			ps.setString(4, cbdto.getPayment());
			ps.setString(5, cbdto.getDue());
			ps.executeUpdate();

			String bill = cbdto.getTotal_bill();
			String pay = cbdto.getPayment();
			String due=cbdto.getDue();
			float billc, payc,duec;
			billc = Float.parseFloat(bill);
			payc = Float.parseFloat(pay);
			duec=Float.parseFloat(due);

			ps = cn.prepareStatement(select_cust);
			ps.setString(1, cbdto.getCid());
			rs = ps.executeQuery();
			if (rs.next()) {
				String PrevBill = rs.getString(1);
				String PrevPay = rs.getString(2);
				String PrevDue=rs.getString(3);
				
				float PrevBillc, PrevPayc,PrevDuec;
				PrevBillc = Float.parseFloat(PrevBill);
				PrevPayc = Float.parseFloat(PrevPay);
				PrevDuec=Float.parseFloat(PrevDue);

				float fbill, fpay, fdue;
				fbill = PrevBillc + billc;
				fpay = PrevPayc + payc;
				fdue = PrevDuec+duec;

				String fnBill, fnPay, fnDue;
				fnBill = String.valueOf(fbill);
				fnPay = String.valueOf(fpay);
				fnDue = String.valueOf(fdue);

				ps = cn.prepareStatement(upd_custMain);
				ps.setString(1, fnBill);
				ps.setString(2, fnPay);
				ps.setString(3, fnDue);
				ps.setString(4, cbdto.getCid());
			}
			ps.executeUpdate();
			cn.commit();

		} catch (SQLException se) {
			se.printStackTrace();
		}

	}

	public void ExPaymentCust(CustomerBillDTO cbdto) {

		try {
			ps = cn.prepareStatement(insert_custBill);
			ps.setString(1, cbdto.getCdate());
			ps.setString(2, cbdto.getCid());
			ps.setString(3, cbdto.getTotal_bill());
			ps.setString(4, cbdto.getPayment());
			ps.setString(5, cbdto.getDue());
			ps.executeUpdate();

			String bill = cbdto.getTotal_bill();
			String pay = cbdto.getPayment();
			float billc, payc;
			billc = Float.parseFloat(bill);
			payc = Float.parseFloat(pay);

			ps = cn.prepareStatement(select_cust);
			ps.setString(1, cbdto.getCid());
			rs = ps.executeQuery();
			if (rs.next()) {
				String PrevBill = rs.getString(1);
				String PrevPay = rs.getString(2);
				String PrevDue=rs.getString(3);
				
				float PrevBillc, PrevPayc,PrevDuec;
				PrevBillc = Float.parseFloat(PrevBill);
				PrevPayc = Float.parseFloat(PrevPay);
				PrevDuec=Float.parseFloat(PrevDue);

				float fbill, fpay, fdue;
				fbill = PrevBillc + billc;
				fpay = PrevPayc + payc;
				fdue = PrevDuec - payc;

				String fnBill, fnPay, fnDue;
				fnBill = String.valueOf(fbill);
				fnPay = String.valueOf(fpay);
				fnDue = String.valueOf(fdue);

				ps = cn.prepareStatement(upd_custMain);
				ps.setString(1, fnBill);
				ps.setString(2, fnPay);
				ps.setString(3, fnDue);
				ps.setString(4, cbdto.getCid());
			}
			ps.executeUpdate();
			cn.commit();

		} catch (SQLException se) {
			se.printStackTrace();
		}

	}

	public int CheckCid(String cid) {

		try {
			st = cn.createStatement();
			rs = st.executeQuery(select_CustCid);
			while (rs.next()) {
				if (rs.getString(1).equals(cid))
					return 1;
			}

		} catch (SQLException se) {
			se.printStackTrace();
		}
		return 0;

	}

}
