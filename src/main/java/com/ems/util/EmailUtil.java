package com.ems.util;

import java.util.Properties;

import jakarta.mail.*;
import jakarta.mail.internet.*;

public class EmailUtil {

    public static void sendEmail(String to,
                                 String subject,
                                 String message){

        final String from =
                "emsproject2026@gmail.com";

        final String password =
                "mgogasjhjrlxpxlg";

        Properties props = new Properties();

props.put("mail.smtp.host", "smtp.gmail.com");
props.put("mail.smtp.port", "465");
props.put("mail.smtp.auth", "true");

props.put("mail.smtp.socketFactory.port", "465");

props.put(
"mail.smtp.socketFactory.class",
"javax.net.ssl.SSLSocketFactory"
);

props.put("mail.smtp.ssl.enable", "true");

props.put(
"mail.smtp.ssl.trust",
"smtp.gmail.com"
);
        Session session =
                Session.getInstance(
                props,

                new Authenticator(){

            protected PasswordAuthentication
            getPasswordAuthentication(){

                return new PasswordAuthentication(
                        from,
                        password);
            }
        });

        try{

            Message msg =
                    new MimeMessage(session);

            msg.setFrom(
                    new InternetAddress(from));

            msg.setRecipients(

                    Message.RecipientType.TO,

                    InternetAddress.parse(to)
            );

            msg.setSubject(subject);

            msg.setText(message);

            Transport.send(msg);

            System.out.println(
                    "EMAIL SENT SUCCESSFULLY");

        }catch(Exception e){

            System.out.println(
                    "EMAIL FAILED");

            e.printStackTrace();
        }
    }
}
