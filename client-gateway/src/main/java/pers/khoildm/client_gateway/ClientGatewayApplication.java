package pers.khoildm.client_gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.GatewayFilterSpec;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class ClientGatewayApplication {

	public static void main(String[] args) {
		SpringApplication.run(ClientGatewayApplication.class, args);
	}

	@Bean
	RouteLocator gateway(RouteLocatorBuilder rlb) {
		return rlb.routes()
				.route(rs -> rs.path("/articles").filters(GatewayFilterSpec::tokenRelay).uri("http://127.0.0.1:8081"))
				.route(rs -> rs.path("/users").filters(GatewayFilterSpec::tokenRelay).uri("http://127.0.0.1:8080"))
				.build();
	}
}
