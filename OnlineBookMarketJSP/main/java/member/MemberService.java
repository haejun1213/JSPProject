package member;

import java.util.List;

public class MemberService {
	private MemberDAO memberDao;// 의존성을 위해 MemberService 밖에서 받아오기
	
	public MemberService(MemberDAO memberDao) {
		this.memberDao = memberDao;
	}
	
	public boolean regist(Member member) {
		return 1 ==  memberDao.insertMember(member);
	}
	
	public Member read(int no) {
		return memberDao.selectMember(no);
	}
	
	public List<Member> listAll(){		
		return memberDao.selectAllMember();
	}
	
	public boolean edit(Member member, String oldPassword) {
		if(member == null) return false;
		if(oldPassword == null) return false;
		
		Member memInfo = memberDao.selectMember(member.getNo());
		if(oldPassword.equals(memInfo.getPassword()))
			return 1 == memberDao.updateMember(member);
		else
			return false;
	}
	
	public boolean remove(int no) {
		if(memberDao.selectMember(no) == null)
			return false;
		return 1 == memberDao.deleteMember(no);
	}
	
	public Member login(String id, String password) {
		return memberDao.selectMember(id, password);
	}
}
