<%--
    Document   : login
    Created on : 1 Apr 2025, 3:19:40 pm
    Author     : yjee0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/components/title.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/pages/login.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/pages/body.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <header>
        <%@include file="components/navbar.jsp" %>
    </header>
        <body>
            <%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username != null && !username.isEmpty() && password != null && !password.isEmpty()) {
            // Successful login
            session.setAttribute("user", username);
            session.setAttribute("successful", "true");
            response.sendRedirect("index.jsp");
            return;
        } else {
            // Failed login
            session.setAttribute("unsuccessful", "false");
            response.sendRedirect("login.jsp");
            return;
        }
    }

    if (session.getAttribute("unsuccessful") != null) {
        String errorType = (String) session.getAttribute("unsuccessful");
        session.removeAttribute("unsuccessful");

if ("false".equals(errorType)) {
        %>
        <script>
            Swal.fire({
                icon: 'error',
                title: 'Login Failed',
                text: 'Username and password Invalid',
                timer: 5000
            });
        </script>
        <%
            }
        }
        %>


        <!-- logout -->
        <%
        if (request.getParameter("logout") != null && request.getParameter("logout").equals("true")) {
            String username = (String) session.getAttribute("user");
            session.invalidate();
        %>
        <script>
            Swal.fire({
                icon: 'success',
                title: 'Logout Successful!',
                text: 'Goodbye, <%= username %>!',
                timer: 5000
            });
        </script>
        <%
        }
        %>

        <!-- title -->
        <div class="title">
            <h2>Login</h2>
        </div>

        <!-- container -->
        <div class="container">
            <!<!-- box -->
            <div class="box">
                <!-- image -->
                <div class="image">
                    <img src="${pageContext.request.contextPath}/assets/logo/text.png">
                </div>

                <!-- form -->
                <div class="form">
                    <h1 class="login-title">Login</h1>

                    <% if (request.getAttribute("error") != null) { %>
                    <div class="error-message">
                        <%= request.getAttribute("error") %>
                    </div>
                    <% } %>

                    <form method="POST">
                        <div class="detail">
                            <label for="username">Username</label>
                            <div class="icon">
                                <i class="fa-solid fa-user"></i>
                                <input type="text" id="username" name="username" placeholder="Enter username" required>
                            </div>
                        </div>

                        <div class="detail">
                            <label for="password">Password</label>
                            <div class="icon">
                                <i class="fa-solid fa-key"></i>
                                <input type="password" id="password" name="password" placeholder="Enter password" required>
                            </div>
                        </div>

                        <div class="forgot-passwd">
                            <a href="reset.jsp">Forgot password?</a>
                        </div>

                        <button type="submit" class="button">Login</button>
                    </form>

                    <!-- go to sign up page -->
                    <div class="signup">
                        Don't have an account? <a href="register.jsp">Sign up</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <footer>
        <%@include file="components/footer.jsp" %>
    </footer>
</html>
