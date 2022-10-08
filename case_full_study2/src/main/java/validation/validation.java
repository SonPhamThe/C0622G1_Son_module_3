package validation;

public class validation {
    public static boolean checkNameCustomer(String name) {
        String regexName = "[[A-Z]{1}[^\\d]+\\s+]+";
        return name.matches(regexName);
    }
}
