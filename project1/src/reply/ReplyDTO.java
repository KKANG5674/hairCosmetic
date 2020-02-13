package reply;

import java.sql.Date;

public class ReplyDTO {
    private int replyNo; // 
    private String content;
    private int parents; // question num
    private String id; // °ü¸®ÀÚ id
    private String dateCreated;
    
    public ReplyDTO() {
        // TODO Auto-generated constructor stub
    }

    public ReplyDTO(int replyNo, String content, int parents, String id, String dateCreated) {
        super();
        this.replyNo = replyNo;
        this.content = content;
        this.parents = parents;
        this.id = id;
        this.dateCreated = dateCreated;
    }

    public int getReplyNo() {
        return replyNo;
    }

    public void setReplyNo(int replyNo) {
        this.replyNo = replyNo;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getParents() {
        return parents;
    }

    public void setParents(int parents) {
        this.parents = parents;
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
    
    
    
}
