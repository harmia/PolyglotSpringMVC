package info.harmia.polyglot.springapp.mvc.core.service;

import info.harmia.polyglot.springapp.mvc.core.model.Department;
import info.harmia.polyglot.springapp.mvc.core.repositories.DepartmentRepository;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.jpa.JpaSystemException;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: harmia
 * Date: 16.4.2013
 * Time: 20:48
 * Copyright (C) 2013 Juhana "harmia" Harmanen
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
@Service
public class DefaultDepartmentService implements DepartmentService {
    @Autowired
    private DepartmentRepository departmentRepository;

    @Override
    public List<Department> listDepartments() {
        return departmentRepository.findAll();
    }

    @Override
    public Department getDepartment(Long departmentId) {
        return departmentRepository.findOne(departmentId);
    }

    @Override
    public void addDepartment(DepartmentForm departmentForm) {
        Department department = new Department();
        department.setName(departmentForm.getName());
        departmentRepository.save(department);
    }

    @Override
    public boolean deleteDepartment(Long departmentId) {
        Department department = departmentRepository.findOne(departmentId);
        try {
            departmentRepository.delete(department);
            return true;
        } catch (JpaSystemException e) {
            return false;
        }
    }

    @Override
    public JSONArray listDepartmentsJson() throws JSONException {
        JSONArray departmentArray = new JSONArray();
        for (Department department : departmentRepository.findAll()) {
            JSONObject departmentJSON = new JSONObject();
            departmentJSON.put("id", department.getId());
            departmentJSON.put("name", department.getName());
            departmentArray.put(departmentJSON);
        }
        return departmentArray;
    }
}
