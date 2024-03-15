package model1.bbs;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

public class BbsDAO extends JDBConnect {
	public BbsDAO() {}
	
	public BbsDAO(ServletContext application) {
		super(application);
	}
	
	public int bbsTotalCount(Map<String,Object> map) {
		int total_count = 0;
		
		/*
		 * String sql = ""; if(map!=null) { sql += "WHERE " +
		 * map.get("search_category"); sql += "LIKE '%"+map.get("search_word") + "%'"; }
		 */
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT COUNT(*) FROM tbl_bbs");
		if(map.get("search_category") !=null && map.get("search_word") !=null) {
			sb.append(" WHERE " + map.get("search_category"));
			sb.append(" LIKE "+"'%"+map.get("search_word") + "%'");
		}
		
		try {
			String sql = sb.toString();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			total_count = rs.getInt(1);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("게시물 갯수 조회 에러");
		}
		return total_count;
	}
	
	public List<BbsDTO> bbsList(Map<String,Object> map){
		List<BbsDTO> list = new Vector<BbsDTO>();
		
		int total_count = bbsTotalCount(map);
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT idx, ref_idx, level_idx, sort_order");
		sb.append(", user_id, title, content, read_cnt");
		sb.append(", display_date,reg_date,modify_date");
		//sb.append(", file_path, file_name,file_ext,file_size");
		sb.append(" FROM tbl_bbs");
		
		if(map.get("search_category") !=null && map.get("search_word") !=null) {
			sb.append(" WHERE " + map.get("search_category"));
			sb.append(" LIKE '%" + map.get("search_word") +"%'");
		}
		sb.append(" ORDER BY idx DESC");
		/* sb.append(" LIMIT "+10*(a-1)+", "+10); */
		try {
			psmt = conn.prepareStatement(sb.toString());
			rs = psmt.executeQuery();
			while(rs.next()) {
				BbsDTO dto = new BbsDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setRef_idx(rs.getInt("ref_idx"));
				dto.setLevel_idx(rs.getInt("level_idx"));
				dto.setSort_order(rs.getInt("sort_order"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRead_cnt(rs.getInt("read_cnt"));
				dto.setDisplay_date(rs.getString("display_date"));
				dto.setReg_date(rs.getDate("reg_date"));
				dto.setModify_Date(rs.getDate("modify_date"));
				list.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("게시물 공부 다시하자...");
		}
		
		
		return list;
	}
	
	public List<BbsDTO> bbsListPaging(Map<String,Object> map,int a){
		List<BbsDTO> list = new Vector<BbsDTO>();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT idx, ref_idx, level_idx, sort_order");
		sb.append(", user_id, title, content, read_cnt");
		sb.append(", display_date,reg_date,modify_date");
		//sb.append(", file_path, file_name,file_ext,file_size");
		sb.append(" FROM tbl_bbs");
		
		if(map.get("search_category") !=null && map.get("search_word") !=null) {
			sb.append(" WHERE " + map.get("search_category"));
			sb.append(" LIKE '%" + map.get("search_word") +"%'");
		}
		sb.append(" ORDER BY idx DESC");
		sb.append(" LIMIT "+10*(a-1)+", "+10);
		try {
			psmt = conn.prepareStatement(sb.toString());
			rs = psmt.executeQuery();
			while(rs.next()) {
				BbsDTO dto = new BbsDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setRef_idx(rs.getInt("ref_idx"));
				dto.setLevel_idx(rs.getInt("level_idx"));
				dto.setSort_order(rs.getInt("sort_order"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRead_cnt(rs.getInt("read_cnt"));
				dto.setDisplay_date(rs.getString("display_date"));
				dto.setReg_date(rs.getDate("reg_date"));
				dto.setModify_Date(rs.getDate("modify_date"));
				list.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("게시물 공부 다시하자...");
		}
		
		
		return list;
	}
	
	public BbsDTO bbsView(int idx) {
		BbsDTO dto = new BbsDTO();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT idx, ref_idx, level_idx, sort_order");
		sb.append(", user_id, title, content, read_cnt");
		sb.append(", display_date,reg_date,modify_date");
		//sb.append(", file_path, file_name,file_ext,file_size");
		sb.append(" FROM tbl_bbs");
		sb.append(" WHERE idx=?");
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setInt(1, idx);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setIdx(rs.getInt("idx"));
				dto.setRef_idx(rs.getInt("ref_idx"));
				dto.setLevel_idx(rs.getInt("level_idx"));
				dto.setSort_order(rs.getInt("sort_order"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRead_cnt(rs.getInt("read_cnt"));
				dto.setDisplay_date(rs.getString("display_date"));
				dto.setReg_date(rs.getDate("reg_date"));
				dto.setModify_Date(rs.getDate("modify_date"));
			}
		}catch(Exception e) {
			System.out.println("게시판 데이터 조회 오류");
			e.printStackTrace();
		}
		return dto;
	}
	
	public int bbsRegist(BbsDTO dto) {
		String id = dto.getUser_id();
		String title = dto.getTitle();
		String content = dto.getContent();
		int result = 0;
		
		StringBuilder sb = new StringBuilder();
		sb.append("INSERT INTO tbl_bbs(user_id, title, content, reg_date)");
		sb.append(" VALUES(?, ?, ?, now())");
		
		try {
			if(id.trim() !="" && title.trim()!= "" && content.trim()!="") {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, id);
			psmt.setString(2, title);
			psmt.setString(3, content);
			
			result = psmt.executeUpdate();
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	public int bbsModify(BbsDTO dto) {
		String title = dto.getTitle();
		String content = dto.getContent();
		int idx = dto.getIdx();
		int result = 0;
		
		StringBuilder sb = new StringBuilder();
		sb.append("UPDATE tbl_bbs");
		sb.append(" SET title=?,content=?");
		sb.append(" WHERE idx=?");
		
		try {
		
			if(title.trim()!= "" && content.trim()!="") {
				psmt = conn.prepareStatement(sb.toString());
				psmt.setString(1, title);
				psmt.setString(2, content);
				psmt.setInt(3, idx);
				
				result = psmt.executeUpdate();
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("수정 안됫어");
		}
		return result;
	}
	
	
	public int bbsDelete(BbsDTO dto) {
		String title = dto.getTitle();
		String content = dto.getContent();
		int idx = dto.getIdx();
		int result = 0;
		
		StringBuilder sb = new StringBuilder();
		sb.append("DELETE FROM tbl_bbs");
		sb.append(" WHERE idx=?");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setInt(1, idx);
				
			result = psmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("삭제 안됫어");
			e.printStackTrace();
		}
		return result;
	}
	
}
