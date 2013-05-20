package info.harmia.polyglot.springapp.mvc.core.service;

import info.harmia.polyglot.springapp.mvc.core.model.Employee;
import org.json.JSONArray;
import org.json.JSONException;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: harmia
 * Date: 16.4.2013
 * Time: 17:08
 * Copyright (C) 2013 Juhana "harmia" Harmanen
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
public interface EmployeeService {
    public List<Employee> listEmployees();
    public void addEmployee(EmployeeForm employeeForm);
    public boolean deleteEmployee(Long employeeId);
    public JSONArray listEmployeesJson() throws JSONException;
    public boolean changeDepartment(Long employeeId, Long departmentId);
}