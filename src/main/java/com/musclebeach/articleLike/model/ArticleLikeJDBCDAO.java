package com.musclebeach.articleLike.model;

import org.springframework.stereotype.Repository;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



@Repository
public class ArticleLikeJDBCDAO implements ArticleLikeDAO_interface {

	String driver = "com.mysql.cj.jdbc.Driver";

	String url = "jdbc:mysql://localhost:3306/db01?serverTimezone=Asia/Taipei";

	String userid = "root";

	String passwd = "password";

	private static final String INSERT_STMT = "INSERT INTO gym.article_like (art_id,mem_id) VALUES (?, ?)";
	private static final String GET_ALL_STMT = "SELECT art_id,mem_id FROM gym.article_like order by art_id";
	private static final String GET_ONE_STMT = "SELECT art_id,mem_id FROM gym.article_like where art_id = ?";
	private static final String GET_ONE_STMT_BY_LIKE = "SELECT art_id,mem_id FROM gym.article_like where art_id = ? and mem_id = ?";
	private static final String DELETE = "DELETE FROM gym.article_like where art_id = ? and mem_id = ?";

	@Override
	public void insert(ArticleLikeVO artLikeVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, artLikeVO.getArtID());
			pstmt.setInt(2, artLikeVO.getMemID());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void delete(Integer artID, Integer memID) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, artID);
			pstmt.setInt(2, memID);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public List<ArticleLikeVO> getAllByArtID(Integer artID) {
		List<ArticleLikeVO> list = new ArrayList<ArticleLikeVO>();
		ArticleLikeVO artLikeVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, artID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				artLikeVO = new ArticleLikeVO();
				artLikeVO.setArtID(rs.getInt("art_id"));
				artLikeVO.setMemID(rs.getInt("mem_id"));

				list.add(artLikeVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	@Override
	public List<ArticleLikeVO> getAll() {
		List<ArticleLikeVO> list = new ArrayList<ArticleLikeVO>();
		ArticleLikeVO artLikeVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				artLikeVO = new ArticleLikeVO();
				artLikeVO.setArtID(rs.getInt("art_id"));
				artLikeVO.setMemID(rs.getInt("mem_id"));

				list.add(artLikeVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	
	@Override
	public ArticleLikeVO findByForeignKey(Integer artID,Integer memID) {

		ArticleLikeVO articleLikeVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT_BY_LIKE);

			pstmt.setInt(1, artID);
			pstmt.setInt(2, memID);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				articleLikeVO = new ArticleLikeVO();
				articleLikeVO.setMemID(rs.getInt("mem_id"));
				articleLikeVO.setArtID(rs.getInt("art_id"));
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return articleLikeVO;
	}
	public static void main(String[] args) {
		ArticleLikeJDBCDAO dao = new ArticleLikeJDBCDAO();

//	// 新增
//	ArtLikeVO artLikeVO1 = new ArtLikeVO();
//	artLikeVO1.setArtID(1);
//	artLikeVO1.setMemID(1);
//
//	dao.insert(artLikeVO1);

//		// 刪除
//	dao.delete(1,1);

//	// 查詢
//	List<ArtLikeVO> list = dao.getAllByArtID(1);
//	for (ArtLikeVO e : list) {
//		System.out.print(e.getArtID() + ",");
//		System.out.println(e.getMemID());
//	}
//	
//	System.out.println("---------------------");
//
//	// 查詢
//	List<ArtLikeVO> list1 = dao.getAll();
//	for (ArtLikeVO e : list1) {
//		System.out.print(e.getArtID() + ",");
//		System.out.print(e.getMemID());
//
//		System.out.println();
//	}
	}
}
