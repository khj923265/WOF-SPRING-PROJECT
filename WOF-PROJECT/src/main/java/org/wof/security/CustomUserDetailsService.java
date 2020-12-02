package org.wof.security;

import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.wof.domain.MemberVO;
import org.wof.mapper.MemberMapper;
import org.wof.security.domain.CustomUser;

public class CustomUserDetailsService implements UserDetailsService {

    @Setter(onMethod_ = {@Autowired})
    private MemberMapper memberMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        //userName means userid
        MemberVO vo = memberMapper.read(username);
        return vo == null ? null : new CustomUser(vo);

    }


}
