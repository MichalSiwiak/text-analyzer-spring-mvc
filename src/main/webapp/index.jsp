<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>coffeecoding.net</title>
    <meta name="description"
          content="Free open source projects present different java solutions using spring, hibernate and other popular frameworks.">
    <meta name="keywords"
          content="java, spring, hibernate, apache, tomcat, coding, programmer, linux, google cloud platform, open source, bootstrap, mysql, java ideas">
    <!-- CSS dependencies -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
          type="text/css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker.standalone.min.css">
    <link rel="stylesheet" href="https://www.coffeecoding.net/resources/css/now-ui-kit.css" type="text/css">
    <link rel="stylesheet" href="https://www.coffeecoding.net/resources/css/style.css" type="text/css">
    <link rel="icon" href="resources/img/favicon.png">
    <!-- PAGE scripts -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.js"></script>
</head>


<body class="bg-light text-dark">
<div id="wrap">
    <div id="main" class="clear-top">


        <div class="collapse" id="navbarHeader">
            <div class="container">
                <div class="row">
                    <div class="col-md-7 py-4">
                        <h4>About</h4>
                        <p class="text-info">Free open source projects present different java solutions using spring,
                            hibernate
                            and other popular frameworks.</p>
                    </div>
                    <div class="col-md-3 offset-md-1 py-4">
                        <h4>Contact</h4>
                        <ul class="list-unstyled">
                            <li>
                                <a href="https://pl.linkedin.com/in/michalsiwiak" class="text-secondary"
                                   target="_blank">Follow
                                    on LinkedIn</a>
                            </li>
                            <li>
                                <a href="mailto:info@coffeecoding.net" target="_top" class="text-secondary">Email me</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>


        <div class="navbar sticky-top navbar-dark bg-info">
            <div class="container d-flex justify-content-between">
                <a href="https://www.coffeecoding.net/" class="navbar-brand d-flex align-items-center"><i
                        class="fa fa-home fa-2x lead fa-fw d-inline-block" aria-hidden="true"></i>&nbsp;&nbsp;<text
                        class="">
                    HOME
                </text>
                </a>
                <a href="https://github.com/MichalSiwiak/text-analyzer-spring-mvc" target="_blank"
                   class="navbar-brand d-flex align-items-center"><i
                        class="fa fa-git-square fa-fw d-inline-block lead fa-2x"></i>&nbsp;&nbsp;<text class="">SOURCE
                    CODE
                </text>
                </a>
                <a href="${pageContext.request.contextPath}/demo" class="navbar-brand d-flex align-items-center"><i
                        class="fa fa-desktop fa-2x fa-fw lead d-inline-block" aria-hidden="true"></i>&nbsp;&nbsp;<text
                        class="">DEMO VIEW
                </text>
                </a>
                <a href="https://coffeecoding.net/resources/img/cv_msiwiak.pdf" target="_blank"
                   class="navbar-brand d-flex align-items-center"><i
                        class="fa fa-address-card fa-2x lead fa-fw d-inline-block" aria-hidden="true"></i>&nbsp;&nbsp;<text
                        class="">RESUME
                </text>
                </a>
                <a href="/contact" class="navbar-brand d-flex align-items-center"><i
                        class="fa fa-envelope fa-2x lead fa-fw d-inline-block" aria-hidden="true"></i>&nbsp;&nbsp;<text
                        class="">CONTACT
                </text>
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarHeader"><span
                        class="navbar-toggler-icon"></span></button>
            </div>
        </div>


        <div class="py-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1>Text Analyzer</h1>
                        <hr>
                        <h5>The application analyzes the text from a file sent to the server. Then, using logic, counts
                            the occurrence of words and and displays the statistics. The uploaded file in the txt format
                            can not be more than 15 MB.<br></h5>
                        <h5><b>Back End: </b>Java, Spring MVC.</h5>
                        <h5><b>Front End: </b>HTML, CSS, JSP.</h5>
                        <h5>To run application: git clone
                            https://github.com/MichalSiwiak/text-analyzer-spring-mvc.git,
                            upload and run application using tomcat application server or similar.</h5>
                        <h5>Demo View: <a href="https://coffeecoding.net/text-analyzer/demo">https://coffeecoding.net/text-analyzer/demo</a>
                        </h5>
                        <h5>Controller class:</h5>
                    </div>
                </div>
                <pre>
                    <code class="java">
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
                    </code>
                </pre>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.11.0/highlight.min.js"></script>
                <script>
                    hljs.initHighlightingOnLoad();
                </script>
            </div>
        </div>


    </div>
</div>


<footer class="footer bg-dark text-muted">
    <div class="container">
        <p class="float-right">
            <a href="#">Back to top</a>
        </p>
        <p>© Copyright 2018 coffeecoding.net - All rights reserved.<br>Contact: info@coffeecoding.net<br>Warsaw PL<br><a
                href="https://www.coffeecoding.net/">Visit the homepage</a>
        </p>
    </div>
</footer>


</body>
</html>