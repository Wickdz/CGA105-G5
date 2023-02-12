package com.musclebeach.articleFavorite.model;

import org.springframework.stereotype.Repository;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;


@Repository
public class ArticleFavoriteJDBCDAO implements ArticleFavoriteDAO_interface {

    String driver = "com.mysql.cj.jdbc.Driver";

    String url = "jdbc:mysql://localhost:3306/db01?serverTimezone=Asia/Taipei";

    String userid = "root";

    String passwd = "password";

    private static final String INSERT_STMT =
        "INSERT INTO gym.article_favorite (art_id,mem_id) VALUES (?, ?)";
    private static final String GET_ALL_STMT =
        "SELECT art_id,mem_id FROM gym.article_favorite order by mem_id";
    private static final String GET_ONE_STMT =
        "SELECT art_id,mem_id FROM gym.article_favorite where mem_id = ? order by art_id DESC";
    private static final String GET_ONE_STMT_BY_Favorite =
        "SELECT art_id,mem_id FROM gym.article_favorite where art_id = ? and mem_id = ?";
    private static final String DELETE =
        "DELETE FROM gym.article_favorite where art_id = ? and mem_id = ?";

    @Override
    public void insert(ArticleFavoriteVO articleFavoriteVO) {

        Connection con = null;
        PreparedStatement pstmt = null;

        try {

            Class.forName(driver);
            con = DriverManager.getConnection(url, userid, passwd);
            pstmt = con.prepareStatement(INSERT_STMT);

            pstmt.setInt(1, articleFavoriteVO.getArtID());
            pstmt.setInt(2, articleFavoriteVO.getMemID());


            pstmt.executeUpdate();

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
    public void delete(Integer artID,Integer memID) {

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
            throw new RuntimeException("Couldn't load database driver. "
                    + e.getMessage());
            // Handle any SQL errors
        } catch (SQLException se) {
            throw new RuntimeException("A database error occured. "
                    + se.getMessage());
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
    public List<ArticleFavoriteVO> getAllByMemID(Integer memID) {
        List<ArticleFavoriteVO> list = new ArrayList<ArticleFavoriteVO>();
        ArticleFavoriteVO articleFavoriteVO = null;

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            Class.forName(driver);
            con = DriverManager.getConnection(url, userid, passwd);
            pstmt = con.prepareStatement(GET_ONE_STMT);
            pstmt.setInt(1, memID);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                // empVO 也稱為 Domain objects
                articleFavoriteVO = new ArticleFavoriteVO();
                articleFavoriteVO.setArtID(rs.getInt("art_id"));
                articleFavoriteVO.setMemID(rs.getInt("mem_id"));

                list.add(articleFavoriteVO); // Store the row in the list
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
        return list;
    }



    @Override
    public List<ArticleFavoriteVO> getAll() {
        List<ArticleFavoriteVO> list = new ArrayList<ArticleFavoriteVO>();
        ArticleFavoriteVO articleFavoriteVO = null;

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
                articleFavoriteVO = new ArticleFavoriteVO();
                articleFavoriteVO.setArtID(rs.getInt("art_id"));
                articleFavoriteVO.setMemID(rs.getInt("mem_id"));

                list.add(articleFavoriteVO); // Store the row in the list
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
        return list;
    }

    @Override
    public ArticleFavoriteVO findByForeignKey(Integer artID,Integer memID) {

        ArticleFavoriteVO articleFavoriteVO = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            Class.forName(driver);
            con = DriverManager.getConnection(url, userid, passwd);
            pstmt = con.prepareStatement(GET_ONE_STMT_BY_Favorite);

            pstmt.setInt(1, artID);
            pstmt.setInt(2, memID);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                // empVo 也稱為 Domain objects
                articleFavoriteVO = new ArticleFavoriteVO();
                articleFavoriteVO.setArtID(rs.getInt("art_id"));
                articleFavoriteVO.setMemID(rs.getInt("mem_id"));
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
        return articleFavoriteVO;
    }

    public static void main(String[] args) {

        ArticleFavoriteJDBCDAO dao = new ArticleFavoriteJDBCDAO();

//			// 新增
//			ArticleFavoriteVO articleFavoriteVO1 = new ArticleFavoriteVO();
//			articleFavoriteVO1.setArtID(1);
//			articleFavoriteVO1.setMemID(1);
//
//			dao.insert(articleFavoriteVO1);

        // 刪除
//			dao.delete(1,1);

//			// 查詢
//			List<ArticleFavoriteVO> list = dao.getAllByMemID(4);
//			for (ArticleFavoriteVO e : list) {
//			System.out.print(e.getArtID() + ",");
//			System.out.println(e.getMemID());
//			}
//			
//			System.out.println("---------------------");
//
//			// 查詢
//			List<ArticleFavoriteVO> list1 = dao.getAll();
//			for (ArticleFavoriteVO e : list1) {
//				System.out.print(e.getArtID() + ",");
//				System.out.print(e.getMemID());
//
//				System.out.println();
//			}
    }
}
