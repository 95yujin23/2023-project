<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매칭 게시판</title>
</head>
<body>
<div class="allProject">
        <h3>매칭게시판</h3>
        <div class="selectOption">
            <select class="smSelect filters">
                <option value="" selected>상관없음</option>
                <option>서울특별시</option>
                <option>경기도</option>
                <option>부산광역시</option>
                <option>인천광역시</option>
                <option>대구광역시</option>
                <option>경상남도</option>
                <option>경상북도</option>
                <option>대전광역시</option>
                <option>충청남도</option>
                <option>충청북도</option>
                <option>전라남도</option>
                <option>전라북도</option>
                <option>광주광역시</option>
                <option>강원도</option>
                <option>울산광역시</option>
                <option>제주특별자치도</option>
                <option>세종특별자치시</option>
            </select>
            <select class="smSelect" id="typeSelect">
                <option selected>성별</option>
                <option>상관없음</option>
                <option>남</option>
                <option>여</option>
            </select>
            <select class="smSelect filters">
                <option value="" selected>메뉴</option>
                <option>한식</option>
                <option>중식</option>
                <option>일식</option>
                <option>양식</option>          
                <option>디저트</option>          
            </select>
            <label class="checkbox filters">
                <input type="checkbox" id="checkFilter" class="check" value="1" checked>
                <span class="text">모집중</span>
            </label>
            <input type="hidden" class="filter">
            <input type="hidden" class="filter">
            <input type="hidden" class="filter">
        </div>
        <div class="projectGridView">
            <th:block th:each="project : ${projectList}">
                <div class="projectGridWrap">
                    <div class="projectTopInfo">
                        <div class="topInfo">
                            <div class="box-wrap">
                                <div class="box green">
                                    <span>NEW</span>
                                </div>
                                <div class="box black">
                                    <span>매칭</span>
                                </div>
                            </div>
                            <div class="favorite"></div>
                        </div>
                        <div class="projectImg">
                            <img th:if="${project.projectImgPath == null}"
                                 th:src="'/images/'+${project.projectImg}">
                            <img th:unless="${project.projectImgPath == null}"
                                 th:src="'/project/display?fileName='+ ${project.projectImgPath} + '/' + ${project.projectImgUuid} + '_' + ${project.projectImg}">
                        </div>
                    </div>
                    <div class="projectMiddleInfo">
                        <p class="category" th:text="${project.projectPart}"></p>
                        <p class="categoryText" th:text="'['+${project.projectLocation}+']'+${project.projectName}"></p>
                    </div>
                    </a>
                    <div class="projectBottomInfo">
                        <div class="middleWrap">
                            <div class="left">
                                <div class="heart">
                                    <img src="https://letspl.me/assets/images/ic-favorite-empty-white.svg">
                                    <span class="heartCount">0</span>
                                </div>
                            </div>
                            <div class="right">
                                <div>
                                    <span th:text="${project.projectReadCount}"></span>
                                </div>
                            </div>
                        </div>
                        <div class="bottomWrap">
                            <div class="recruit">
                                <div class="recruitStatus">
                                    <span th:if="${project.projectStatus=='1'}"
                                          th:text="'[모집중] '+${project.projectPart}"></span>
                                    <span th:if="${project.projectStatus=='2'}"
                                          th:text="'[모집완료] '+${project.projectPart}"></span>
                                    <span>
                                    0/1
                                </span>
                                    <div>
                                        <img src="https://letspl.me/assets/images/ic-arrow-up.svg">
                                    </div>
                                </div>
                                <div class="recruitModel">
                                    <ul>
                                        <th:block th:each="person : ${project.persons}">
                                            <li>
                                                <span th:text="${person.projectSubSkill}"></span>
                                                <span th:text="${person.projectCount}"></span>
                                            </li>
                                        </th:block>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </th:block>
        </div>
    </div>
</body>
</html>