package com.dl.pojo;

public class Advice {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column advice.id
     *
     * @mbg.generated Tue Sep 17 10:11:34 CST 2019
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column advice.title
     *
     * @mbg.generated Tue Sep 17 10:11:34 CST 2019
     */
    private String title;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column advice.content
     *
     * @mbg.generated Tue Sep 17 10:11:34 CST 2019
     */
    private String content;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column advice.aid
     *
     * @mbg.generated Tue Sep 17 10:11:34 CST 2019
     */
    private Integer aid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column advice.time
     *
     * @mbg.generated Tue Sep 17 10:11:34 CST 2019
     */
    private String time;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column advice.id
     *
     * @return the value of advice.id
     *
     * @mbg.generated Tue Sep 17 10:11:34 CST 2019
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column advice.id
     *
     * @param id the value for advice.id
     *
     * @mbg.generated Tue Sep 17 10:11:34 CST 2019
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column advice.title
     *
     * @return the value of advice.title
     *
     * @mbg.generated Tue Sep 17 10:11:34 CST 2019
     */
    public String getTitle() {
        return title;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column advice.title
     *
     * @param title the value for advice.title
     *
     * @mbg.generated Tue Sep 17 10:11:34 CST 2019
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column advice.content
     *
     * @return the value of advice.content
     *
     * @mbg.generated Tue Sep 17 10:11:34 CST 2019
     */
    public String getContent() {
        return content;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column advice.content
     *
     * @param content the value for advice.content
     *
     * @mbg.generated Tue Sep 17 10:11:34 CST 2019
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column advice.aid
     *
     * @return the value of advice.aid
     *
     * @mbg.generated Tue Sep 17 10:11:34 CST 2019
     */
    public Integer getAid() {
        return aid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column advice.aid
     *
     * @param aid the value for advice.aid
     *
     * @mbg.generated Tue Sep 17 10:11:34 CST 2019
     */
    public void setAid(Integer aid) {
        this.aid = aid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column advice.time
     *
     * @return the value of advice.time
     *
     * @mbg.generated Tue Sep 17 10:11:34 CST 2019
     */
    public String getTime() {
        return time;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column advice.time
     *
     * @param time the value for advice.time
     *
     * @mbg.generated Tue Sep 17 10:11:34 CST 2019
     */
    public void setTime(String time) {
        this.time = time;
    }
    private Admin admin;

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
    
}