package model;

public class TextVO extends NewsVO{
	
	private String img_url;
	private String text;
	
	

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
	public String getDay() {
		// TODO Auto-generated method stub
		return super.getDay();
	}
	@Override
	public void setDay(String day) {
		// TODO Auto-generated method stub
		super.setDay(day);
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
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
	
}
