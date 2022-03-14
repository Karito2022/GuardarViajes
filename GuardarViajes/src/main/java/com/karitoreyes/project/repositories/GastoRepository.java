package com.karitoreyes.project.repositories;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.karitoreyes.project.models.Gasto;

public interface GastoRepository extends CrudRepository<Gasto, Long> {
	List<Gasto> findAll();
}