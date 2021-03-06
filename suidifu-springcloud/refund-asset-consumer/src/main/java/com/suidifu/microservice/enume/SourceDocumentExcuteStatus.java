package com.suidifu.microservice.enume;

import com.zufangbao.sun.BasicEnum;

/**
 * 收款单类型
 * @author louguanyang
 *
 */
public enum SourceDocumentExcuteStatus implements BasicEnum {
	/** 未执行 */
	PREPARE("enum.source-document-excute-status.prepare"),
	/** 执行中 */
	DOING("enum.source-document-excute-status.doing"),
	/** 执行结束 */
	DONE("enum.source-document-excute-status.done");
	
	private String key;

	SourceDocumentExcuteStatus(String key) {
		this.key = key;
	}

	public String getKey() {
		return key;
	}
	
}
