package net.coffeecoding.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.*;
import java.util.regex.Pattern;


@Controller
public class TextAnalyzerController {

    @GetMapping("/error")
    public String showErrorPage() {
        return "error-page";
    }

    @GetMapping("/demo")
    public String sendFileGET(Model model) {
        model.addAttribute("display", "none");
        return "send-file-form";
    }

    @PostMapping("/demo")
    public String sendFilePOST(@RequestParam("file") MultipartFile multipartFile, Model model) throws IOException {

        Map<String, Integer> wordsMap = new HashMap<>();
        List<Integer> wordsListLength = new ArrayList<>();

        if (multipartFile.getOriginalFilename().isEmpty()) {
            model.addAttribute("error", "Please select a valid file!");
            model.addAttribute("display", "none");
        } else if (multipartFile.getSize() > 15728640) {
            model.addAttribute("error", "File can not be larger than 15 MB!");
            model.addAttribute("display", "none");
        } else if (!multipartFile.getContentType().equals("text/plain")) {
            model.addAttribute("error", "Please select a valid format! Required .txt extension.");
            model.addAttribute("display", "none");
        } else {

            File file = new File("/tmp/" + multipartFile.getOriginalFilename());
            multipartFile.transferTo(file);

            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(
                    new FileInputStream(file), "UTF-8"));
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                wordCounter(line, wordsMap);
            }

            bufferedReader.close();

            for (String key : wordsMap.keySet()) {
                wordsListLength.add(key.length());
            }

            OptionalDouble average = wordsListLength
                    .stream()
                    .mapToDouble(a -> a)
                    .average();


            model.addAttribute("success", "File uploaded successfully.");
            model.addAttribute("display", "block");
            model.addAttribute("wordsMap", sortByValue(wordsMap));
            model.addAttribute("average", roundDouble2precision(average.getAsDouble(), 6));
            file.delete();
        }


        return "send-file-form";
    }

    private Map<String, Integer> wordCounter(String string, Map<String, Integer> wordsMap) {

        Pattern pattern = Pattern.compile("[^A-Za-z0-9]");
        String[] words = string.split(" ");

        for (String word : words) {

            int headNonAlphanumeric = 0;
            int tailNonAlphanumeric = 0;


            //removing non alphanumeric characters from head
            for (int i = 0; i < word.length(); i++) {
                boolean check = pattern.matcher(String.valueOf(word.charAt(i))).matches();
                if (check) headNonAlphanumeric = i + 1;
                else break;
            }
            if (headNonAlphanumeric > 0) word = word.substring(headNonAlphanumeric);


            //removing non alphanumeric characters from tail
            for (int i = word.length() - 1; i >= 0; i--) {
                boolean check = pattern.matcher(String.valueOf(word.charAt(i))).matches();
                if (check) tailNonAlphanumeric = i;
                else break;
            }

            if (tailNonAlphanumeric > 0) word = word.substring(0, tailNonAlphanumeric);


            //filling map and count words
            if (wordsMap.containsKey(word) && word.length() > 0) {
                wordsMap.put(word, wordsMap.get(word) + 1);
            } else if (word.length() > 0) {
                wordsMap.put(word, 1);
            }
        }
        return wordsMap;
    }

    //method for sorting a map by values
    private <K, V extends Comparable<? super V>> Map<K, V> sortByValue(Map<K, V> map) {
        List<Map.Entry<K, V>> list = new ArrayList<>(map.entrySet());
        list.sort(Map.Entry.comparingByValue());
        Collections.reverse(list);

        Map<K, V> result = new LinkedHashMap<>();
        for (Map.Entry<K, V> entry : list) {
            result.put(entry.getKey(), entry.getValue());
        }
        return result;
    }

    private double roundDouble2precision(double value, int places) {

        if (places < 0)
            throw new IllegalArgumentException();
        long factor = (long) Math.pow(10, places);
        value = value * factor;
        long tmp = Math.round(value);
        return (double) tmp / factor;
    }
}