package question;

import java.sql.Date;

public class QuestionDTO {

	private int num;
	private String title;
	private String content;
	private String id;
	private String dateCreated;
	
	public QuestionDTO() {
		// TODO Auto-generated constructor stub
	}

	public QuestionDTO(int num, String title, String content, String id, String dateCreated) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.id = id;
		this.dateCreated = dateCreated;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(String dateCreated) {
		this.dateCreated = dateCreated;
	}
	
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		 return "NoticeDTO [num=" + num + ", title=" + title + ", content=" + content
	                + ", id=" + id + ", dateCreated=" + dateCreated + "]";
	}
	
	
}
