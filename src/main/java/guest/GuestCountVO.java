package guest;

public class GuestCountVO {
	private int idx;
	private String mid;
	private int count;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "GuestCountVO [idx=" + idx + ", mid=" + mid + ", count=" + count + "]";
	}
	
	
}
