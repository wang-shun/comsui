
@Prepayment6
Feature: 校验第三方本端多凭证校验是否能执行,two same request and first outtime

Scenario Outline: 校验第三方本端多凭证校验是否能执行,two same request and first outtime
  Given 有一个放款计划，对应有三期还款计划six
  And 有一期还款计划到期了,还款人去第三方机构还款，并且产生一个第三方凭证,but outtimesix
  When ten mintues,again产生一个第三方凭证six
Then 校验应该自动进行，并且返回记录six

Examples:
         |activeStatus              |executingStatus|
         |AssetSetActiveStatus.OPEN |ExecutingStatus.PROCESSING|