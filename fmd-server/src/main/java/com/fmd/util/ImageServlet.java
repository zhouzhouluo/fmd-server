package com.fmd.util;
import java.io.IOException;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ImageServlet extends HttpServlet 
{   
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		MakePicture mp=new MakePicture() ;
		String str=mp.drawPicture(60, 20,res.getOutputStream() ) ;
		req.getSession().setAttribute("imgVcode", str) ;
		res.getOutputStream().print(str) ;
	}
}
