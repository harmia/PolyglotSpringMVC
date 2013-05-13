package info.harmia.polyglot.springapp.mvc.web.utils;

import javax.servlet.http.HttpSession;

/**
 * Created with IntelliJ IDEA.
 * User: harmia
 * Date: 7.5.2013
 * Time: 8:16
 * Copyright (C) 2013 Juhana "harmia" Harmanen
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
public final class FlashMessage {
    public static void createAlertMessage(HttpSession session, String messageKey) {
        session.setAttribute("alertMessage", messageKey);
    }

    public static void createInfoMessage(HttpSession session, String messageKey) {
        session.setAttribute("infoMessage", messageKey);
    }

    public static void createErrorMessage(HttpSession session, String messageKey) {
        session.setAttribute("errorMessage", messageKey);
    }

    public static void createSuccessMessage(HttpSession session, String messageKey) {
        session.setAttribute("successMessage", messageKey);
    }

    public static void createAlertMessage(HttpSession session, String messageKey, Object... args) {
        session.setAttribute("alertMessage", messageKey);
        session.setAttribute("alertMessageArgs", args);
    }

    public static void createInfoMessage(HttpSession session, String messageKey, Object... args) {
        session.setAttribute("infoMessage", messageKey);
        session.setAttribute("infoMessageArgs", args);
    }

    public static void createErrorMessage(HttpSession session, String messageKey, Object... args) {
        session.setAttribute("errorMessage", messageKey);
        session.setAttribute("errorMessageArgs", args);
    }

    public static void createSuccessMessage(HttpSession session, String messageKey, Object... args) {
        session.setAttribute("successMessage", messageKey);
        session.setAttribute("successMessageArgs", args);
    }
}
