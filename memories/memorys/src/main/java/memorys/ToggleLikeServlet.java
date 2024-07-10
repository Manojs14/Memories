package memorys;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ToggleLikeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session= request.getSession();
    	String post =  request.getParameter("post");
    	String EPost =  request.getParameter("ePost");

        String isLikedStr =request.getParameter("isLike");
        
       
        
        System.out.println("Receivedd thursday postId:" + EPost);
        System.out.println("Receivedddddd isLiked: " + isLikedStr);

        int postId=Integer.parseInt(post);
        boolean isLiked = Boolean.parseBoolean(isLikedStr);

        String userEmail = ((ServletRequest) session).getParameter("uemail"); // Assuming you store user email in session
        System.out.println("line 20 of ToggleLikeServlet  "+postId+"  "+userEmail);
       
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        try {Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/memories?useSSL=false", "root", "Manu2341");
            String likeStatusQuery = "SELECT isLiked FROM Postlikes WHERE memoryId = ? AND userEmail = ?";
            PreparedStatement ps = conn.prepareStatement(likeStatusQuery);
            ps.setInt(1, postId);
            ps.setString(2, userEmail);
            ResultSet rs = ps.executeQuery();
            System.out.println("line 30 of ToggleLikeServlet");
            if (rs.next()) {
                isLiked = rs.getBoolean("isLiked");
            }
            System.out.println("line 35 of ToggleLikeServlet");
            String updateLikeStatusQuery;
            String updateLikeCountQuery;

            if (isLiked) {
                updateLikeStatusQuery = "UPDATE postlikes SET isLiked = false WHERE memoryId = ? AND userEmail = ?";
                updateLikeCountQuery = "UPDATE posts SET likeCount = likeCount - 1 WHERE memoryId = ?";
            } else {
                updateLikeStatusQuery = "INSERT INTO postlikes (memoryId, userEmail, isLiked) VALUES (?, ?, true) ON DUPLICATE KEY UPDATE isLiked = true";
                updateLikeCountQuery = "UPDATE posts SET likeCount = likeCount + 1 WHERE memoryId = ?";
            }

            ps = conn.prepareStatement(updateLikeStatusQuery);
            ps.setInt(1, postId);
            ps.setString(2, userEmail);
            ps.executeUpdate();

            ps = conn.prepareStatement(updateLikeCountQuery);
            ps.setInt(1, postId);
            ps.executeUpdate();

            String likeCountQuery = "SELECT likeCount FROM posts WHERE memoryId = ?";
            ps = conn.prepareStatement(likeCountQuery);
            ps.setInt(1, postId);
            rs = ps.executeQuery();

            int likeCount = 0;
            if (rs.next()) {
                likeCount = rs.getInt("likeCount");
            }

            String jsonResponse = String.format("{\"isLiked\": %b, \"likeCount\": %d}", !isLiked, likeCount);
            out.print(jsonResponse);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
