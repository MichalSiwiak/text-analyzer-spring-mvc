import java.io.*;
import java.util.*;
import java.util.regex.Pattern;

public class MainClass {

    public static void main(String[] args) throws IOException {

        Map<String, Integer> testMap = new HashMap<>();


        BufferedReader br = new BufferedReader(new InputStreamReader(
                new FileInputStream("C:\\Users\\msiwiak\\Downloads\\test.txt"), "UTF-8"));
        String line;
        while ((line = br.readLine()) != null) {
            wordCounter(line, testMap);
        }

        br.close();


        System.out.println(sortByValue(testMap).toString());

    }


    private static Map<String, Integer> wordCounter(String string, Map<String, Integer> wordsMap) {
        Pattern pattern = Pattern.compile("[^A-Za-z0-9]");
        String[] words = string.split(" ");

        for (String word : words) {

            int first = 0;
            int last = 0;

            //removing non alphanumeric characters from head
            for (int i = 0; i < word.length(); i++) {
                boolean check = pattern.matcher(String.valueOf(word.charAt(i))).matches();
                if (check) first = i + 1;
                else break;
            }
            if (first > 0) word = word.substring(first);

            //removing non alphanumeric characters from tail
            for (int i = word.length() - 1; i >= 0; i--) {
                boolean check = pattern.matcher(String.valueOf(word.charAt(i))).matches();
                if (check) last = i;
                else break;
            }
            //filling map and count words
            if (last > 0) word = word.substring(0, last);
            if (wordsMap.containsKey(word) && word.length() > 0) {
                wordsMap.put(word, wordsMap.get(word) + 1);
            } else if (word.length() > 0) {
                wordsMap.put(word, 1);
            }
        }
        return wordsMap;
    }


    private static <K, V extends Comparable<? super V>> Map<K, V> sortByValue(Map<K, V> map) {
        List<Map.Entry<K, V>> list = new ArrayList<>(map.entrySet());
        list.sort(Map.Entry.comparingByValue());
        Collections.reverse(list);

        Map<K, V> result = new LinkedHashMap<>();
        for (Map.Entry<K, V> entry : list) {
            result.put(entry.getKey(), entry.getValue());
        }
        return result;
    }
}
