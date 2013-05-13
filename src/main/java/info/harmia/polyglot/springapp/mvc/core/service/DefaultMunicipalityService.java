package info.harmia.polyglot.springapp.mvc.core.service;

import info.harmia.polyglot.springapp.mvc.core.model.Municipality;
import info.harmia.polyglot.springapp.mvc.core.repositories.MunicipalityRepository;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: harmia
 * Date: 16.4.2013
 * Time: 22:02
 * Copyright (C) 2013 Juhana "harmia" Harmanen
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
@Service
public class DefaultMunicipalityService implements MunicipalityService {

    @Autowired
    private MunicipalityRepository municipalityRepository;

    @Override
    public List<Municipality> listMunicipalities() {
        return municipalityRepository.findAll();
    }

    @Override
    public Municipality getMunicipality(Long municipalityId) {
        return  municipalityRepository.findOne(municipalityId);
    }

    @Override
    public JSONArray listMunicipalitiesJson() throws JSONException {
        JSONArray municipalityArray = new JSONArray();
        for(Municipality municipality : municipalityRepository.findAll()) {
            municipalityArray.put(createMunicipalityJson(municipality));
        }
        return municipalityArray;
    }

    @Override
    public JSONArray checkMunicipalitiesJson(String term) throws JSONException {
        JSONArray municipalityArray = new JSONArray();
        for(Municipality municipality : municipalityRepository.findAll()) {
            if (municipality.getName().toUpperCase().startsWith(term.toUpperCase())) {
                municipalityArray.put(createMunicipalityJson(municipality));
            }
        }
        return municipalityArray;
    }

    private JSONObject createMunicipalityJson(Municipality municipality) throws JSONException {
        JSONObject municipalityJSON = new JSONObject();
        municipalityJSON.put("id", municipality.getId());
        municipalityJSON.put("name", municipality.getName());
        return municipalityJSON;
    }
}
