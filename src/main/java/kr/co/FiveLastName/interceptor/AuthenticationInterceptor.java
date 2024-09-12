package kr.co.FiveLastName.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class AuthenticationInterceptor implements HandlerInterceptor {
//  Controller가 요청을 처리하기전에 호출하는 메소드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		// 클라이언트에 부여한 세션을 가져온다.
		HttpSession session = request.getSession();
		String userRole = (String) session.getAttribute("st_department");
		String requestURI = request.getRequestURI();

		// 로그인 여부 체크
		if (session.getAttribute("st_id") == null) {

			if (requestURI.equals("/") || requestURI.startsWith("/product") || requestURI.startsWith("/estimate")
					|| requestURI.startsWith("/contract")) {
				response.sendRedirect(request.getContextPath() + "/login");
				return false;
			}
		}

		if (!hasAccess(userRole, requestURI)) {
			// 권한이 없는 페이지 접근 시 오류 페이지로 리다이렉트
			response.sendRedirect(request.getContextPath() + "/accessDenied");
			return false;
		}

		return true; // 로그인이 되어있으면 그냥 통과

	}

	private boolean hasAccess(String userRole, String requestURI) {
		if (requestURI.equals("/")) {
			return true;
		}
		if (userRole.equals("관리자")) {
			return true;
		}
		if (userRole.equals("발주계획") && (requestURI.startsWith("/product") || requestURI.startsWith("/estimate")
				|| requestURI.startsWith("/contract") || requestURI.startsWith("/procurmentPlan")
				|| requestURI.startsWith("/procurementPlanRegistration"))) {
			return true;
		}
		if (userRole.equals("구매발주") && (requestURI.startsWith("/purchaseOrder") || requestURI.startsWith("/progressInspection")
				|| requestURI.startsWith("/shippingStatus"))) {
			return true;
		}
		if (userRole.equals("자재출고") && (requestURI.startsWith("/inventoryList"))) {
			return true;
		}

		

		return false; // 기본적으로 접근 거부
	}

//  예외가 발생하지 않은 경우에만 Controller가 작업이 끝나면 호출되는 메소드  
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

//  예외 발생여부에 상관없이 Controller가 작업이 끝나면 호출되는 메소드
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
