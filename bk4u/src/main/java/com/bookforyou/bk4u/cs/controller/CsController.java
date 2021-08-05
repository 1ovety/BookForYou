package com.bookforyou.bk4u.cs.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.common.template.Pagination;
import com.bookforyou.bk4u.couponDetail.model.vo.CouponDetail;
import com.bookforyou.bk4u.cs.model.service.CsService;
import com.bookforyou.bk4u.cs.model.vo.Cancel;
import com.bookforyou.bk4u.cs.model.vo.Refund;
import com.bookforyou.bk4u.cs.model.vo.Return;
import com.bookforyou.bk4u.member.model.vo.Member;
import com.bookforyou.bk4u.order.model.service.OrderService;
import com.bookforyou.bk4u.order.model.vo.Order;
import com.bookforyou.bk4u.order.model.vo.OrderDetail;
import com.bookforyou.bk4u.payment.model.vo.Payment;

@Controller
public class CsController {

	@Autowired
	private CsService cService;
	
	@Autowired
	private OrderService odService;
	
	/**
	 * [관리자] '주문취소', '반품', '환불' 목록 조회 (한진)
	 */
	@RequestMapping("adminCSList.cs")
	public ModelAndView selectAdminCsList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage,
											@RequestParam(value="cStatus") String cStatus,
											@RequestParam(value="array", defaultValue="0") String array) {
		
		HashMap<String, String> filter = new HashMap<>();
		filter.put("array", array);
		
		int cancelCount = cService.selectAdminCancelCount();
		int returnCount = cService.selectAdminReturnCount();
		int refundCount = cService.selectAdminRefundCount();
		
		PageInfo pi = null;
		
		if(cStatus.equals("1")) {
			pi = Pagination.getPageInfo(cancelCount, currentPage, 10, 5);
			ArrayList<Cancel> cList = (ArrayList)cService.selectAdminCancelList(pi, filter);
			mv.addObject("cList", cList)
			  .setViewName("cs/adminCancel");
		}else if(cStatus.equals("2")) {
			pi = Pagination.getPageInfo(returnCount, currentPage, 10, 5);
			ArrayList<Return> rtList = (ArrayList)cService.selectAdminReturnList(pi, filter);
			mv.addObject("rtList", rtList)
			  .setViewName("cs/adminReturn");
		}else if(cStatus.equals("3")) {
			pi = Pagination.getPageInfo(refundCount, currentPage, 10, 5);
			ArrayList<Refund> rfList = (ArrayList)cService.selectAdminRefundList(pi, filter);
			mv.addObject("rfList", rfList)
			  .setViewName("cs/adminRefund");
		}
		
		mv.addObject("pi", pi)
		  .addObject("ar", array)
		  .addObject("cStatus", cStatus)
		  .addObject("cancelCount", cancelCount)
		  .addObject("returnCount", returnCount)
		  .addObject("refundCount", refundCount);
		
		return mv;
		
	}
	
	/**
	 * [관리자] 검색조건에 일치하는 CS목록 조회 (한진)
	 */
	@RequestMapping("adminCsListSearch.cs")
	public ModelAndView adminCsSearch(ModelAndView mv, String condition, String keyword,
										@RequestParam(value="currentPage", defaultValue="1") int currentPage,
										@RequestParam(value="array", defaultValue="0") String array,
										@RequestParam(value="cStatus") String cStatus) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("cStatus", cStatus);
		map.put("array", array);
		
		int conListCount = cService.selectAdminSearchCount(map);
		
		PageInfo pi = null;
		
		int cancelCount = cService.selectAdminCancelCount();
		int returnCount = cService.selectAdminReturnCount();
		int refundCount = cService.selectAdminRefundCount();
		
		if(cStatus.equals("1")) {
			pi = Pagination.getPageInfo(conListCount, currentPage, 10, 5);
			ArrayList<Cancel> cList = (ArrayList)cService.selectAdminSearchCancelList(pi, map);
			mv.addObject("cList", cList)
			  .setViewName("cs/adminCancel");
		}else if(cStatus.equals("2")) {
			pi = Pagination.getPageInfo(conListCount, currentPage, 10, 5);
			ArrayList<Return> rtList = (ArrayList)cService.selectAdminSearchReturnList(pi, map);
			mv.addObject("rtList", rtList)
			  .setViewName("cs/adminReturn");
		}else if(cStatus.equals("3")) {
			pi = Pagination.getPageInfo(conListCount, currentPage, 10, 5);
			ArrayList<Refund> rfList = (ArrayList)cService.selectAdminSearchRefundList(pi, map);
			mv.addObject("rfList", rfList)
			  .setViewName("cs/adminRefund");
		}
		
		mv.addObject("pi", pi)
		  .addObject("ar", array)
		  .addObject("cStatus", cStatus)
		  .addObject("conListCount", conListCount)
		  .addObject("cancelCount", cancelCount)
		  .addObject("returnCount", returnCount)
		  .addObject("refundCount", refundCount);
		
		return mv;
	}
	
	/**
	 * [관리자] 주문취소 상세 조회 (한진)
	 */
	@RequestMapping("adminCancelDatail.cs")
	public ModelAndView selectAdminCancelDetail(ModelAndView mv, int cancelNo, int orderNo, int no) {
		
		
		Cancel c = cService.selectAdminCancelDetail(cancelNo);
		Order o = odService.selectAdminOrderDetail(orderNo);
		ArrayList<OrderDetail> od = odService.selectAdminOrderedBook(orderNo);
		Payment p = odService.selectAdminOrderedPayment(orderNo);
		Member m = odService.selectAdminOrderedMem(orderNo);
		CouponDetail cd = odService.selectAdminOrderedUsedCoupon(orderNo);
		
		mv.addObject("c", c)
		  .addObject("o", o)
		  .addObject("od", od)
		  .addObject("p", p)
		  .addObject("m", m)
		  .addObject("cd", cd);
		
		if(no == 1) {
			mv.setViewName("cs/adminCancelDetail");
		}else if(no == 2) {
			mv.setViewName("cs/adminCancelProcess");
		}
		
		return mv;
		
	}
	
	/**
	 * [관리자] 주문 취소 처리 (한진)
	*/
	@RequestMapping("adminCancel.cs")
	public String updateAdminCancel(ModelAndView mv, int cancelNo, int orderNo, int no) {
		
		HashMap<String, Integer> map = new HashMap<>();
		map.put("orderNo", orderNo);
		map.put("no", 1);
		int orderResult = cService.updateAdminCsOrderStatus(map);
		int cancelResult = cService.updateAdminCancelStatus(cancelNo);
		
		if(cancelResult > 0) {
			mv.addObject("alertMsg", "주문이 취소되었습니다.");
			return "redirect:/adminCancelDetail.cs?calcelNo=" + cancelNo + "&orderNo=" + orderNo + "&no=1";
		}else {
			mv.addObject("errorMsg", "주문 취소 처리 실패");
			return "redirect:/adminCancelDetail.cs?cancelNo=" + cancelNo + "&orderNo=" + orderNo + "&no=2";
		}
	}
	 
	/**
	 * [관리자] 반품 상세 조회 (한진)
	 */
	@RequestMapping("adminReturnDetail.cs")
	public ModelAndView selectAdminReturnDetail(ModelAndView mv, int returnNo, int orderNo, int no) {
		
		Return r = cService.selectAdminReturnDetail(returnNo);
		Order o = odService.selectAdminOrderDetail(orderNo);
		ArrayList<OrderDetail> od = odService.selectAdminOrderedBook(orderNo);
		Payment p = odService.selectAdminOrderedPayment(orderNo);
		Member m = odService.selectAdminOrderedMem(orderNo);
		CouponDetail cd = odService.selectAdminOrderedUsedCoupon(orderNo);
		
		mv.addObject("r", r)
		  .addObject("o", o)
		  .addObject("od", od)
		  .addObject("p", p)
		  .addObject("m", m)
		  .addObject("cd", cd);
		
		if(no == 1) {
			mv.setViewName("cs/adminReturnDetail");
		}else if(no == 2) {
			mv.setViewName("cs/adminReturnProcess");
		}
		
		return mv;
	}
	
	/**
	 * [관리자] 반품 처리 (한진)
	 */
	@RequestMapping("adminReturn.cs")
	public String updateAdminReturn(ModelAndView mv, int returnNo, int orderNo, int no, int rtStatus) {
		
		HashMap<String, Integer> map = new HashMap<>();
		map.put("orderNo", orderNo);
		map.put("no", 2);
		map.put("rtStatus", rtStatus);
		
		HashMap<String, Integer> map2 = new HashMap<>();
		map2.put("returnNo", returnNo);
		map2.put("rtStatus", rtStatus);
		
		int orderResult = cService.updateAdminCsOrderStatus(map);
		int returnResult = cService.updateAdminReturnStatus(map2);
		
		if(returnResult > 0) {
			mv.addObject("alertMsg", "'반품처리중'으로 변경되었습니다.");
			return "redirect:/adminReturnDetail.cs?returnNo=" + returnNo + "&orderNo=" + orderNo + "&no=1";
		}else {
			mv.addObject("errorMsg", "'반품처리중'변경 실패");
			return "redirect:/adminReturnDetail.cs?returnNo=" + returnNo + "&orderNo=" + orderNo + "&no=1";
		}
		
	}
}
