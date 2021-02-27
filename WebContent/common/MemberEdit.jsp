<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RagiForm.jsp</title>
    <!-- 웹폰트 : fonts.google.com 
        jQuery UI : http://jquery.com/
        
    -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Sunflower:wght@500&display=swap');

        * {
            /* font-family: 'Sunflower', sans-serif; */
            font-family: 'Noto Sans KR', sans-serif;
            /*문서의 기본폰트 설정*/
            margin: 0 auto;
            /* 문서전체의 가운데 정렬*/
        }

        .red {
            color: red;
        }

        .AllWrap {
            padding: 50px;
        }

        .wrap_regiform {
            border: 1px solid rgb(255, 0, 0);
            width: 750px;
            padding: 5px 10px;
        }

        .wrap_regiform table {
            border-top: 3px solid #000000;
            border-left: 1px solid rgb(165, 165, 165);
            border-right: 1px solid rgb(182, 182, 182);
            border-bottom: 1px solid rgb(200, 200, 200);
            width: 100%;
            padding: 0px 30px;
            border-spacing: 5px;
        }

        /* 버튼의 기본색과 오버시 효과 */
        .wrap_regiform table tr td:nth-child(2) button {
            background-color: #333333;
            font-size: 1em;
            width: 100px;
            padding: 5px;
            color: #ffffff;
            border: 2px solid #333333;
        }

        .wrap_regiform table tr td:nth-child(2) button:hover {
            cursor: pointer;
            background-color: #727272;
        }

        .wrap_regiform table tr td:nth-child(2) img.pick {
            position: relative;
            top: 12px;
            left: -4px;
            height: 37px;
        }

        .wrap_regiform table tr td input {
            padding: 8px;
            border: 1px solid #cccccc;
        }

        .w01 {
            width: 250px;
        }

        .w02 {
            width: 200px;
        }

        .w03 {
            width: 80px;
        }

        .w04 {
            width: 200px;
        }

        select {
            height: 35px;
        }

        #pw1,
        #pw2 {
            font-size: 0.8em;
        }

        #sub {
            background-color: #333333;
            font-size: 1em;
            width: 150px;
            padding: 5px;
            color: #ffffff;
            border: 2px solid #333333;
            margin-top: 10px;
        }

        #sub:hover {
            cursor: pointer;
            background-color: #727272;
        }
    </style>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function zipcodeFind() {
            new daum.Postcode({
                oncomplete: function (data) {
                    //Daum 우편번호 API가 전달해주는 값을 콘솔에 출력
                    console.log(data.zonecode);
                    console.log(data.address);
                    console.log(data.sido);
                    console.log(data.sigungu);
                    //가입폼에 적용하기
                    var f = document.regiform;
                    f.zipcode.value = data.zonecode;
                    f.address1.value = data.address;
                    f.address2.focus();
                }
            }).open();
        }
    </script>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function () {
            //라디오를 버튼모양으로 바꿔주는 jQury UI
            $("input[type=radio]").checkboxradio({
                icon: false
            });
            //날짜선택을 편리하게 - Date Picker
            $("#birthday").datepicker({
                dateFormat: "yy-mm-dd",
                changeMonth: true,
                changeYear: true
            });
        });
    </script>
    <script>
        var isValidate = function (frm) {

            if (frm.userid.value == '') {
                alert("아이디를 입력하세요");
                frm.userid.focus();
                return false;
            }
            if (!frm.pw1.value || !frm.pw2.value) {
                alert("패스워드를 입력하세요");
                return false;
            }
            if (!frm.name.value) {
                alert("이름을 입력하세요");
                return false;
            }
            if (!frm.birthday.value) {
                alert("생년월일을 입력하세요");
                return false;
            }
            if (!frm.tel1.value || !frm.tel2.value) {
                alert("휴대폰번호를 입력하세요");
                return false;
            }
            if (!frm.zipcode.value || !frm.address1.value || !frm.address2.value) {
                alert("주소를 입력하세요");
                return false;
            }
            if (!frm.email1.value || !frm.email2.value) {
                alert("이메일을 입력하세요");
                return false;
            }
            if (checkId()) {
                return false;
            }
            if (checkPw(frm.pw1.value)) {
                alert("비밀번호 형식이 잘못되었습니다.");
                return false;
            }
            if (checkPw2(frm.pw2.value)) {
                alert("비밀번호확인이 일치하지 않습니다.");
                return false;
            }
        }

        function emailSelect(obj) {
            var domain = document.getElementById("domain");
            var dom = document.getElementById("dom");
            if (obj.value == "") {
                domain.readOnly = false;
                domain.value = "";
                domain.focus();
            } else {
                domain.readOnly = true;
                dom.style.display = "none";
                domain.value = obj[obj.selectedIndex].text;
            }
        }

        function checkId() {
            var f = document.regiform;
            var id = f.userid.value;
            if (id == "") {
                alert("※ 아이디를 입력하세요");
                return true;
            }
            if (id.length < 8 || id.length > 12) {
                alert("※ 8~12자 사이로 입력하세요");
                return true;
            }
            if (id.charCodeAt(0) >= 48 && id.charCodeAt(0) <= 57) {
                alert("※ 첫글자는 숫자로 시작할수 없습니다.");
                return true;
            }
            for (var i = 0; i < id.length; i++) {
                if ((id.charCodeAt(i) >= 48 && id.charCodeAt(i) <= 57) ||
                    (id.charCodeAt(i) >= 65 && id.charCodeAt(i) <= 90) ||
                    (id.charCodeAt(i) >= 97 && id.charCodeAt(i) <= 122)) {} else {
                    alert("※ 영문과 숫자만 가능합니다.");
                    return true;
                }
            }
            if (f.userid.readOnly == true) return false;
            f.userid.readOnly = true;
            window.open("./id_overapping2.jsp?id=" + f.userid.value,
                "idover", "width=600,height=600");

        }

        function checkPw(pw) {
            var f1 = true,
                f2 = true,
                f3 = true;
            if (pw.length >= 6 && pw.length <= 20) {
                for (var i = 0; i < pw.length; i++) {
                    if (pw.charCodeAt(i) >= 48 && pw.charCodeAt(i) <= 57) {
                        f1 = false;
                    } else if ((pw.charCodeAt(i) >= 65 && pw.charCodeAt(i) <= 90) ||
                        (pw.charCodeAt(i) >= 97 && pw.charCodeAt(i) <= 122)) {
                        f2 = false;
                    } else {
                        switch (pw.charCodeAt(i)) {
                            case 33:
                            case 63:
                            case 42:
                            case 35:
                            case 64:
                            case 36:
                            case 37:
                            case 94:
                            case 38: {
                                f3 = false;
                                break;
                            }
                            default:
                                f3 = true;
                        }
                    }
                    console.log(i);
                }
                if (f1 == false && f2 == false && f3 == false) {
                    isN = false;
                } else {
                    isN = true;
                }
            } else {
                isN = true;
            }
            if (isN) {
                pw1.style.color = "red";
                pw1.hidden = false;
                return true;
            } else {
                pw1.hidden = "hidden";
                return false;
            }
        }
        //비밀번호 확인 
        function checkPw2(pw) {
            var f = document.regiform;
            var pw1 = f.pw1.value;
            var pw2 = document.getElementById("pw2");
            if (pw1 != pw) {
                pw2.hidden = false;
                pw2.style.color = "red";
                return true;
            } else {
                pw2.hidden = "hidden";
                return false;
            }
        }
        //전화번호 입력시 자동 포커스 이동
        function commonFocusMove(obj, mLength, next_obj) {

            if (obj.value.length >= mLength) {
                document.getElementById(next_obj).focus();
            }
        }
        //이메일 체크
        function emailCheck() {
            var domain = document.getElementById("domain").value;
            var dom = document.getElementById("dom");
            if (domain.indexOf(".") == -1) {
                dom.style.display = "";
            } else {
                dom.style.display = "none";
            }
        }
    </script>
</head>

<body>
    <div class="AllWrap">
        <h2>회원가입폼</h2>
        <div class="wrap_regiform">
            <form name="regiform" onsubmit="return isValidate(this);" action="./MEditCtrl" method="post">
                <input type="hid`den" value="${param.user_id }"
                	name="user_id"/>
                <table class="regi_table">
                    <colgroup>
                        <col width="180px">
                        <col width="*">
                    </colgroup>
                    <tr>
                        <td><span class="red">*</span> 패스워드</td>
                        <td>
                            <input type="password" class="w01" name="pw1" value="" onblur="checkPw(this.value);"
                                maxlength="20" />
                            <span id="pw1" hidden> *문자, 숫자, 특수문자가 포함되야합니다.</span>
                        </td>
                    </tr>
                    <tr>
                        <td><span class="red">*</span> 패스워드확인</td>
                        <td>
                            <input type="password" class="w01" name="pw2" value="" onblur="checkPw2(this.value);"
                                maxlength="20" />
                            <span id="pw2" hidden> *비밀번호가 일치하지 않습니다</span>
                        </td>
                    </tr>
                    <tr>
                        <td><span class="red">*</span> 생년월일</td>
                        <td style="padding: 0px 0 5px 5px;">
                            <input type="text" class="w02" name="birthday" id="birthday" value="" />
                            <img src="../images/pick.jpg" alt="" class="pick" />
                        </td>
                    </tr>
                    <tr>
                        <td><span class="red">*</span> 휴대폰번호</td>
                        <td><select name="tel">
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="012">012</option>
                                <option value="013">013</option>
                            </select> -
                            <input type="text" maxlength="4" style="width: 80px;" name="tel1"
                                onkeyup="commonFocusMove(this, 4, 'tel2');" value="${maps.tel1 }"> -
                            <input type="text" id="tel2" maxlength="4" style="width: 80px;" name="tel2"
                                onkeyup="commonFocusMove(this, 4, 'addr1');" value="${maps.tel2 }">
                        </td>
                    </tr>
                    <tr>
                        <td><span class="red">*</span> 주소</td>
                        <td>
                            <input type="text" class="w03" id="addr1" name="zipcode" value="" />
                            <button type="button" onclick="zipcodeFind();" style="width: 120px;">우편번호찾기</button>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <!-- 기본주소 -->
                            <input type="text" class="w04" name="address1" value="" />
                            <!-- 상세주소 -->
                            <input type="text" class="w04" name="address2" value="" />
                        </td>
                    </tr>
                    <tr>
                        <td><span class="red">*</span> 이메일</td>
                        <td><input type="text" name="email1" style="width: 150px;" value="${maps.email1 }"> @
                            <input type="text" style="width: 150px;" id="domain" name="email2" onblur="emailCheck();"
                            	value="${maps.email2 }">
                            <select onchange="emailSelect(this);">
                                <option value="">직접입력</option>
                                <option value="naver.com">naver.com</option>
                                <option value="daum.net">daum.net</option>
                                <option value="gmail.com">gmail.com</option>
                                <option value="hanmail.net">hanmail.net</option>
                            </select>
                        </td>
                    </tr>
                    <tr id="dom" style="display: none; color: red; font-size: 0.8em; text-align: right;">
                        <td></td>
                        <td><div style="text-align: right;padding-right: 120px;"> ※ 이메일 형식이 잘못되었습니다.</div></td>
                    </tr>
                </table>
                <div style="text-align: center;"><button type="submit" id="sub">수정하기</button></div>
            </form>
        </div>
    </div>
</body>

</html>