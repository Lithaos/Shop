package pl.Shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.Shop.model.User;

public interface AddressRepository extends JpaRepository<User, Long> {

}