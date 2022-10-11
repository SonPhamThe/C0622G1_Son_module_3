package validation;

public class Validation {
    private static final String REGEX_EMAIL = "^[([A-Za-z]+)([0-9]*)]{5,30}@[a-z]+(\\.[a-z]+)$";
    private static final String REGEX_NAME = "^[a-zA-Z_ÀÁÂÃÈÉÊẾÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêếìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ ]{5,50}$";
    private static final String ADDRESS_REGEX = "^[0-9A-Za-z vxyỳọáầảấờễàạằệếýộậốũứĩõúữịỗìềểẩớặòùồợãụủíỹắẫựỉỏừỷởóéửỵẳẹèẽổẵẻỡơôưăêâđ[/][,][-]]+$";
    private static final String PHONE_NUMBER_REGEX = "^[(][0-9]{2}[)]-[(]0[0-9]{9}[)]$";

    public static boolean checkEmail(String email){
        return email.matches(REGEX_EMAIL);
    }
    public static boolean checkName(String name){
        return name.matches(REGEX_NAME);
    }
    public static boolean checkAddress(String address){
        return address.matches(ADDRESS_REGEX);
    }
    public static boolean checkPhone(String phone){
        return phone.matches(PHONE_NUMBER_REGEX);
    }
}
