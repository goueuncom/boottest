package semi;

public class StockDto {
	private int code;		// 상품코드
	private String name;	// tinput테이블 상품명	
	private int count;		// 입고갯수
	private String idate;	// 입고일
	private String odate;	// 입고일	
	private int des;		// 부서번호
	
	//사원테이블 변수
	private String pname;		// 사원명	
	private String posname;		// 직급
	private String phdate;	// 입사일자
	private int psa;		// 급여
	private int pnum;		// 직급번호
	private int pdes;		// 부서번호
	private int pcode;		// 사원번호
	private int unpaid;		// 무급
	private int paid;		// 유급
	private int late;		// 지각
	
	private String sort;	//정렬부분
	private int All_I_Count;
	private int All_O_Count;
	
	
	
	
	

	
	//
	//private int iname;		// tlist와 tstock테이블 상품명
	private String cname;	// 공급처명
	private int price;		// 입고가
	private int sprice; 	// 출고가
	
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getIdate() {
		return idate;
	}
	public void setIdate(String idate) {
		this.idate = idate;
	} 
	public String getOdate() {
		return odate;
	}
	public void setOdate(String odate) {
		this.odate = odate;
	}
	public int getDes() {
		return des;
	}
	public void setDes(int des) {
		this.des = des;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSprice() {
		return sprice;
	}
	public void setSprice(int sprice) {
		this.sprice = sprice;
	}	
	
	public String getPname() {		
		return pname;
		
	}
	public void setPname(String pname) {
		if(pname == null){
		this.pname = "qwer";}
		else if(pname != null){
		this.pname = pname;}
	}
	public String getPosname() {
		return posname;
	}
	public void setPosname(String posname) {
		this.posname = posname;
	}
	public String getPhdate() {
		return phdate;
	}
	public void setPhdate(String phdate) {
		this.phdate = phdate;
	}
	public int getPsa() {
		return psa;
	}
	public void setPsa(int psa) {
		this.psa = psa;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public int getPdes() {
		return pdes;
	}
	public void setPdes(int pdes) {
		this.pdes = pdes;
	}
	public int getPcode() {
		return pcode;
	}
	public void setPcode(int pcode) {
		this.pcode = pcode;
	}
	public int getUnpaid() {
		return unpaid;
	}
	public void setUnpaid(int unpaid) {
		this.unpaid = unpaid;
	}
	public int getPaid() {
		return paid;
	}
	public void setPaid(int paid) {
		this.paid = paid;
	}
	public int getLate() {
		return late;
	}
	public void setLate(int late) {
		this.late = late;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	
	public int getAll_I_Count() {
		return All_I_Count;
	}
	public void setAll_I_Count(int all_I_Count) {
		All_I_Count = all_I_Count;
	}
	public int getAll_O_Count() {
		return All_O_Count;
	}
	public void setAll_O_Count(int all_O_Count) {
		All_O_Count = all_O_Count;
	}
}
