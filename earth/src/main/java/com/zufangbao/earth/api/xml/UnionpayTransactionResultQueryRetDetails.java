package com.zufangbao.earth.api.xml;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.thoughtworks.xstream.annotations.XStreamImplicit;

import java.util.List;


@XStreamAlias("RET_DETAILS")
public class UnionpayTransactionResultQueryRetDetails {
	
	@XStreamImplicit(itemFieldName = "RET_DETAIL")
	private List<UnionpayTransactionResultQueryRetDetail> retDetailList;

	public List<UnionpayTransactionResultQueryRetDetail> getRetDetailList() {
		return retDetailList;
	}

	public void setRetDetailList(List<UnionpayTransactionResultQueryRetDetail> retDetailList) {
		this.retDetailList = retDetailList;
	}

	public UnionpayTransactionResultQueryRetDetails() {
		super();
	}
	
}
