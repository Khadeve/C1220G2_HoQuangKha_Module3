package model.service.common;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class InputValidation {
    public static boolean isValidInput(String input, String regexString) {
        Pattern pattern = Pattern.compile(regexString);
        Matcher matcher = pattern.matcher(input);
        return matcher.matches();
    }
}
