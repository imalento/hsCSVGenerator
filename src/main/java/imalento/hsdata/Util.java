package imalento.hsdata;


public class Util {
    public static String sanitize(String str) {
        str = str
                .replaceAll("[\n$]", "")
                .replaceAll("\\[x\\]", "")
                .replaceAll("<b>", "【")
                .replaceAll(":<\\/b>", "】")
                .replaceAll("<\\/b>", "】")
                .replaceAll("<i>", " ")
                .replaceAll("<\\/i>", " ")
                .replaceAll("\\s+", " ")

                .replace("b", "")

                .replaceAll("\\{0\\}", "?")
                .replaceAll("_", "")
                .replaceAll("#", "")
                .replaceAll("@", "?");

        return str;
    }
}
