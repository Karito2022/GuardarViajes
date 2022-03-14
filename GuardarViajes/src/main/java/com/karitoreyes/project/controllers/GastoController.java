package com.karitoreyes.project.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.karitoreyes.project.models.Gasto;
import com.karitoreyes.project.services.GastoService;

@Controller
public class GastoController {
	
	@Autowired
	GastoService gastoService;
	
	@RequestMapping(value="/expenses")
	public String index(Model model) {
		List<Gasto> gastos = gastoService.allGastos();
		model.addAttribute("gastos", gastos);
	    return "index.jsp";
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String createGasto(
		RedirectAttributes redirectAttributes,
	    @RequestParam(value="name", required=false) String name,
	    @RequestParam(value="vendor", required=false) String vendor,
	    @RequestParam(value="amount", required=false) String amount,
	    @RequestParam(value="description", required=false) String description) {
		System.out.println(amount);
		if(name == "" || vendor == "" || amount == "" || description == "") {
			redirectAttributes.addFlashAttribute("nullerror", "Todos los campos son obligatorios");
			return "redirect:/expenses";
		}
		try {
			Double amountCast = Double.parseDouble(amount);
			Gasto gasto = new Gasto(name, vendor, amountCast, description);
			gastoService.createGasto(gasto);
		    return "redirect:/expenses";
		}
		catch(Exception e) {
			redirectAttributes.addFlashAttribute("amountcasterror", "La cantidad debe ser un número");
			return "redirect:/expenses";
		}
	}
}