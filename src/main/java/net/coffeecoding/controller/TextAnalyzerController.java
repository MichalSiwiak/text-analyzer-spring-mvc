package net.coffeecoding.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class TextAnalyzerController {


    @GetMapping("/demo")
    public String sendFileGET() {
            return "send-file-form";
    }

    @PostMapping("/demo")
    public String sendFilePOST(@RequestParam("file") MultipartFile multipartFile, Model model) {

        if (multipartFile.getOriginalFilename().isEmpty()) {
            model.addAttribute("error", "Please select a valid file!");
        } else if (multipartFile.getSize() > 15728640) {
            model.addAttribute("error", "File can not be larger than 15 MB!");
        } else if (!multipartFile.getContentType().equals("text/plain")) {
            model.addAttribute("error", "Please select a valid format!");
        } else {

            System.out.println(multipartFile.getName());
            System.out.println(multipartFile.getContentType());
            model.addAttribute("success", "File uploaded successfully.");
        }

        return "send-file-form";
    }


}