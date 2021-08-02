package com.bookforyou.bk4u.order.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.common.template.Pagination;
import com.bookforyou.bk4u.member.model.vo.Member;
import com.bookforyou.bk4u.order.model.service.OrderService;
import com.bookforyou.bk4u.order.model.vo.Order;
import com.bookforyou.bk4u.order.model.vo.OrderDetail;
import com.bookforyou.bk4u.payment.model.vo.Payment;

@Controller
public class OrderController {

	@Autowired
	private OrderService oService;
	
	/**
	 * [관리자] 전체 주문 목록 조회 (한진)
	 */
	@RequestMapping("adminOrderList.or")
	public ModelAndView adminOrderList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage,
										@RequestParam(value="orStatus", defaultValue="0") String orStatus,
										@RequestParam(value="array", defaultValue="0") String array){
		
		HashMap<String, String> filter = new HashMap<>();
		filter.put("orStatus", orStatus);
		filter.put("array", array);
		
		int listCount = oService.selectAllListCount();
		
		PageInfo pi = null;

		int selectConfirmCnt = oService.selectConfirmCnt();
		int selectProductReadyCnt = oService.selectProductReadyCnt();
		int selectDeliveryReadyCnt = oService.selectDeliveryReadyCnt();
		int selectDeliveryCnt = oService.selectDeliveryCnt();
		int selectFinish = oService.selectFinishCnt();
		
		mv.setViewName("order/adminOrderList");
		
		if(orStatus.equals("0")) {
			pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			mv.setViewName("order/adminOrderList");
		}else {
			if(orStatus.equals("1")) {
				pi = Pagination.getPageInfo(selectConfirmCnt, currentPage, 10, 5);
				mv.setViewName("order/adminOrderConfirm");
			}else if(orStatus.equals("2")) {
				pi = Pagination.getPageInfo(selectProductReadyCnt, currentPage, 10, 5);
				mv.setViewName("order/adminProductReady");
			}else if(orStatus.equals("3")) {
				pi = Pagination.getPageInfo(selectDeliveryReadyCnt, currentPage, 10, 5);
				mv.setViewName("order/adminDeliveryReady");
			}else if(orStatus.equals("4")){
				pi = Pagination.getPageInfo(selectDeliveryCnt, currentPage, 10, 5);
				mv.setViewName("order/adminDeliveryIng");
			}else if(orStatus.equals("5")){
				pi = Pagination.getPageInfo(selectFinish, currentPage, 10, 5);
				mv.setViewName("order/adminComplete");
			}else {
				mv.setViewName("order/adminOrderList");
			}
		}
		
		ArrayList<Order> oList = (ArrayList)oService.selectAdminOrderList(pi, filter);
		
		mv.addObject("pi", pi)
		  .addObject("oList", oList)
		  .addObject("orStatus", orStatus)
		  .addObject("ar", array)
		  .addObject("listCount", listCount)
		  .addObject("confirmCnt", selectConfirmCnt)
		  .addObject("productReadyCnt", selectProductReadyCnt)
		  .addObject("deliveryReadyCnt", selectDeliveryReadyCnt)
		  .addObject("deliveryCnt", selectDeliveryCnt)
		  .addObject("finishCnt", selectFinish);
		
		return mv;
	}
	
	/*
	 * [사용자] 도서 결제 결과 페이지 (연지)
	 */
	@RequestMapping("result.bk")
	public ModelAndView resultPayment(ModelAndView mv, int orderNo) {

		Order od = oService.selectOrder(orderNo);
		ArrayList<Order> oList = oService.selectOrderList(orderNo);
		
		mv.addObject("od", od)
		  .addObject("oList", oList)
		  .setViewName("order/orderResultView");
		
		return mv;
	}
	
	/**
	 * [관리자] 검색 조건에 일치하는 주문 목록 조회 (한진)
	 */
	@RequestMapping("adminOListSearch.or")
	public ModelAndView adminOListSearch(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage,
										String condition, String keyword,
										@RequestParam(value="orStatus", defaultValue="0") String orStatus,
										@RequestParam(value="array", defaultValue="0") String array) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("orStatus", orStatus);
		map.put("array", array);
		
		int conListCount = oService.selectAdminOListSearchCount(map);
		
		int listCount = oService.selectAllListCount();

		PageInfo pi = null;

		int selectConfirmCnt = oService.selectConfirmCnt();
		int selectProductReadyCnt = oService.selectProductReadyCnt();
		int selectDeliveryReadyCnt = oService.selectDeliveryReadyCnt();
		int selectDeliveryCnt = oService.selectDeliveryCnt();
		int selectFinish = oService.selectFinishCnt();
		
		mv.setViewName("order/adminOrderList");
		
		if(orStatus.equals("0")) {
			pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			mv.setViewName("order/adminOrderList");
		}else {
			if(orStatus.equals("1")) {
				pi = Pagination.getPageInfo(selectConfirmCnt, currentPage, 10, 5);
				mv.setViewName("order/adminOrderConfirm");
			}else if(orStatus.equals("2")) {
				pi = Pagination.getPageInfo(selectProductReadyCnt, currentPage, 10, 5);
				mv.setViewName("order/adminProductReady");
			}else if(orStatus.equals("3")) {
				pi = Pagination.getPageInfo(selectDeliveryReadyCnt, currentPage, 10, 5);
				mv.setViewName("order/adminDeliveryReady");
			}else if(orStatus.equals("4")){
				pi = Pagination.getPageInfo(selectDeliveryCnt, currentPage, 10, 5);
				mv.setViewName("order/adminDeliveryIng");
			}else if(orStatus.equals("5")){
				pi = Pagination.getPageInfo(selectFinish, currentPage, 10, 5);
				mv.setViewName("order/adminComplete");
			}else {
				mv.setViewName("order/adminOrderList");
			}
		}
		
		ArrayList<Order> oList = oService.selectAdminOrderSearchList(pi, map);
		
		mv.addObject("pi", pi)
		  .addObject("oList", oList)
		  .addObject("conListCount", conListCount)
		  .addObject("listCount", listCount)
		  .addObject("confirmCnt", selectConfirmCnt)
		  .addObject("productReadyCnt", selectProductReadyCnt)
		  .addObject("deliveryReadyCnt", selectDeliveryReadyCnt)
		  .addObject("deliveryCnt", selectDeliveryCnt)
		  .addObject("finishCnt", selectFinish)
		  .addObject("condition", condition)
		  .addObject("keyword", keyword)
		  .addObject("ar", array)
		  .addObject("orStatus", orStatus);
		
		return mv;
	}
	
	/**
	 * [관리자] 관리자 메모 등록/수정 (한진) 
	 */
	@RequestMapping("updateAdminMemo.or")
	public String updateAdminMemo(String orderNo, String adminMemoContent) {
		HashMap<String, String> map = new HashMap<>();
		map.put("orderNo", orderNo);
		map.put("memoContent", adminMemoContent);
		
		int result = oService.updateAdminMemo(map);
		
		return "redirect:/adminOrderList.or";
	}
	
	/**
	 * [관리자] 관리자 메모 삭제 (한진)
	 */
	@RequestMapping("deleteAdminMemo.or")
	public String deleteAdminMemo(String orderNo) {
		int result = oService.deleteAdminMemo(orderNo);
		
		return "redirect:/adminOrderList.or";
	}
	
	/**
	 * [관리자] 주문 상세 조회 (한진)
	 */
	@ResponseBody
	@RequestMapping("adminOrderDetail.or")
	public ModelAndView selectAdminOrderDetail(ModelAndView mv, int orderNo) {
		
		ArrayList<Order> order = oService.selectAdminOrderDetail(orderNo);
		ArrayList<OrderDetail> oBook = oService.selectAdminOrderedBook(orderNo);
		Member m = oService.selectAdminOrderedMem(orderNo);
		Payment p = oService.selectAdminOrderedPayment(orderNo);
		
		System.out.println(order);
		
		mv.addObject("od", order)
		  .addObject("oBook", oBook)
		  .addObject("oMem", m)
		  .addObject("oPay", p)
		  .setViewName("order/adminOrderDetail");
		
		return mv;
		
	}
	
	
	
}
