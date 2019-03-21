package model;

public class LikeVO extends TextVO{

	private String userId;
	private String userPw;
	
	
	public String getUserId(){
		return userId;
	}
	public void setUserId(String userId){
		this.userId = userId;
	}
	public String getUserPw(){
		return userPw;
	}
	public void setUserPw(String userPw){
		this.userPw=userPw;
	}
	
	


	@Override
	public int getId() {
		// TODO Auto-generated method stub
		return super.getId();
	}
	@Override
	public void setId(int id) {
		// TODO Auto-generated method stub
		super.setId(id);
	}
	@Override
	public String getTitle() {
		// TODO Auto-generated method stub
		return super.getTitle();
	}
	@Override
	public void setTitle(String title) {
		// TODO Auto-generated method stub
		super.setTitle(title);
	}
	@Override
	public String getAuthor() {
		// TODO Auto-generated method stub
		return super.getAuthor();
	}
	@Override
	public void setAuthor(String author) {
		// TODO Auto-generated method stub
		super.setAuthor(author);
	}
	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return super.getCount();
	}
	@Override
	public void setCount(int count) {
		// TODO Auto-generated method stub
		super.setCount(count);
	}
	@Override 
	public String getImg_url() {
		return super.getImg_url();
	}
	@Override
	public void setImg_url(String img_url) {
		super.setImg_url(img_url);
	}
	
}
