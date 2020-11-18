<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("account") != null)
        response.sendError(HttpServletResponse.SC_NOT_FOUND);
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
    <title>Vietnamese Traditional Cake</title>

    <link href="css/bundle.93bf3029f3d569aa755b.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/0.5e95fd8219455aca161a.css">
    <link rel="stylesheet" type="text/css" href="css/4.d7e866a5c88d58ad3dcb.css">
    <link rel="stylesheet" type="text/css" href="css/5.238437a8cd51e1971bfa.css">
    <link rel="stylesheet" type="text/css" href="css/16.442805f6168ce0ecb0bf.css">
    <link rel="stylesheet" type="text/css" href="css/142.5e042dea9d592b99a02b.css">
    <link rel="stylesheet" type="text/css" href="css/77.9090783e101ae7b234b5.css">
</head>
<body>
    <div id="main">
        <div class="">
            <div>
                <div class="qaYrQZ">
                    <div style="background-color: #7fad39;">
                        <div class="_2UO8M1">
                            <div class="_3ZDC1p _19YebX _1N9Ocu">
                                <img width="invalid-value" height="invalid-value" class="_3XaILN" style="object-fit: contain" src="img/big-logo.png">
                            </div>
                            <div class="_3pDA7Q">
                                <form action="register" method="POST">
                                    <div class="_7p8xth">
                                        <div class="F6pUq_">
                                            <div class="_1x1Hdu">
                                                <div class="_38VpOh">Register</div>
                                                <div>
                                                    <span class="_1g_VZh">Already have an account?</span>
                                                    <a class="_158uwD" href="login.html">Login</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="_1B7mke">
                                            
                                            <div class="_1HkukX">
                                                <div class="FcG1bN">
                                                    <input name="username" id="input-user" class="_56AraZ" type="text" placeholder="Your username" autocomplete="on" maxlength="50" required>
                                                </div>
                                                <div id="hint-user" class="_1pHauM"></div>
                                            </div>
                                            <div class="_3Uo2e7">
                                                <div class="FcG1bN">
                                                    <input id="input-pass" class="_56AraZ" type="password" placeholder="Your password" autocomplete="current-password" maxlength="16" required>
                                                    <p onclick="showPass()" class="_3ZXx_s"><svg id="eye-shut" class="stardust-icon stardust-icon-eye-shut _2ZB_MH" fill="none" viewBox="0 0 20 10"><defs></defs><path stroke="none" fill="#000" fill-opacity=".54" d="M19.834 1.15a.768.768 0 00-.142-1c-.322-.25-.75-.178-1 .143-.035.036-3.997 4.712-8.709 4.712-4.569 0-8.71-4.712-8.745-4.748a.724.724 0 00-1-.071.724.724 0 00-.07 1c.07.106.927 1.07 2.283 2.141L.631 5.219a.69.69 0 00.036 1c.071.142.25.213.428.213a.705.705 0 00.5-.214l1.963-2.034A13.91 13.91 0 006.806 5.86l-.75 2.535a.714.714 0 00.5.892h.214a.688.688 0 00.679-.535l.75-2.535a9.758 9.758 0 001.784.179c.607 0 1.213-.072 1.785-.179l.75 2.499c.07.321.392.535.677.535.072 0 .143 0 .179-.035a.714.714 0 00.5-.893l-.75-2.498a13.914 13.914 0 003.248-1.678L18.3 6.147a.705.705 0 00.5.214.705.705 0 00.499-.214.723.723 0 00.036-1l-1.82-1.891c1.463-1.071 2.32-2.106 2.32-2.106z"></path></svg><svg id="eye-open" class="stardust-icon stardust-icon-eye-open K1Pm8D" fill="none" viewBox="0 0 20 12" style="display: none;"><defs></defs><path stroke="none" fill="#000" fill-opacity=".54" fill-rule="evenodd" d="M19.975 5.823V5.81 5.8l-.002-.008v-.011a.078.078 0 01-.002-.011v-.002a.791.791 0 00-.208-.43 13.829 13.829 0 00-1.595-1.64c-1.013-.918-2.123-1.736-3.312-2.368-.89-.474-1.832-.867-2.811-1.093l-.057-.014a2.405 2.405 0 01-.086-.02L11.884.2l-.018-.003A9.049 9.049 0 0010.089 0H9.89a9.094 9.094 0 00-1.78.197L8.094.2l-.016.003-.021.005a1.844 1.844 0 01-.075.017l-.054.012c-.976.226-1.92.619-2.806 1.09-1.189.635-2.3 1.45-3.31 2.371a13.828 13.828 0 00-1.595 1.64.792.792 0 00-.208.43v.002c-.002.007-.002.015-.002.022l-.002.01V5.824l-.002.014a.109.109 0 000 .013L0 5.871a.206.206 0 00.001.055c0 .01 0 .018.002.027 0 .005 0 .009.003.013l.001.011v.007l.002.01.001.013v.002a.8.8 0 00.208.429c.054.067.11.132.165.197a13.9 13.9 0 001.31 1.331c1.043.966 2.194 1.822 3.428 2.48.974.52 2.013.942 3.09 1.154a.947.947 0 01.08.016h.003a8.864 8.864 0 001.596.16h.2a8.836 8.836 0 001.585-.158l.006-.001a.015.015 0 01.005-.001h.005l.076-.016c1.079-.212 2.118-.632 3.095-1.153 1.235-.66 2.386-1.515 3.43-2.48a14.133 14.133 0 001.474-1.531.792.792 0 00.208-.43v-.002c.003-.006.003-.015.003-.022v-.01l.002-.008c0-.004 0-.009.002-.013l.001-.012.001-.015.001-.019.002-.019a.07.07 0 01-.01-.036c0-.009 0-.018-.002-.027zm-6.362.888a3.823 3.823 0 01-1.436 2.12l-.01-.006a3.683 3.683 0 01-2.178.721 3.67 3.67 0 01-2.177-.721l-.009.006a3.823 3.823 0 01-1.437-2.12l.014-.01a3.881 3.881 0 01-.127-.974c0-2.105 1.673-3.814 3.738-3.816 2.065.002 3.739 1.711 3.739 3.816 0 .338-.047.662-.128.975l.011.009zM8.145 5.678a1.84 1.84 0 113.679 0 1.84 1.84 0 01-3.679 0z" clip-rule="evenodd"></path></svg>
                                                    </p>
                                                </div>
                                                <div id="hint-pass" class="_1pHauM"></div>
                                            </div>
                                            <div class="_3Uo2e7">
                                                <div class="FcG1bN">
                                                    <input name="password" id="input-pass2" class="_56AraZ" type="password" placeholder="Confirm password" autocomplete="current-password" maxlength="16" required>
                                                    <p onclick="showPass2()" class="_3ZXx_s"><svg id="eye-shut2" class="stardust-icon stardust-icon-eye-shut _2ZB_MH" fill="none" viewBox="0 0 20 10"><defs></defs><path stroke="none" fill="#000" fill-opacity=".54" d="M19.834 1.15a.768.768 0 00-.142-1c-.322-.25-.75-.178-1 .143-.035.036-3.997 4.712-8.709 4.712-4.569 0-8.71-4.712-8.745-4.748a.724.724 0 00-1-.071.724.724 0 00-.07 1c.07.106.927 1.07 2.283 2.141L.631 5.219a.69.69 0 00.036 1c.071.142.25.213.428.213a.705.705 0 00.5-.214l1.963-2.034A13.91 13.91 0 006.806 5.86l-.75 2.535a.714.714 0 00.5.892h.214a.688.688 0 00.679-.535l.75-2.535a9.758 9.758 0 001.784.179c.607 0 1.213-.072 1.785-.179l.75 2.499c.07.321.392.535.677.535.072 0 .143 0 .179-.035a.714.714 0 00.5-.893l-.75-2.498a13.914 13.914 0 003.248-1.678L18.3 6.147a.705.705 0 00.5.214.705.705 0 00.499-.214.723.723 0 00.036-1l-1.82-1.891c1.463-1.071 2.32-2.106 2.32-2.106z"></path></svg><svg id="eye-open2" class="stardust-icon stardust-icon-eye-open K1Pm8D" fill="none" viewBox="0 0 20 12" style="display: none;"><defs></defs><path stroke="none" fill="#000" fill-opacity=".54" fill-rule="evenodd" d="M19.975 5.823V5.81 5.8l-.002-.008v-.011a.078.078 0 01-.002-.011v-.002a.791.791 0 00-.208-.43 13.829 13.829 0 00-1.595-1.64c-1.013-.918-2.123-1.736-3.312-2.368-.89-.474-1.832-.867-2.811-1.093l-.057-.014a2.405 2.405 0 01-.086-.02L11.884.2l-.018-.003A9.049 9.049 0 0010.089 0H9.89a9.094 9.094 0 00-1.78.197L8.094.2l-.016.003-.021.005a1.844 1.844 0 01-.075.017l-.054.012c-.976.226-1.92.619-2.806 1.09-1.189.635-2.3 1.45-3.31 2.371a13.828 13.828 0 00-1.595 1.64.792.792 0 00-.208.43v.002c-.002.007-.002.015-.002.022l-.002.01V5.824l-.002.014a.109.109 0 000 .013L0 5.871a.206.206 0 00.001.055c0 .01 0 .018.002.027 0 .005 0 .009.003.013l.001.011v.007l.002.01.001.013v.002a.8.8 0 00.208.429c.054.067.11.132.165.197a13.9 13.9 0 001.31 1.331c1.043.966 2.194 1.822 3.428 2.48.974.52 2.013.942 3.09 1.154a.947.947 0 01.08.016h.003a8.864 8.864 0 001.596.16h.2a8.836 8.836 0 001.585-.158l.006-.001a.015.015 0 01.005-.001h.005l.076-.016c1.079-.212 2.118-.632 3.095-1.153 1.235-.66 2.386-1.515 3.43-2.48a14.133 14.133 0 001.474-1.531.792.792 0 00.208-.43v-.002c.003-.006.003-.015.003-.022v-.01l.002-.008c0-.004 0-.009.002-.013l.001-.012.001-.015.001-.019.002-.019a.07.07 0 01-.01-.036c0-.009 0-.018-.002-.027zm-6.362.888a3.823 3.823 0 01-1.436 2.12l-.01-.006a3.683 3.683 0 01-2.178.721 3.67 3.67 0 01-2.177-.721l-.009.006a3.823 3.823 0 01-1.437-2.12l.014-.01a3.881 3.881 0 01-.127-.974c0-2.105 1.673-3.814 3.738-3.816 2.065.002 3.739 1.711 3.739 3.816 0 .338-.047.662-.128.975l.011.009zM8.145 5.678a1.84 1.84 0 113.679 0 1.84 1.84 0 01-3.679 0z" clip-rule="evenodd"></path></svg>
                                                    </p>
                                                </div>
                                                <div id="hint-pass2" class="_1pHauM"></div>
                                            </div>
                                            <button name="act" id="btn-register" class="_25c6dS _2revuH CCz-NV _3LF8FC _1YKfmR E73q_w" disabled="">REGISTER</button>
                                            <div class="QnCMt9"><a class="O64rDC" href="index.html">Return to home</a></div>
                                            <div id="register-fail" class="uud8ko qluhEI" style="display: none;">
                                                <div class="_1LQvwM">
                                                    <svg class="stardust-icon stardust-icon-cross-with-circle _2Kw8rR" viewBox="0 0 16 16"><defs></defs>
                                                        <path fill="none" stroke="#FF424F" d="M8 15A7 7 0 108 1a7 7 0 000 14z" clip-rule="evenodd"></path>
                                                        <rect stroke="none" width="7" height="1.5" x="6.061" y="5" fill="#FF424F" rx=".75" transform="rotate(45 6.06 5)"></rect>
                                                        <rect stroke="none" width="7" height="1.5" fill="#FF424F" rx=".75" transform="scale(-1 1) rotate(45 -11.01 -9.51)"></rect>
                                                    </svg>
                                                </div>
                                                <div class="_2d8JQY">This username has been existing!</div> 
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">
        a._158uwD {
            color: #7fad39;
        }
        div._3pDA7Q {
            width: 500px;
        }
        div._7p8xth, div.F6pUq_ {
            width: 420px;
        }
        div._1B7mke {
            width: 360px;
        }
        button.E73q_w {
            background-color: #7fad39;
        }
        #eye-shut, #eye-open,
        #eye-shut2, #eye-open2 {
            cursor: pointer;
        }
    </style>
    <script type="text/javascript">
        var shown = false;
        function showPass() {
            shown = !shown;
            document.getElementById('eye-shut').style.display = shown ? 'none' : '';
            document.getElementById('eye-open').style.display = shown ? '' : 'none';
            document.getElementById('input-pass').type = shown ? 'text' : 'password';
        };
        function showPass2() {
            shown = !shown;
            document.getElementById('eye-shut2').style.display = shown ? 'none' : '';
            document.getElementById('eye-open2').style.display = shown ? '' : 'none';
            document.getElementById('input-pass2').type = shown ? 'text' : 'password';
        };
        window.onload = function() {
            if (window.location.hash === '') return;
            var e = document.querySelector(window.location.hash);
            if (e !== null) {
                var p = e.style.display;
                e.style.display = p === 'none' ? '' : p;
                window.location.hash = '';
            }
        };
        var btnReg = document.getElementById('btn-register');
        var inputUser = document.getElementById('input-user');
        var inputPass = document.getElementById('input-pass');
        var inputPass2 = document.getElementById('input-pass2');
        
        var hUser = document.getElementById('hint-user');
        var hPass = document.getElementById('hint-pass');
        var hPass2 = document.getElementById('hint-pass2');
        
        var ok = false, ok2 = false, ok3 = false;
        
        inputUser.oninput = function() {
            var user = inputUser.value;
            if (user === '') {
                ok = false;
                hUser.innerHTML = "Username cannot be empty.";
            } else if (user.length < 3 || user.length > 30) {
                ok = false;
                hUser.innerHTML = "Username length must from 3 to 32 characters.";
            } else if (!user.match("^[a-zA-Z][a-zA-Z0-9_]{2,30}$")) {
                ok = false;
                hUser.innerHTML = "Username must start with alphabet, can contain digits.";
            } else {
                ok = true;
                hUser.innerHTML = '';
            }
            btnReg.disabled = !(ok && ok2 && ok3);
        };
                
        inputPass.oninput = function() {
            var pass = inputPass.value;
            if (pass === '') {
                ok2 = false;
                hPass.innerHTML = 'Password cannot be empty.';
            } else if (pass.length < 8) {
                ok2 = false;
                hPass.innerHTML = 'Password length must from 8 to 16 chracters.';
            } else {
                ok2 = true;
                hPass.innerHTML = '';
            }
            var pass2 = inputPass2.value;
            if (pass2 !== '')
                if (pass2 !== pass) {
                    ok3 = false;
                    hPass2.innerHTML = 'Confirm password is not match.';  
                } else {
                    ok3 = true;
                    hPass2.innerHTML = '';
                }
            btnReg.disabled = !(ok && ok2 && ok3);
        };
        
        inputPass2.oninput = function() {
            var pass = inputPass.value;
            var pass2 = inputPass2.value;
            if (pass2 !== pass) {
                ok3 = false;
                hPass2.innerHTML = 'Confirm password is not match.';  
            } else {
                ok3 = true;
                hPass2.innerHTML = '';
            }
            btnReg.disabled = !(ok && ok2 && ok3);
        };
    </script>
</body>
</html>