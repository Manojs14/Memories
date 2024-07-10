package memorys;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

public class GetLikeStatusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String post = request.getParameter("postId");
        String userEmail = request.getParameter("userEmail");

        
        System.out.println("Received postId in getlikestatus: " + post);
        System.out.println("Received userEmail  in getlikestatus: " + userEmail);

        int postId=Integer.parseInt(post);


        System.out.println("line 25 of LikeServlet  "+postId+" "+userEmail);
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        try {Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/memories?useSSL=false", "root", "Manu2341");
            String likeStatusQuery = "SELECT isLiked FROM postlikes WHERE memoryId = ? AND userEmail = ?";
            PreparedStatement ps = conn.prepareStatement(likeStatusQuery);
            ps.setInt(1, postId);
            ps.setString(2, userEmail);
            ResultSet rs = ps.executeQuery();

            boolean isLiked = false;
            if (rs.next()) {
                isLiked = rs.getBoolean("isLiked");
            }

            String likeCountQuery = "SELECT likeCount FROM posts WHERE memoryId = ?";
            ps = conn.prepareStatement(likeCountQuery);
            ps.setInt(1, postId);
            rs = ps.executeQuery();

            int likeCount = 0;
            if (rs.next()) {
                likeCount = rs.getInt("likeCount");
            }

            JSONObject json = new JSONObject();
            json.put("isLiked", isLiked);
            json.put("likeCount", likeCount);

            out.print(json);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
