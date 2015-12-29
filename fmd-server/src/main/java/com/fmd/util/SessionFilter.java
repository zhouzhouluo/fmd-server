/**
 *
 * @author geloin
 * @date 2012-4-10 下午2:37:38
 */
package com.fmd.util;
 
import java.io.IOException;
import java.io.PrintWriter;
 
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.springframework.web.filter.OncePerRequestFilter;
 
/**
 * 登录过滤
 * 
 * @author geloin
 * @date 2012-4-10 下午2:37:38
 */
public class SessionFilter extends OncePerRequestFilter {
 
    /*
     * (non-Javadoc)
     * 
     * @see
     * org.springframework.web.filter.OncePerRequestFilter#doFilterInternal(
     * javax.servlet.http.HttpServletRequest,
     * javax.servlet.http.HttpServletResponse, javax.servlet.FilterChain)
     */
    @Override
    protected void doFilterInternal(HttpServletRequest request,
            HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {
    	String url = request.getRequestURL().toString();
//    	System.out.println("url--------------------："+url);
        // 不过滤的uri
        String[] notFilter = new String[] { "login.jsp", "index.jsp","login.action","index.html","pwd2.action","imgVcode"};
 
        // 请求的uri
        String uri = request.getRequestURI();
//        System.out.println("uri--------------------eeeeeeeeeeeee："+uri);
//        System.out.println("//.equals(uri))："+("//".equals(uri)));
//        System.out.println("/.equals(uri))："+("/".equals(uri)));
//        System.out.println("\\.equals(uri))："+("\\".equals(uri)));
        // uri中包含background时才进行过滤
//        String imgVcode = (String)request.getSession().getAttribute("imgVcode") ;
//        System.out.println("imgVcode------------------------------:"+imgVcode);
        if (true) {
            // 是否过滤
            boolean doFilter = true;
            for (String s : notFilter) {
                if (uri.indexOf(s) != -1||uri.endsWith("fmd/")||uri.endsWith("fmd-server/")||uri.endsWith("fmd")
                		||uri.endsWith("fmd-server")||"//".equals(uri)||"\\".equals(uri)||"/".equals(uri)) {
                    // 如果uri中包含不过滤的uri，则不进行过滤
                    doFilter = false;
                    break;
                }
            }
            if (doFilter) {
                // 执行过滤
                // 从session中获取登录者实体
                Object obj = request.getSession().getAttribute("loginedUser");
                Object userPwd2 = request.getSession().getAttribute("userPwd2");
                if (null == obj) {
                    // 如果session中不存在登录者实体，则弹出框提示重新登录
                    // 设置request和response的字符集，防止乱码
                    request.setCharacterEncoding("UTF-8");
                    response.setCharacterEncoding("UTF-8");
                    PrintWriter out = response.getWriter();
                    String loginPage = "....";
                    StringBuilder builder = new StringBuilder();
                    builder.append("<script type=\"text/javascript\">");
                    builder.append("alert('网页过期，请重新登录！');");
                    builder.append("window.top.location.href='");
                    builder.append(loginPage);
                    builder.append("';");
                    builder.append("</script>");
                    out.print(builder.toString());
                    response.sendRedirect(request.getContextPath()+"/business");
                } else if(userPwd2==null&&(uri.indexOf("UserPassword.jsp")==-1)){
                	request.setCharacterEncoding("UTF-8");
                    response.setCharacterEncoding("UTF-8");
                    response.sendRedirect(request.getContextPath()+"/business/member_user/UserPassword.jsp");
                }else {
                    // 如果session中存在登录者实体，则继续
                    filterChain.doFilter(request, response);
                }
            } else {
                // 如果不执行过滤，则继续
                filterChain.doFilter(request, response);
            }
        } else {
            // 如果uri中不包含background，则继续
            filterChain.doFilter(request, response);
        }
    }
 
}