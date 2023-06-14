package dao;

import java.util.List;

import util.DaoHelper;
import vo.Member;
// member_no <<<
public class AdminMemberDao {

	public static AdminMemberDao instance = new AdminMemberDao();
	public AdminMemberDao() {}
	public static AdminMemberDao getInstance() {
		return instance;
	}
	
	public Member getMemberById(String id) {
		return DaoHelper.selectOne("memberDao.getMemberById", rs -> {
			Member member = new Member();
			member.setId(rs.getString("member_id"));
			member.setPassword(rs.getString("member_password"));
			member.setGender(rs.getString("member_gender"));
			member.setName(rs.getString("member_name"));
			member.setEmail(rs.getString("member_email"));
			member.setType(rs.getString("member_type"));
			member.setBirth(rs.getString("member_birth"));
			member.setTel(rs.getString("member_tel"));
			member.setZipcode(rs.getString("member_zipcode"));
			member.setAddress1(rs.getString("member_address1"));
			member.setAddress2(rs.getString("member_address2"));
			member.setDisabled(rs.getString("member_disabled"));
			member.setReferee(rs.getString("member_referee"));
			member.setUpdateDate(rs.getDate("member_update_date"));
			member.setCreateDate(rs.getDate("member_create_date"));
			
			return member;
		}, id);
	}
	
	// 전체 회원 목록 조회
	public List<Member> getAllMembers() {
		return DaoHelper.selectList("AdminMemberDao.getMembers", rs -> {
			Member member = new Member();
			member.setId(rs.getString("member_id"));
			member.setPassword(rs.getString("member_password"));
			member.setGender(rs.getString("member_gender"));
			member.setName(rs.getString("member_name"));
			member.setEmail(rs.getString("member_email"));
			member.setType(rs.getString("member_type"));
			member.setBirth(rs.getString("member_birth"));
			member.setTel(rs.getString("member_tel"));
			member.setZipcode(rs.getString("member_zipcode"));
			member.setAddress1(rs.getString("member_address1"));
			member.setAddress2(rs.getString("member_address2"));
			member.setDisabled(rs.getString("member_disabled"));
			member.setReferee(rs.getString("member_referee"));
			member.setUpdateDate(rs.getDate("member_update_date"));
			member.setCreateDate(rs.getDate("member_create_date"));
			
			return member;
		});
	}
	
	// list 용
	public List<Member> getMembers(int begin, int end) {
		return DaoHelper.selectList("AdminMemberDao.getMembers", rs -> {
			Member member = new Member();
			member.setNo(rs.getInt("member_no"));
			member.setId(rs.getString("member_id"));
			member.setPassword(rs.getString("member_password"));
			member.setGender(rs.getString("member_gender"));
			member.setName(rs.getString("member_name"));
			member.setEmail(rs.getString("member_email"));
			member.setType(rs.getString("member_type"));
			member.setBirth(rs.getString("member_birth"));
			member.setTel(rs.getString("member_tel"));
			member.setZipcode(rs.getString("member_zipcode"));
			member.setAddress1(rs.getString("member_address1"));
			member.setAddress2(rs.getString("member_address2"));
			member.setDisabled(rs.getString("member_disabled"));
			member.setReferee(rs.getString("member_referee"));
			member.setUpdateDate(rs.getDate("member_update_date"));
			member.setCreateDate(rs.getDate("member_create_date"));
			
			return member;
		}, begin, end);
	}
	
	// 페이징 처리
	public int getTotalRows() {
		return DaoHelper.selectOne("productDao.getTotalRows", rs -> {
			return rs.getInt("cnt");
		});
	}
	
}
