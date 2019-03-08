package gs.goott.intro;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import gs.goott.content.ContentVO;
import gs.goott.util.DBConnection;

public class IntroDAO extends DBConnection implements IntroInterface {

	@Override
	public int introUpdate(IntroVO vo, String path) {
		int cnt = 0;
		String delFileName ="";
		try {
			dbConn();
			String sql ="select filename from introtbl where userid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getUserid());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				delFileName = rs.getString(1);
			}
			sql = "update introtbl set filename=?, interest=?, description=?, introdate=sysdate where userid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getFilename());
			pstmt.setString(2, vo.getInterestStr());
			pstmt.setString(3, vo.getDescription());
			pstmt.setString(4, vo.getUserid());
			cnt = pstmt.executeUpdate();
			
			if(delFileName!=null && !delFileName.equals("")) {
				File f = new File(path,delFileName);
				f.delete();
			}
		}catch(Exception e) {
			System.out.println("intro insert error"+e.getMessage());
		}finally {
			dbClose();
		}
		return cnt;
	}

	@Override
	public IntroVO selectIntroVO(String userid) {
		IntroVO vo = new IntroVO();
		try {
			dbConn();
			String sql = "select introno, userid, filename, interest, description, to_char(introdate, 'YYYY-MM-DD') from introtbl where userid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setIntroNo(rs.getInt(1));
				vo.setUserid(rs.getString(2));
				vo.setFilename(rs.getString(3));
				vo.setInterestStr(rs.getString(4));
				vo.setDescription(rs.getString(5));
				vo.setIntrodate(rs.getString(6));
			}
		}catch(Exception e) {
			System.out.println("intro select error"+e.getMessage());
		}finally {
			dbClose();
		}
		return vo;
	}

	@Override
	public int introInsert(String userid) {
		int cnt = 0;
		try {
			dbConn();
			String sql = "insert into introtbl(introNo, userid, filename, interest, description, introdate) values(introSq.nextVal, ?, 'Please attach the introvideo..', 'basic','(less than 500 letters)', sysdate)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			cnt = pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("intro add content error"+e.getMessage());
		}finally {
			dbClose();
		}
		return cnt;
	}
	
	//���ο� ���̴� ��õ ������
	@Override
	public List<IntroVO> getRecommendContents(String interest) {
		//interest �ڸ���
		String interestArr[] = interest.split("/");
		for(int i =0; i<interestArr.length;i++) {
			System.out.println(interestArr[i]);
		}
		System.out.println(interestArr.length);
		//
		List<IntroVO> list = new ArrayList<IntroVO>();
		try {
			dbConn();
			String sql ="select * from (";
			if(interest.equals("none")) {
				//�α��ξ��ѻ���
				sql +="select * from introtbl order by follower desc";
				sql += ") where rownum<=6";
				pstmt = con.prepareStatement(sql);
				System.out.println("sql = "+sql);
			}else {
				if(interestArr.length==1){
					//���ɻ� 1��
					sql +="select * from introtbl where  interest = ? order by follower desc";				
				}else if(interestArr.length==2){
					//���ɻ� 2��
					sql +="select * from introtbl where  interest = ? or  interest = ? order by follower desc";
				}else if(interestArr.length==3){
					//���ɻ� 3��
					sql +="select * from introtbl where  interest = ? or  interest = ? or interest= ? order by follower desc";
				}	
				sql += ") where rownum<=6";
				pstmt = con.prepareStatement(sql);
				
				for(int i=0 ; i<interestArr.length;i++) {
					System.out.println("�迭���� ="+interestArr.length);
					System.out.println(i);
					pstmt.setString(i+1, interestArr[i]);
				}
				System.out.println("sql = "+sql);
			}		
			
			sql += ") where rownum<=6";
			
			
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				IntroVO vo = new IntroVO();
				vo.setIntroNo(rs.getInt(1));
				vo.setUserid(rs.getString(2));
				vo.setDescription(rs.getString(5));
				vo.setThumbnail(rs.getString(7));
				vo.setTitle(rs.getString(8));
				vo.setFollower(rs.getInt(9));
				
				list.add(vo);
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("get 6 recommendContents error");
		}finally {
			dbClose();
		}
		return list;
	}
}