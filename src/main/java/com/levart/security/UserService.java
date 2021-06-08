package com.levart.security;

import com.levart.entities.Account;
import com.levart.respitories.AccountRespitory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserService implements UserDetailsService {
    
    @Autowired(required = false)
    private AccountRespitory accountRespitory;

    @Override
    public UserDetails loadUserByUsername(String username) {
        Account account = accountRespitory.findByName(username);
        if (account == null) throw new UsernameNotFoundException(username);
        return new CustomUserDetails(account);
    }
}
