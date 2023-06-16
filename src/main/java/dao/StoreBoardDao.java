package dao;

import java.util.List;

import util.DaoHelper;
import vo.Member;
import vo.Product;
import vo.ProductCategory;
import vo.StoreBoard;


public class StoreBoardDao {

	private static StoreBoardDao instance = new StoreBoardDao();
	private StoreBoardDao() {}
	public static StoreBoardDao getInstance() {
		return instance;
	}
	
	// 전체 데이터 행의 갯수
	public int getTotalRows() {
		
		return DaoHelper.selectOne("storeBoardDao.getTotalRows", rs -> {
			return rs.getInt("cnt");
		});
		
	}
	
	public int getTotalRowsByProduct(int productNo) {
		
		return DaoHelper.selectOne("storeBoardDao.getTotalRowsByProduct", rs -> {
			
			return rs.getInt("cnt");
		}, productNo);
	}
	
	public int getTotalRowsByCatNo(int catNo) {
		
		return DaoHelper.selectOne("storeBoardDao.getTotalRowsByCat", rs -> {
			
			return rs.getInt("cnt");
		}, catNo);
	}
	
	
	// select
	public List<StoreBoard> getAllStoreBoards(int begin, int end) {
		
		return DaoHelper.selectList("storeBoardDao.getBoard", rs -> {
			StoreBoard storeBoard = new StoreBoard();
			
			storeBoard.setNo(rs.getInt("board_no"));
			storeBoard.setName(rs.getString("board_name"));
			storeBoard.setContent(rs.getString("board_content"));
			storeBoard.setGrade(rs.getString("board_grade"));
			storeBoard.setCreateDate(rs.getDate("board_create_date"));
			storeBoard.setUpdateDate(rs.getDate("board_update_date"));
			storeBoard.setReadCnt(rs.getInt("board_read_cnt"));
			storeBoard.setCommentCnt(rs.getInt("board_comment_cnt"));
			storeBoard.setDeleted(rs.getString("board_deleted"));
			storeBoard.setReport(rs.getString("board_report"));
			
			Member member = new Member();
			member.setId(rs.getString("member_id"));
			storeBoard.setMember(member);
			
			Product product = new Product();
			product.setNo(rs.getInt("product_no"));
			storeBoard.setProduct(product);
			
			ProductCategory category = new ProductCategory();
			category.setNo(rs.getInt("cat_no"));
			storeBoard.setCategory(category);
			
			return storeBoard;	
		}, begin, end);
	}
	
	public List<StoreBoard> getAllStoreBoardsByProductNo(int productNo, int begin, int end) {
		
		return DaoHelper.selectList("storeBoardDao.getBoardByProductNo", rs -> {
			StoreBoard storeBoard = new StoreBoard();
			
			storeBoard.setNo(rs.getInt("board_no"));
			storeBoard.setName(rs.getString("board_name"));
			storeBoard.setContent(rs.getString("board_content"));
			storeBoard.setGrade(rs.getString("board_grade"));
			storeBoard.setCreateDate(rs.getDate("board_create_date"));
			storeBoard.setUpdateDate(rs.getDate("board_update_date"));
			storeBoard.setReadCnt(rs.getInt("board_read_cnt"));
			storeBoard.setCommentCnt(rs.getInt("board_comment_cnt"));
			storeBoard.setDeleted(rs.getString("board_deleted"));
			storeBoard.setReport(rs.getString("board_report"));
			
			Member member = new Member();
			member.setId(rs.getString("member_id"));
			storeBoard.setMember(member);
			
			Product product = new Product();
			product.setNo(rs.getInt("product_no"));
			storeBoard.setProduct(product);
			
			ProductCategory category = new ProductCategory();
			category.setNo(rs.getInt("cat_no"));
			storeBoard.setCategory(category);
			
			return storeBoard;	
		}, productNo, begin, end);
	}

	public List<StoreBoard> getAllStoreBoardsByCatNo(int catNo, int begin, int end) {
		
		return DaoHelper.selectList("storeBoardDao.getBoardByCatNo", rs -> {
			StoreBoard storeBoard = new StoreBoard();
			
			storeBoard.setNo(rs.getInt("board_no"));
			storeBoard.setName(rs.getString("board_name"));
			storeBoard.setContent(rs.getString("board_content"));
			storeBoard.setGrade(rs.getString("board_grade"));
			storeBoard.setCreateDate(rs.getDate("board_create_date"));
			storeBoard.setUpdateDate(rs.getDate("board_update_date"));
			storeBoard.setReadCnt(rs.getInt("board_read_cnt"));
			storeBoard.setCommentCnt(rs.getInt("board_comment_cnt"));
			storeBoard.setDeleted(rs.getString("board_deleted"));
			storeBoard.setReport(rs.getString("board_report"));
			
			Member member = new Member();
			member.setId(rs.getString("member_id"));
			storeBoard.setMember(member);
			
			Product product = new Product();
			product.setNo(rs.getInt("product_no"));
			storeBoard.setProduct(product);
			
			ProductCategory category = new ProductCategory();
			category.setNo(rs.getInt("cat_no"));
			storeBoard.setCategory(category);
			
			return storeBoard;	
		}, catNo, begin, end);
	}
	
	public StoreBoard getAllStoreBoardsByNo(int boardNo) {
		
		return DaoHelper.selectOne("storeBoarDao.getBoardByNo", rs -> {
			StoreBoard storeBoard = new StoreBoard();
			
			storeBoard.setNo(rs.getInt("board_no"));
			storeBoard.setName(rs.getString("board_name"));
			storeBoard.setContent(rs.getString("board_content"));
			storeBoard.setGrade(rs.getString("board_grade"));
			storeBoard.setCreateDate(rs.getDate("board_create_date"));
			storeBoard.setUpdateDate(rs.getDate("board_update_date"));
			storeBoard.setReadCnt(rs.getInt("board_read_cnt"));
			storeBoard.setCommentCnt(rs.getInt("board_comment_cnt"));
			storeBoard.setDeleted(rs.getString("board_deleted"));
			storeBoard.setReport(rs.getString("board_report"));
			
			Member member = new Member();
			member.setId(rs.getString("member_id"));
			storeBoard.setMember(member);
			
			Product product = new Product();
			product.setNo(rs.getInt("product_no"));
			product.setName(rs.getString("product_name"));
			storeBoard.setProduct(product);
			
			ProductCategory category = new ProductCategory();
			category.setNo(rs.getInt("cat_no"));
			category.setName(rs.getString("cat_name"));
			storeBoard.setCategory(category);
			
			return storeBoard;	
		}, boardNo);
	}
	
	
	
	
	// insert, update
	public void insertStoreBoard(StoreBoard storeBoard) {
		
		DaoHelper.update("storeBoardDao.insertTheaterBoard" ,storeBoard.getName(),
															 storeBoard.getContent(),
															 storeBoard.getGrade(),
															 storeBoard.getMember().getId(),
															 storeBoard.getProduct().getNo(),
															 storeBoard.getCategory().getNo());	
		
	}
	
	public void updatStoreBoard(StoreBoard storeBoard) {
		
		DaoHelper.update("storeBoardDao.updateBoardByNo", storeBoard.getName(),
														  storeBoard.getContent(),
														  storeBoard.getGrade(),
														  storeBoard.getReadCnt(),
														  storeBoard.getCommentCnt(),
														  storeBoard.getDeleted(),
														  storeBoard.getReport(),
														  storeBoard.getCategory().getNo(),
														  storeBoard.getProduct().getNo(),
														  storeBoard.getNo());
	}
	
	// product
	public List<Product> getProducts() {
		return DaoHelper.selectList("storeBoardDao.getAllproducts", rs -> {
			Product product = new Product();
			product.setNo(rs.getInt("product_no"));
			product.setName(rs.getString("product_name"));
			
			
			return product;
		});
	}
	
	public List<Product> getProductsByCatNo(int catNo) {
		return DaoHelper.selectList("storeBoardDao.getAllproductsByCatNo", rs -> {
			Product product = new Product();
			product.setNo(rs.getInt("product_no"));
			product.setName(rs.getString("product_name"));
			
			
			return product;
		}, catNo);
	}
}
