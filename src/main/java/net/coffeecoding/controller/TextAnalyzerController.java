package net.coffeecoding.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;

@Controller
public class TextAnalyzerController {

    @GetMapping("/error")
    public String showErrorPage() {
        return "error-page";
    }


    @GetMapping("/demo")
    public String sendFileGET() {
        return "send-file-form";
    }

    @PostMapping("/demo")
    public String sendFilePOST(@RequestParam("file") MultipartFile multipartFile, Model model) throws IOException {

        if (multipartFile.getOriginalFilename().isEmpty()) {
            model.addAttribute("error", "Please select a valid file!");
        } else if (multipartFile.getSize() > 15728640) {
            model.addAttribute("error", "File can not be larger than 15 MB!");
        } else if (!multipartFile.getContentType().equals("text/plain")) {
            model.addAttribute("error", "Please select a valid format! Required .txt extension.");
        } else {

            //File file = new File(multipartFile.getOriginalFilename());
            //multipartFile.transferTo(file);

            //File fileDir = new File("/media/michal/Documents/Zakupy !!!.txt");

           /* BufferedReader br = new BufferedReader(new InputStreamReader(
                    new FileInputStream("/media/michal/Documents/Zakupy !!!.txt"), "UTF-8"));

            //BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(fileDir), "UTF8"));
            String line = null;
            while ((line = br.readLine()) != null) {
                System.out.println(line);
            }

            System.out.println(multipartFile.getOriginalFilename());
            model.addAttribute("success", "File uploaded successfully.");

            br.close();*/


            try {
                File fileDir = new File("C:\\Users\\msiwiak\\Downloads\\Zakupy !!!.txt");

                BufferedReader in = new BufferedReader(
                        new InputStreamReader(
                                new FileInputStream(fileDir), "UTF8"));

                String str;

                while ((str = in.readLine()) != null) {
                    System.out.println(str);
                }

                in.close();
            }
            catch (UnsupportedEncodingException e)
            {
                System.out.println(e.getMessage());
            }
            catch (IOException e)
            {
                System.out.println(e.getMessage());
            }
            catch (Exception e)
            {
                System.out.println(e.getMessage());
            }




        }

        return "send-file-form";
    }


}