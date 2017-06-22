package br.com.wiki.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.wiki.entity.Avatar;

public interface AvatarRepository extends JpaRepository<Avatar, Long> {

}
