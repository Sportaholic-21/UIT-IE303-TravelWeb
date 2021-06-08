package com.levart.respitories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.levart.entities.Account;

@Repository
public interface AccountRespitory extends JpaRepository<Account, Long> {
    Account findByName(String name);
}
