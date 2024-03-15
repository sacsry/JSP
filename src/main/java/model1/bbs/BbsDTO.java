package model1.bbs;

import java.util.Date;

public class BbsDTO {
	private int idx;
	private int ref_idx;
	private int level_idx;
	private int sort_order;
	private int read_cnt;
	private String user_id;
	private String title;
	private String content;
	private String display_date;
	private Date reg_date;
	private Date modify_Date;
	private String file_path;
	private String file_name;
	private String file_ext;
	private int file_size;
	
	public BbsDTO() {}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getRef_idx() {
		return ref_idx;
	}
	public void setRef_idx(int ref_idx) {
		this.ref_idx = ref_idx;
	}
	public int getLevel_idx() {
		return level_idx;
	}
	public void setLevel_idx(int level_idx) {
		this.level_idx = level_idx;
	}
	public int getSort_order() {
		return sort_order;
	}
	public void setSort_order(int sort_order) {
		this.sort_order = sort_order;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDisplay_date() {
		return display_date;
	}
	public void setDisplay_date(String display_date) {
		this.display_date = display_date;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getModify_Date() {
		return modify_Date;
	}
	public void setModify_Date(Date modify_Date) {
		this.modify_Date = modify_Date;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFile_ext() {
		return file_ext;
	}
	public void setFile_ext(String file_ext) {
		this.file_ext = file_ext;
	}
	public int getFile_size() {
		return file_size;
	}
	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}
	public int getRead_cnt() {
		return read_cnt;
	}
	public void setRead_cnt(int read_cnt) {
		this.read_cnt = read_cnt;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
}
