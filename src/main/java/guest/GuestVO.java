package guest;

public class GuestVO {
	private int idx;
	private String name;
	private String mid;
	private String content;
	private String visitDate;
	private String hostIp;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getVisitDate() {
		return visitDate;
	}
	public void setVisitDate(String visitDate) {
		this.visitDate = visitDate;
	}
	public String getHostIp() {
		return hostIp;
	}
	public void setHostIp(String hostIp) {
		this.hostIp = hostIp;
	}
	@Override
	public String toString() {
		return "GuestVO [idx=" + idx + ", name=" + name + ", mid=" + mid + ", content=" + content + ", visitDate="
				+ visitDate + ", hostIp=" + hostIp + "]";
	}
	
	
}
