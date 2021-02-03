package master.DAO;

import java.sql.*;

import master.DTO.StockRiceDTO;
import master.utilities.ConnectionFactory;

public class StockRiceDAO {
	
	Statement st=null;
	ResultSet rs=null;
	PreparedStatement ps=null;
	String insert_stockRice="insert into stock_rice values(?,?,?)";
	
	String select_stockRice="select rice_id,bag from stock_rice";
	
	String select_riceId="select distinct rice_id from stock_rice";
	
	ConnectionFactory obj=new ConnectionFactory();
	Connection cn=obj.getCon();
	
	public void InsertStockRice(StockRiceDTO srdto) {
		
		try {
			ps=cn.prepareStatement(insert_stockRice);
			ps.setString(1, srdto.getRice_id());
			ps.setString(2, srdto.getBag());
			ps.setString(3, srdto.getNofbag());
			ps.executeUpdate();
			cn.commit();
		} catch (SQLException se) {
			se.printStackTrace();
		}
		
	}
	public int CheckRiceId(String rice_id,String bag) {
		
		try {
			st=cn.createStatement();
			rs=st.executeQuery(select_stockRice);
			while(rs.next())
			{
				if(rs.getString(1).equals(rice_id) && rs.getString(2).equals(bag))
					return 1;
			}
			
		} catch (SQLException se) {
			se.printStackTrace();
		}
		return 0;
		
	}
	public ResultSet getRiceId() {
		
		try {
			st=cn.createStatement();
			rs=st.executeQuery(select_riceId);
		} catch (SQLException se) {
			se.printStackTrace();
		}
		return rs;
	}
}
