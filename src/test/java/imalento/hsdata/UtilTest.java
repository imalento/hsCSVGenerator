package imalento.hsdata;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class UtilTest {
    @Test
    public void sanitizeAll() {
        String text = "<b>秘策:</b>\n" + " [x]CSVを作る\n" + "よ。\n"
                + "____2ダメージを与える。\n"
                + "<i>$1ダメージを与える。</i>\n"
                + "#{0}@";
        assertEquals("【秘策】 CSVを作るよ。2ダメージを与える。 1ダメージを与える。 ??", Util.sanitize(text));
    }
}
