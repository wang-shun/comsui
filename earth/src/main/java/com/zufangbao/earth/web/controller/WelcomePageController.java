package com.zufangbao.earth.web.controller;

import com.alibaba.fastjson.serializer.SerializerFeature;
import com.demo2do.core.utils.JsonUtils;
import com.demo2do.core.web.resolver.Secure;
import com.zufangbao.earth.yunxin.handler.FinancialContracCacheHandler;
import com.zufangbao.sun.entity.security.Principal;
import com.zufangbao.sun.yunxin.entity.model.vo.welcom.RemittanceDataStatistic;
import com.zufangbao.sun.yunxin.entity.model.vo.welcom.RepaymentDataStatistic;
import com.zufangbao.sun.yunxin.handler.DataStatHandler;
import com.zufangbao.wellsfargo.yunxin.handler.DataStatisticsCacheHandler;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("welcome")
public class WelcomePageController extends BaseController {

	@Autowired
	private DataStatHandler dataStatisticHandler;
	@Autowired
	private DataStatisticsCacheHandler dataStatisticsCacheHandler;
	@Autowired
	private FinancialContracCacheHandler financialContracCacheHandler;
	@RequestMapping("")
	public String welcome(@Secure Principal principal){
		try {
			//TODO evict in financial manage page;
			financialContracCacheHandler.cacheEvict(principal.getId());
			return "welcome";
		} catch (Exception e){
			e.printStackTrace();
			return "error";
		}
	}
	
	@RequestMapping(value="count", params={"type=repayment"})
	public ModelAndView countRepaymentData(@Secure Principal principal,
			@RequestParam("financialContractIds") String financialContractIdsJson){
		try {
			List<Long> financialContractIds = JsonUtils.parseArray(financialContractIdsJson,Long.class);
			Map<String,Object> params = new HashMap<String,Object>();
			RepaymentDataStatistic repaymentData = new RepaymentDataStatistic();
			if(!CollectionUtils.isEmpty(financialContractIds)){
				repaymentData = dataStatisticsCacheHandler.getRepaymentDataFromOrRefreshCache(financialContractIds);
			}
			params.put("repaymentData", repaymentData);
			params.put("financialContractIds", financialContractIds);
			return pageViewResolver.pageSpec("dashboard/dashboard-repayment",params);
		} catch(Exception e){
			e.printStackTrace();
			return pageViewResolver.errorModalSpec("系统错误");
		}
	}
	
	@RequestMapping(value="count", params={"type=remittance"})
	public ModelAndView countRemittanceData(@Secure Principal principal,
			@RequestParam("financialContractIds") String financialContractIdsJson){
		try {
			List<Long> financialContractIds = JsonUtils.parseArray(financialContractIdsJson,Long.class);
			Map<String,Object> params = new HashMap<String,Object>();
			RemittanceDataStatistic remittanceData = new RemittanceDataStatistic();
			if(!CollectionUtils.isEmpty(financialContractIds)){
				remittanceData = dataStatisticsCacheHandler.getRemittanceDataFromOrRefreshCache(financialContractIds);
			}
			params.put("remittanceData", remittanceData);
			params.put("financialContractIds", financialContractIds);
			return pageViewResolver.pageSpec("dashboard/dashboard-remittance",params);
		} catch(Exception e){
			e.printStackTrace();
			return pageViewResolver.errorModalSpec("系统错误");
		}
	}
	
	// 上面的count接口之后要删掉
	@RequestMapping(value="statistics", params={"type=repayment"})
	public @ResponseBody String countRepayment(@Secure Principal principal,
			@RequestParam("financialContractIds") String financialContractIdsJson){
		try {
			List<Long> financialContractIds = JsonUtils.parseArray(financialContractIdsJson,Long.class);
			Map<String,Object> params = new HashMap<String,Object>();
			RepaymentDataStatistic repaymentData = new RepaymentDataStatistic();
			if(!CollectionUtils.isEmpty(financialContractIds)){
				repaymentData = dataStatisticsCacheHandler.getRepaymentDataFromOrRefreshCache(financialContractIds);
			}
			params.put("repaymentData", repaymentData);
			params.put("financialContractIds", financialContractIds);
			return jsonViewResolver.sucJsonResult(params,SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteDateUseDateFormat);
		} catch (Exception e) {
			e.printStackTrace();
			return jsonViewResolver.errorJsonResult("还款统计失败！！！");
		}
	}
	
	@RequestMapping(value="statistics", params={"type=remittance"})
	public @ResponseBody String countRemittance(@Secure Principal principal,
			@RequestParam("financialContractIds") String financialContractIdsJson){
		try {
			List<Long> financialContractIds = JsonUtils.parseArray(financialContractIdsJson,Long.class);
			Map<String,Object> params = new HashMap<String,Object>();
			RemittanceDataStatistic remittanceData = new RemittanceDataStatistic();
			if(!CollectionUtils.isEmpty(financialContractIds)){
				remittanceData = dataStatisticsCacheHandler.getRemittanceDataFromOrRefreshCache(financialContractIds);
			}
			params.put("remittanceData", remittanceData);
			params.put("financialContractIds", financialContractIds);
			return jsonViewResolver.sucJsonResult(params,SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteDateUseDateFormat);
		} catch (Exception e) {
			e.printStackTrace();
			return jsonViewResolver.errorJsonResult("放款统计失败！！！");
		}
	}
	
}
