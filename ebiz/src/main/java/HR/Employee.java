package HR;

public class Employee {

	private int id;
	private String username;
	private String email;
	private String password;
	private String date;
	private int role;

	public Employee() {
	}

	public Employee(int id, String name, String email, String password,String location,int role, String date) {
		this.id = id;
		this.username = name;
		this.email = email;
		this.password = password;
		this.date = date;
		this.role = role;

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return username;
	}

	public void setName(String name) {
		this.username = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", usernasme=" + username + ", email=" + email + ", password=" + password + ", date of employment=" + date + "]";
	}
}
	
