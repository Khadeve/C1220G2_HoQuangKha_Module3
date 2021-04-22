package model.service.common;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CustomerInputValidation {
    public static final String CUSTOMER_ID_REGEX = "^KH-\\d{4}$";
    public static final String PHONE_NUMBER_REGEX = "^(090|091|\\(84\\)\\+90|\\(84\\)\\+91)\\d{7}$";
    public static final String ID_CARD_REGEX = "^(\\d{9}|\\d{12})$";
    public static final String DATE_REGEX = "^([012]\\d|3[01])/([0][1-9]|[1][012])/(19\\d{2}|[2-9]\\d{3})$";
    public static final String EMAIL_REGEX = "^[A-Za-z0-9]+[A-Za-z0-9]*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)$";

    public static boolean isValidCustomerInput(String input, String regexString) {
        return InputValidation.isValidInput(input, regexString);
    }
}
