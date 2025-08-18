package com.nowcoder.community;

import com.nowcoder.community.util.CommunityUtil;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.HashMap;
import java.util.function.BiConsumer;

/**
 * @description: 加密测试类
 * @author: tomb
 * @create: 2025-08-18 16:00
 **/
@RunWith(SpringRunner.class)
@SpringBootTest
@ContextConfiguration(classes = CommunityApplication.class)
public class EncryptTests {

    @org.junit.Test
    public void testBCrypt() {
        String password = "a123456";
        String encodedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        System.out.println(encodedPassword);

        boolean verify = BCrypt.checkpw(password, encodedPassword);
        System.out.println(verify);
    }

    @org.junit.Test
    public void test() {
        String password = "a123456";
//        String salt = CommunityUtil.generateUUID().substring(0, 5);
        String salt = "a4d0c";
        String s = CommunityUtil.md5(password + salt);
        String s1 = CommunityUtil.md5(salt + password);
        System.out.println(s);// 0c15502983b83d37eabfd2178496d8c2
        System.out.println(s1);// abc897dc402619cdd24e8c1b9f645f1e
        System.out.println();

        HashMap<Integer, String> hm = new HashMap<>();
        hm.put(1, "abcde");
        hm.put(2, "fghij");
        hm.put(3, "klmno");

        hm.forEach(new BiConsumer<Integer, String>() {
            @Override
            public void accept(Integer integer, String s) {
                System.out.println(CommunityUtil.md5(password + s));
            }
        });

    }
}
