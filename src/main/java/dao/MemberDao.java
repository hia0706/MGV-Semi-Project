package dao;

import java.util.List;

import util.DaoHelper;
import vo.Member;

public class MemberDao {
	
	private static MemberDao instance = new MemberDao();
	private MemberDao() {}
	public static MemberDao getInstance() {
		return instance;
	}

	public void insertMember(Member member) {
		DaoHelper.update("memberDao.insertMember", member.getId(),
												   member.getPassword(),
												   member.getName(),
												   member.getGender(),
												   member.getEmail(),
												   member.getZipcode(),
												   member.getAddress1(),
												   member.getAddress2(),
												   member.getBirth(),
												   member.getTel(),
												   member.getReferee());
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
	
	public Member getDetailMemberById(String id) {
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

	public void updateMember(Member member) {
		DaoHelper.update("memberDao.updateMember", member.getName(),
												   member.getPassword(),
												   member.getZipcode(),
												   member.getAddress1(),
												   member.getAddress2(),
												   member.getEmail(),
												   member.getTel(),
												   member.getDisabled(),
												   member.getId());
	}
	
	/// 관리자 //
	// 전체 회원 목록
	public List<Member> getAllMembers() {
		return DaoHelper.selectList("memberDao.getMembers", rs -> {
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
	
	public List<Member> getAdminMembers(int begin, int end) {
		return DaoHelper.selectList("memberDao.getAdminMembers", rs -> {
			Member member = new Member();
			member.setId(rs.getString("member_id"));
			member.setName(rs.getString("member_name"));
			member.setBirth(rs.getString("member_birth"));
			member.setTel(rs.getString("member_tel"));
			member.setEmail(rs.getString("member_email"));
			member.setDisabled(rs.getString("member_disabled"));
			member.setCreateDate(rs.getDate("member_create_date"));
			member.setUpdateDate(rs.getDate("member_update_date"));
			
			return member;
		}, begin, end);
	}
	
	public List<Member> getMembers(int begin, int end) {
		return DaoHelper.selectList("memberDao.getMembers", rs -> {
			Member member = new Member();
			member.setId(rs.getString("member_id"));
			member.setName(rs.getString("member_name"));
			member.setBirth(rs.getString("member_birth"));
			member.setTel(rs.getString("member_tel"));
			member.setEmail(rs.getString("member_email"));
			member.setDisabled(rs.getString("member_disabled"));
			member.setCreateDate(rs.getDate("member_create_date"));
			member.setUpdateDate(rs.getDate("member_update_date"));
			
			return member;
		}, begin, end);
	}
	
	// 페이징 처리
		public int getTotalRows() {
			return DaoHelper.selectOne("memberDao.getTotalRows", rs -> {
				return rs.getInt("cnt");
			});
		}
	
	
}
