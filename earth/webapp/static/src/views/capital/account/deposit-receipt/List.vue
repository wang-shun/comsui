<template>
	<div class="content">
		<div class="scroller">
			<div class="query-area">
				<el-form class="sdf-form sdf-query-form" :inline="true">
					<el-form-item>
                        <list-cascader
                            clearable
                            size="small"
                            :collection="financialContractQueryModels"
                            v-model="queryConds.financialContractUuids"
                            :placeholder="$utils.locale('financialContract')">
                        </list-cascader>
					</el-form-item>
					<el-form-item>
						<el-select 
							v-model="queryConds.sourceDocumentStatus" 
							name="sourceDocumentStatus"
							placeholder="充值状态" 
							clearable 
							size="small">
							<el-option
								v-for="(value,label) in sourceDocumentStatusList"
								:label="value"
								:value="label">
							</el-option>
						</el-select>
					</el-form-item>
					<el-form-item>
						<el-select
							v-model="queryConds.customerType"
							name="customerType"
							size="small"
							clearable 
							placeholder="客户类型">
							<el-option
								v-for="item in customerTypeList"
								:label="item.value"
								:value="item.key">
							</el-option>
						</el-select>
					</el-form-item>
					<el-form-item>
						<el-col :span="11">
							<el-form-item>
								<DateTimePicker
									v-model="queryConds.startDate"
									name="startDate"
									pickTime="true"
									formatToMinimum="true"
									:end-date="queryConds.endDate"
									placeholder="创建起始日期"
									size="small">
								</DateTimePicker>
							</el-form-item>
						</el-col>
						<el-col :span="2">
							<div class="text-align-center color-dim">至</div>
						</el-col>
						<el-col :span="11">
							<el-form-item>
								<DateTimePicker
									v-model="queryConds.endDate"
									name="endDate"
									pickTime="true"
									formatToMaximum="true"
									:start-date="queryConds.startDate"
									placeholder="创建终止日期"
									size="small">
								</DateTimePicker>
							</el-form-item>
						</el-col>
					</el-form-item>
					<el-form-item>
						<span class="item vertical-line"></span>
					</el-form-item>
					<el-form-item>
						<ComboQueryBox v-model="comboConds">
							<el-option label="账户名称" value="firstPartyName"></el-option>
							<el-option label="账户编号" value="virtualAccountNo"></el-option>
							<el-option label="充值金额" value="amount"></el-option>
							<el-option label="充值单号" value="sourceDocumentNo"></el-option>
						</ComboQueryBox>
					</el-form-item>
					<el-form-item>
						<el-button ref="lookup" size="small" type="primary">查询</el-button>
					</el-form-item>
				</el-form>
			</div>
			<div class="table-area">
				<el-table
					class="no-table-bottom-border"
					stripe
					@sort-change="onSortChange"
					v-loading="dataSource.fetching"
					:data="dataSource.list">
					<el-table-column 
						prop="virtualAccountFlowNo" 
						inline-template
						label="充值单号">
						<a :href="`${ctx}#/capital/account/deposit-receipt/${ row.sourceDocumentUuid }/detail`">{{ row.sourceDocumentNo }}</a>
					</el-table-column>
					<el-table-column 
						inline-template 
						label="账户编号">
						<a :href="`${ctx}#/capital/account/virtual-acctount/${ row.virtualAccountUuid }/detail`">{{ row.virtualAccountNo }}</a>
					</el-table-column>
					<el-table-column prop="virtualAccountName" label="账户名称">
					</el-table-column>
					<el-table-column label="客户类型" prop="customerTypeName">
					</el-table-column>
					<el-table-column 
						inline-template
						label="贷款合同编号">
						<a :href="`${ctx}#/data/contracts/detail?id=${ row.contractId }`">{{ row.contractNo }}</a>
					</el-table-column>
					<el-table-column 
						inline-template 
						:label="$utils.locale('financialContract.no')">
						<a :href="`${ctx}#/financial/contract/${ row.financialContractUuid }/detail`">{{ row.financialContractNo }}</a>
					</el-table-column>
					<el-table-column 
						inline-template 
						label="创建时间"
						prop="createTime"
						sortable="custom">
						<div>{{ row.createTime | formatDate('yyyy-MM-dd HH:mm:ss') }}</div>
					</el-table-column>
					<el-table-column 
						inline-template 
						label="充值金额"
						prop="bookingAmount"
						sortable="custom">
						<div>{{ row.bookingAmount | formatMoney }}</div>
					</el-table-column>
					<el-table-column prop="summary" label="备注">
					</el-table-column>
					<el-table-column 
						inline-template 
						label="机构流水">
						<a :href="`${ctx}#/capital/special-account/cash-flow-audit?hostAccountNo=${ row.accountNo }&cashFlowNo=${ row.institutions }`">{{ row.institutions }}</a>
					</el-table-column>
					<el-table-column 
						inline-template 
						label="状态">
						<div>
							<span v-if="row.sourceDocumentStatusName == '充值撤销'" class="color-danger">{{ row.sourceDocumentStatusName }}</span>
							<span v-else>{{ row.sourceDocumentStatusName }}</span>
						</div>
					</el-table-column>
					<el-table-column 
						inline-template 
						label="操作">
		                	<a v-if="ifElementGranted('disable-deposit-receipt') && row.sourceDocumentStatusName != '充值撤销'" @click="onClickRevoke(row)">
		                		作废
		                	</a>
					</el-table-column>
				</el-table>
			</div>
		</div>
		<div class="operations">
			<div class="pull-right">
				<PageControl 
	                v-model="pageConds.pageIndex"
	                :size="dataSource.size"
	                :per-page-record-number="pageConds.perPageRecordNumber">
	            </PageControl>
			</div>
		</div>
		<EditRevokeModal
			:source-document-uuid="revokeModal.sourceDocumentUuid"
			:model="revokeModal.model"
			v-model="revokeModal.show"
			@submit="submitRevoke">
        </EditRevokeModal>
	</div>

</template>

<script>
	import Pagination from 'mixins/Pagination';
	import ListPage from 'mixins/ListPage';
	import { ajaxPromise } from 'assets/javascripts/util';
	import MessageBox from 'components/MessageBox';
	import EditRevokeModal from './EditRevokeModal';

	export default {
		mixins: [Pagination, ListPage],
		components: { 
			ComboQueryBox: require('views/include/ComboQueryBox'),
			EditRevokeModal
		},
		data: function() {
			return {
				action: '/capital/customer-account-manage/deposit-receipt-list/query',
				pageConds: {
					perPageRecordNumber: 12,
					pageIndex: 1
				},
				queryConds: {
					financialContractUuids: [],
					sourceDocumentStatus: '',
					customerType: '',
					endDate: '',
					startDate: ''
				},
				comboConds: {
					firstPartyName: '',
					virtualAccountNo: '',
					amount: '',
					sourceDocumentNo:''
				},
				sortConds: {
					sortField: '',
					isAsc: ''
				},
				financialContractQueryModels: [],
				sourceDocumentStatusList:[],
				customerTypeList:[],

				fetching: false,
				revokeModal: {
					show: false,
					model: {},
					sourceDocumentUuid: '',
				},
			};
		},
		methods: {
			initialize: function() {
				return ajaxPromise({
					url: `/capital/customer-account-manage/deposit-receipt-list/show/options`
				}).then(data => {	
					this.sourceDocumentStatusList = data.sourceDocumentStatusList || [];
					this.customerTypeList = data.customerTypeList || [];
					this.financialContractQueryModels = data.queryAppModels || [];
				}).catch(message => {
					MessageBox.open(message);
				});
			},
			onClickRevoke: function(row) {
				this.revokeModal.show = true;
				this.revokeModal.model = {
					sourceDocumentNo: row.sourceDocumentNo,
		        	sourceDocumentOfRevokeNo: '',
		            summaryRevoke: '',
		            virtualAccountName: row.virtualAccountName,
		            virtualAccountNo: row.virtualAccountNo,
		            bookingAmount: row.bookingAmount
				}
				this.revokeModal.sourceDocumentUuid = row.sourceDocumentUuid;
			},
			submitRevoke: function() {
				this.fetch();
			}
		}
	}
</script>