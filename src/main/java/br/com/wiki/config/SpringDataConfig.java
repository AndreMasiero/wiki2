package br.com.wiki.config;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaDialect;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableJpaRepositories("br.com.wiki.repository")
@EnableTransactionManagement
//@PropertySource("classpath:/application.properties")
public class SpringDataConfig {

	@Autowired
	private Environment env;

	@Bean
	public PlatformTransactionManager transactionManager(EntityManagerFactory factory) {
		JpaTransactionManager manager = new JpaTransactionManager();
		manager.setEntityManagerFactory(factory);
		manager.setJpaDialect(new HibernateJpaDialect());
		return manager;
	}

	@Bean
	public HibernateJpaVendorAdapter jpaVendorAdapter() {
		HibernateJpaVendorAdapter adapter = new HibernateJpaVendorAdapter();
		adapter.setShowSql(env.getProperty("hibernate.show.sql", Boolean.class));
		adapter.setGenerateDdl(env.getProperty("hibernate.ddl", Boolean.class));
		return adapter;
	}

	@Bean
	public EntityManagerFactory entityManagerFactory() {
		LocalContainerEntityManagerFactoryBean factory = new LocalContainerEntityManagerFactoryBean();
		factory.setJpaVendorAdapter(jpaVendorAdapter());
		factory.setPackagesToScan(env.getProperty("hibernate.package.scan"),
				env.getProperty("java.time.jpa.converter"));
		factory.setDataSource(dataSource());
		factory.afterPropertiesSet();
		return factory.getObject();
	}

	@Bean(name = "dataSource")
	public BasicDataSource dataSource() {
//		System.out.println("AQUI");
//		BasicDataSource dataSource = new BasicDataSource();
//		dataSource.setUsername(env.getProperty("jdbc.user"));
//		dataSource.setPassword(env.getProperty("jdbc.pass"));
//		dataSource.setDriverClassName(env.getProperty("jdbc.driverClass"));
//		dataSource.setUrl(env.getProperty("jdbc.url"));

		BasicDataSource ds = new BasicDataSource();
		ds.setDriverClassName("com.mysql.jdbc.Driver");
		String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
		String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
		String name = "wiki";
		String url = "jdbc:mysql://" + host + ":" + port + "/" + name;
		ds.setUrl(url);
		ds.setUsername("username");
		ds.setPassword("pwd");

		// dataSource.setUsername("wiki");
		// dataSource.setPassword("Batata#14");
		// dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		// dataSource.setUrl("jdbc:mysql://127.0.0.1:3306/wiki");
		return ds;
	}
}
