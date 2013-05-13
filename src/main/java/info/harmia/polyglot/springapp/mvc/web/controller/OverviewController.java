package info.harmia.polyglot.springapp.mvc.web.controller;

import info.harmia.polyglot.springapp.mvc.core.model.Department;
import info.harmia.polyglot.springapp.mvc.core.model.Employee;
import info.harmia.polyglot.springapp.mvc.core.service.DepartmentService;
import info.harmia.polyglot.springapp.mvc.core.service.EmployeeService;
import info.harmia.polyglot.springapp.mvc.web.utils.FlashMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: harmia
 * Date: 16.4.2013
 * Time: 21:16
 * Copyright (C) 2013 Juhana "harmia" Harmanen
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
@Controller
public class OverviewController {
    @Autowired
    private DepartmentService departmentService;
    @Autowired
    private EmployeeService employeeService;

    @RequestMapping(value = "/")
    public String listDepartmentsAndEmployees(ModelMap model, HttpSession session) {
        List<Employee> employees = employeeService.listEmployees();
        List<Department> departments = departmentService.listDepartments();
        if (departments.isEmpty()) {
            FlashMessage.createInfoMessage(session, "overview.empty.departments");
        } else if (employees.isEmpty()) {
            FlashMessage.createInfoMessage(session, "overview.empty.employees");
        }
        model.addAttribute("employees", employees);
        model.addAttribute("departments", departments);
        return "overview";
    }
}
