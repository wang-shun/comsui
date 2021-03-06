package com.zufangbao.testAPIWuBo.testAPI.models;

import java.math.BigDecimal;

import com.zufangbao.sun.api.model.modify.OverdueChargesModifyModelParameter;
import com.zufangbao.sun.utils.ObjectAttributeValidator;

public class ModifyOverDueFeeDetail {
	
    private String contractUniqueId;
	
	private String repaymentPlanNo;
	private String repayScheduleNo;
	
	private String overDueFeeCalcDate;

	@ObjectAttributeValidator(value="BigDecimal")
    private String penaltyFee;
	@ObjectAttributeValidator(value="BigDecimal")
	private String latePenalty;
	@ObjectAttributeValidator(value="BigDecimal")
	private String lateFee;
	@ObjectAttributeValidator(value="BigDecimal")
	private String lateOtherCost;
	@ObjectAttributeValidator(value="BigDecimal")
	private String totalOverdueFee;

	public String getContractUniqueId() {
		return contractUniqueId;
	}

	public void setContractUniqueId(String contractUniqueId) {
		this.contractUniqueId = contractUniqueId;
	}

	public String getRepaymentPlanNo() {
		return repaymentPlanNo;
	}

	public void setRepaymentPlanNo(String repaymentPlanNo) {
		this.repaymentPlanNo = repaymentPlanNo;
	}

	public String getOverDueFeeCalcDate() {
		return overDueFeeCalcDate;
	}

	public void setOverDueFeeCalcDate(String overDueFeeCalcDate) {
		this.overDueFeeCalcDate = overDueFeeCalcDate;
	}

	public String getPenaltyFee() {
		return penaltyFee;
	}

	public void setPenaltyFee(String penaltyFee) {
		this.penaltyFee = penaltyFee;
	}

	public String getLatePenalty() {
		return latePenalty;
	}

	public void setLatePenalty(String latePenalty) {
		this.latePenalty = latePenalty;
	}

	public String getLateFee() {
		return lateFee;
	}

	public void setLateFee(String lateFee) {
		this.lateFee = lateFee;
	}

	public String getLateOtherCost() {
		return lateOtherCost;
	}

	public void setLateOtherCost(String lateOtherCost) {
		this.lateOtherCost = lateOtherCost;
	}

	public String getTotalOverdueFee() {
		return totalOverdueFee;
	}

	public void setTotalOverdueFee(String totalOverdueFee) {
		this.totalOverdueFee = totalOverdueFee;
	}

	public BigDecimal calcTotalAmount(){
		return new BigDecimal(this.penaltyFee).add(new BigDecimal(this.latePenalty)).add(new BigDecimal(this.lateOtherCost)).add(new BigDecimal(this.lateFee));
	}

	public String getRepayScheduleNo() {
		return repayScheduleNo;
	}

	public void setRepayScheduleNo(String repayScheduleNo) {
		this.repayScheduleNo = repayScheduleNo;
	}

	public OverdueChargesModifyModelParameter convertToOverdueChargesModifyModelParameter(){
		OverdueChargesModifyModelParameter overdueChargesModifyModelParameter = new OverdueChargesModifyModelParameter();
		overdueChargesModifyModelParameter.setRepaymentPlanNo(this.repaymentPlanNo);
		overdueChargesModifyModelParameter.setOverDueFeeCalcDate(this.overDueFeeCalcDate);
		overdueChargesModifyModelParameter.setOverdueFeeObligation(new BigDecimal(this.latePenalty));
		overdueChargesModifyModelParameter.setOverdueFeeOther(new BigDecimal(this.lateOtherCost));
		overdueChargesModifyModelParameter.setOverdueFeePenalty(new BigDecimal(this.penaltyFee));
		overdueChargesModifyModelParameter.setOverdueFeeService(new BigDecimal(this.lateFee));
		return overdueChargesModifyModelParameter;
	};

	
	 
}
