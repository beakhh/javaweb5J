package member;

public class MemberVO {
	private int idx;
	private String mid;
	private String pwd;
	private String name;
	private String nickName;
	private String gender;
	private String birthday;
	private String tel;
	private String address;
	private String email;
	private String job;
	private String photo;
	private String content;
	private String userInfor;
	private String userDel;
	private int point;
	private int level;
	private String startDate;
	private String lastDate;
	private int visitCnt;
	private int todayCnt;
	private String salt;
	
	private int deleteDiff; //날짜 비교

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUserInfor() {
		return userInfor;
	}

	public void setUserInfor(String userInfor) {
		this.userInfor = userInfor;
	}

	public String getUserDel() {
		return userDel;
	}

	public void setUserDel(String userDel) {
		this.userDel = userDel;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getLastDate() {
		return lastDate;
	}

	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}

	public int getVisitCnt() {
		return visitCnt;
	}

	public void setVisitCnt(int visitCnt) {
		this.visitCnt = visitCnt;
	}

	public int getTodayCnt() {
		return todayCnt;
	}

	public void setTodayCnt(int todayCnt) {
		this.todayCnt = todayCnt;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public int getDeleteDiff() {
		return deleteDiff;
	}

	public void setDeleteDiff(int deleteDiff) {
		this.deleteDiff = deleteDiff;
	}

	@Override
	public String toString() {
		return "MemberVO [idx=" + idx + ", mid=" + mid + ", pwd=" + pwd + ", name=" + name + ", nickName=" + nickName
				+ ", gender=" + gender + ", birthday=" + birthday + ", tel=" + tel + ", address=" + address + ", email=" + email
				+ ", job=" + job + ", photo=" + photo + ", content=" + content + ", userInfor=" + userInfor + ", userDel="
				+ userDel + ", point=" + point + ", level=" + level + ", startDate=" + startDate + ", lastDate=" + lastDate
				+ ", visitCnt=" + visitCnt + ", todayCnt=" + todayCnt + ", salt=" + salt + ", deleteDiff=" + deleteDiff + "]";
	}
	
	
	
}
