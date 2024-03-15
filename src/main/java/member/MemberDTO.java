/**
 * 
 */
package member;

import java.time.LocalDateTime;

/**
 * 
 */
public class MemberDTO {
	private String memberId;
	private String name;
	private String pwd;
	private String jumin;
	private String addr1;
	private String addr2;
	private String addr;
	private String birthday;
	private String jobCode;
	private long mileage;
	private String memberState;
	private LocalDateTime regDate;
	private LocalDateTime leave_Date;
	private String pwd_change_date;
	
	public String getAddr() {
		return this.addr;
	}
	public void setAddr() {
		this.addr = this.addr1 + " " + this.addr2;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getJumin() {
		return jumin;
	}
	public void setJumin(String jumin) {
		this.jumin = jumin;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getJobCode() {
		return jobCode;
	}
	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}
	public long getMileage() {
		return mileage;
	}
	public void setMileage(long mileage) {
		this.mileage = mileage;
	}
	public String getMemberState() {
		return memberState;
	}
	public void setMemberState(String memberState) {
		this.memberState = memberState;
	}
	public LocalDateTime getRegDate() {
		return regDate;
	}
	public void setRegDate(LocalDateTime regDate) {
		this.regDate = regDate;
	}
	public LocalDateTime getLeave_Date() {
		return leave_Date;
	}
	public void setLeave_Date(LocalDateTime leave_Date) {
		this.leave_Date = leave_Date;
	}
	public String getPwd_change_date() {
		return pwd_change_date;
	}
	public void setPwd_change_date(String pwd_change_date) {
		this.pwd_change_date = pwd_change_date;
	}
}

class MemberVO {
	private String memberId;
	private String name;
	private String pwd;
	private String jumin;
	private String addr1;
	private String addr2;
	private String birthday;
	private String jobCode;
	private long mileage;
	private String memberState;
	private LocalDateTime regDate;
	private LocalDateTime leave_Date;
	private String pwd_change_date;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getJumin() {
		return jumin;
	}
	public void setJumin(String jumin) {
		this.jumin = jumin;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getJobCode() {
		return jobCode;
	}
	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}
	public long getMileage() {
		return mileage;
	}
	public void setMileage(long mileage) {
		this.mileage = mileage;
	}
	public String getMemberState() {
		return memberState;
	}
	public void setMemberState(String memberState) {
		this.memberState = memberState;
	}
	public LocalDateTime getRegDate() {
		return regDate;
	}
	public void setRegDate(LocalDateTime regDate) {
		this.regDate = regDate;
	}
	public LocalDateTime getLeave_Date() {
		return leave_Date;
	}
	public void setLeave_Date(LocalDateTime leave_Date) {
		this.leave_Date = leave_Date;
	}
	public String getPwd_change_date() {
		return pwd_change_date;
	}
	public void setPwd_change_date(String pwd_change_date) {
		this.pwd_change_date = pwd_change_date;
	}
	
}
