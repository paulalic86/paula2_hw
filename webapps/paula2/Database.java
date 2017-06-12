package com.database;
import java.sql.*;
public class Database{
  private Connection con = null;
  private Statement stmt = null;
  private ResultSet rs = null;
  private String ip = "";
  private String port = "";
  private String url = "";
  private String db = "";
  private String user = "";
  private String password = "";
  private String driver = "com.mysql.jdbc.Driver";

  public Database(){

  }
  public void connectDB(){
    try{
      url = "jdbc:mysql://" + ip + ":" + port + "/" + db + "?useUnicode=true&characterEncoding=utf-8";
      Class.forName(driver);
      con = DriverManager.getConnection(url,user,password);
      stmt = con.createStatement();
    }catch(Exception ex){
      System.out.println(ex);
    }
  }
  public void query(String sql){
    try{
      rs = stmt.executeQuery(sql);
    }catch(Exception ex){
      System.out.println(ex);
    }
  }
  public void insertData(String account,String password,String name,String birth,String email,String phone){
    try{
      String sql = "insert into person(account,password,name,birth,email,phone) value(?,?,?,?,?,?)";
      PreparedStatement qq = con.prepareStatement(sql);
      qq.setString(1,account);
      qq.setString(2,password);
      qq.setString(3,name);
      qq.setString(4,birth);
      qq.setString(5,email);
      qq.setString(6,phone);
      int x = qq.executeUpdate();
    }catch(Exception ex){
      System.out.println(ex);
    }
  }
  public Connection getCon(){
    return con;
  }
  public ResultSet getRS(){
    return rs;
  }
  public void setIp(String ip){
    this.ip = ip;
  }
  public void setPort(String port){
    this.port = port;
  }
  public void setUrl(String ip,String port){
    this.url = "jdbc:mysql://" + ip + ":" + port + "/";
  }
  public void setDb(String dbName){
    this.db = dbName;
  }
  public void setUser(String username){
    this.user = username;
  }
  public void setPassword(String password){
    this.password = password;
  }
  public void setDriver(String driver){
    this.driver = driver;
  }
}

  public void checkId(String account){
    int y=0;
    database.connectDB();
    String sql = "select * from person;";
    database.query(sql);
    rs = database.getRS();
    String accountData = rs.getString("account");
    if(account.equals(accountData)){
      y+=1;
      break;
    }
    if(y!=0){
      System.out.print ="註冊失敗!";
    }else{
      database.insertData(account,password,name,birth,email,phone);
      System.out.print ="註冊成功!";
    }
  }
