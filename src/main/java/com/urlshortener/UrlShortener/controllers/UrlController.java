package com.urlshortener.UrlShortener.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.view.RedirectView;

@RestController
public class UrlController {

    @GetMapping("/google")
    public RedirectView goToGoogle(){
        return new RedirectView("https://google.com");
    }
}
