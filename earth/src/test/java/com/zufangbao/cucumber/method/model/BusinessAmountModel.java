package com.zufangbao.cucumber.method.model;

import java.math.BigDecimal;

/**
 * Created by dzz on 17-5-22.
 */
public class BusinessAmountModel {
    /**
     *费用类型
     * */
    private Long feeType;
    /**
     * 金额
     * */
    private BigDecimal actualAmount;


    public Long getFeeType() {
        return feeType;
    }

    public void setFeeType(Long feeType) {
        this.feeType = feeType;
    }

    public BigDecimal getActualAmount() {
        return actualAmount;
    }

    public void setActualAmount(BigDecimal actualAmount) {
        this.actualAmount = actualAmount;
    }
}
