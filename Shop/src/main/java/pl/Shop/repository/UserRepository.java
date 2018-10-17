package pl.Shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.Shop.model.User;

public interface UserRepository extends JpaRepository<User, Long> {

	User findByName(String name);
}