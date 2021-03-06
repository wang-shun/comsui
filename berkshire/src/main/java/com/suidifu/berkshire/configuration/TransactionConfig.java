package com.suidifu.berkshire.configuration;

import java.io.IOException;
import java.util.Properties;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.springframework.aop.framework.autoproxy.BeanNameAutoProxyCreator;
import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.cache.CacheManager;
import org.springframework.cache.ehcache.EhCacheManagerFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.ClassPathResource;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.interceptor.TransactionInterceptor;

import com.demo2do.core.persistence.GenericDaoSupport;
import com.demo2do.core.persistence.GenericJdbcSupport;
import com.demo2do.core.persistence.SmartNamingStrategy;
import com.suidifu.matryoshka.delayPosition.handler.DelayProcessingTaskCacheHandler;
import com.suidifu.matryoshka.delayPosition.handler.DelayTaskConfigCacheHandler;
import com.suidifu.matryoshka.delayPosition.handler.impl.DelayProcessingTaskCacheHandlerImpl;
import com.suidifu.matryoshka.delayPosition.handler.impl.DelayTaskConfigCacheHandlerImpl;
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import com.zufangbao.gluon.opensdk.AesUtil;
import com.zufangbao.sun.ledgerbook.BankAccountCache;
import com.zufangbao.sun.ledgerbookv2.service.impl.CacheableInsideAccountServiceImpl;
import com.zufangbao.wellsfargo.notify.RepaymentOrdeForEasyPayrNotifyServer;
import com.zufangbao.wellsfargo.notify.RepaymentOrderForEasyPayNotifyResultListener;
import com.zufangbao.wellsfargo.yunxin.handler.impl.DataStatisticsCacheHandlerImpl;
import com.zufangbao.wellsfargo.yunxin.handler.impl.RepaymentOrderActualHandlerImpl;
import com.zufangbao.wellsfargo.yunxin.handler.impl.RepaymentOrderReconciliationNoSessionImpl;
import com.suidifu.swift.notifyserver.notifyserver.mq.config.RabbitMqConnectionConfig;
import com.suidifu.berkshire.mq.rpc.proxy.RpcHandlerProxy;

/**
 * 数据库事物相关配置
 * 
 * @author lisf
 *
 */
@Configuration
@EnableTransactionManagement
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class TransactionConfig {

	@Resource(name = "cfg_datasource")
	private HikariConfig hikariConfig;
	
	@Resource(name = "cfg_rabbitmq_micro_service")
	private RabbitMqConnectionConfig rabbitMqConnectionConfig;
	
	@Primary
	@Bean(name = "dataSource", destroyMethod = "close")
	public DataSource dataSource() {
		
		hikariConfig.setPassword(AesUtil.decrypt(hikariConfig.getPassword()));
		
		return new HikariDataSource(hikariConfig);
	}

	@Primary
	@Bean(name = "sessionFactory")
	public LocalSessionFactoryBean sessionFactory() throws IOException {
		LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
		sessionFactory.setDataSource(dataSource());
		sessionFactory.setNamingStrategy(new SmartNamingStrategy());
		sessionFactory.setPackagesToScan("com.zufangbao", "com.suidifu");
		Properties hibernateProperties = new Properties();
		hibernateProperties.load(new ClassPathResource("hibernate.properties").getInputStream());
		sessionFactory.setHibernateProperties(hibernateProperties);
		return sessionFactory;
	}

	@Primary
	@Bean(name = "genericDaoSupport", autowire = Autowire.BY_TYPE)
	public GenericDaoSupport genericDaoSupport() {
		return new GenericDaoSupport();
	}

	@Bean(name = "genericJdbcSupport", autowire = Autowire.BY_TYPE)
	public GenericJdbcSupport genericJdbcSupport() {
		GenericJdbcSupport genericJdbcSupport = new GenericJdbcSupport();
		genericJdbcSupport.setDataSource(dataSource());
		return genericJdbcSupport;
	}

	@Primary
	@Bean(name = "transactionManager", autowire = Autowire.BY_NAME)
	public HibernateTransactionManager transactionManager() {
		return new HibernateTransactionManager();
	}

	@Bean(name = "transactionInterceptor")
	public TransactionInterceptor transactionInterceptor() {
		TransactionInterceptor ti = new TransactionInterceptor();
		Properties transactionAttributes = new Properties();
		transactionAttributes.setProperty("get*", "PROPAGATION_REQUIRED,readOnly");
		transactionAttributes.setProperty("list*", "PROPAGATION_REQUIRED,readOnly");
		transactionAttributes.setProperty("load*", "PROPAGATION_REQUIRED,readOnly");
		transactionAttributes.setProperty("*_NoRollback", "PROPAGATION_NOT_SUPPORTED");
		transactionAttributes.setProperty("*", "PROPAGATION_REQUIRED");
		ti.setTransactionAttributes(transactionAttributes);
		ti.setTransactionManager(transactionManager());
		return ti;
	}

	@Bean(name = "beanNameAutoProxyCreator")
	public BeanNameAutoProxyCreator beanNameAutoProxyCreator() {
		BeanNameAutoProxyCreator proxyCreator = new BeanNameAutoProxyCreator();
		proxyCreator.setProxyTargetClass(true);
		proxyCreator.setBeanNames("*Service", "*Handler");
		proxyCreator.setInterceptorNames("transactionInterceptor");
		return proxyCreator;
	}

	@Bean
	public BankAccountCache bankAccountCache() {
		return new DataStatisticsCacheHandlerImpl();
	}

	@Bean(autowire = Autowire.BY_TYPE)
	public CacheManager cacheManager() {
		return new org.springframework.cache.ehcache.EhCacheCacheManager();
	}

	@Bean(name = "ehcache", autowire = Autowire.BY_NAME)
	public EhCacheManagerFactoryBean ehCacheManagerFactoryBean() {
		EhCacheManagerFactoryBean ehCacheManagerFactoryBean = new EhCacheManagerFactoryBean();
		ehCacheManagerFactoryBean.setShared(true);
		ehCacheManagerFactoryBean.setConfigLocation(new ClassPathResource("ehcache.xml"));
		return ehCacheManagerFactoryBean;
	}
	
	@Primary
	@Bean(name="delayProcessingTaskCacheHandler")
	public DelayProcessingTaskCacheHandler delayProcessingTaskCacheHandler(){
		return new DelayProcessingTaskCacheHandlerImpl();
	}

	@Primary
	@Bean(name="DelayTaskConfigCacheHandler")
	public DelayTaskConfigCacheHandler delayTaskConfigCacheHandler(){
		return new DelayTaskConfigCacheHandlerImpl();
	}
	
	@Bean(name="ledgerCacheHandler")
	public com.zufangbao.sun.ledgerbookv2.handler.LedgerCacheHandler LedgerCacheHandler(){
		return new com.zufangbao.sun.ledgerbookv2.handler.impl.LedgerCacheHandlerImpl();
	}
	@Bean(name="ledgerTemplateParser")
	public com.zufangbao.sun.ledgerbookv2.handler.impl.LedgerTemplateParser LedgerTemplateParser(){
		
		return new com.zufangbao.wellsfargo.silverpool.ledgerbookv2.template.CachecableLedgerTemplateParser();
	}
	@Bean(name="insideAccountService")
	public com.zufangbao.sun.ledgerbookv2.service.InsideAccountService InsideAccountService(){
		
		return new CacheableInsideAccountServiceImpl();
	}
	
	@Bean(name="repaymentOrderForEasyPayNotifyResultListener")
	public com.zufangbao.wellsfargo.notify.RepaymentOrderForEasyPayNotifyResultListener RepaymentOrderForEasyPayNotifyResultListener(){
		
		return new RepaymentOrderForEasyPayNotifyResultListener();
	}
	
	@Bean(name="repaymentOrdeForEasyPayrNotifyServer")
	public com.zufangbao.wellsfargo.notify.RepaymentOrdeForEasyPayrNotifyServer RepaymentOrdeForEasyPayrNotifyServer(){
		
		return new RepaymentOrdeForEasyPayrNotifyServer();
	}
	
	@Bean(name="repaymentOrderReconciliationNoSession")
	public com.zufangbao.wellsfargo.yunxin.handler.RepaymentOrderReconciliationNoSession  RepaymentOrderReconciliationNoSession(){
		
		return new RepaymentOrderReconciliationNoSessionImpl();
	}
	
	@Bean(name="repaymentOrderHandlerProxy")
	public com.zufangbao.wellsfargo.yunxin.handler.RepaymentOrderHandlerProxy  RepaymentOrderHandlerProxy(){
		
		return new RepaymentOrderActualHandlerImpl();
	}
	
	@Bean(name="rpcHandlerProxy")
	public RpcHandlerProxy RpcHandlerProxy() {
		
		return new RpcHandlerProxy(rabbitMqConnectionConfig);
	} 
	
	
}
