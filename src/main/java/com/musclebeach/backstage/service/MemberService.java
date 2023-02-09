package com.musclebeach.backstage.service;

import com.musclebeach.backstage.entity.Member;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface MemberService {
    Member getMemberInfo(Integer memID);

    Boolean updateMemberAccess(Integer memID);
}
