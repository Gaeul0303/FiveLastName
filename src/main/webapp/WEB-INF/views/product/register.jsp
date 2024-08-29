<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ page session="true" %>
<html lang="ko">
  <head>
    <%@include file="/WEB-INF/views/include/head.jsp" %>
  </head>
  <body>
    <div class="wrapper">
      <%@include file="/WEB-INF/views/include/sideBar.jsp" %>
      
      <div class="main-panel">
          <%@include file="/WEB-INF/views/include/header.jsp" %>


          <div class="container">
            <div class="page-inner">
              <div class="page-header">
                <h3 class="fw-bold mb-3">Forms</h3>
                <ul class="breadcrumbs mb-3">
                  <li class="nav-home">
                    <a href="#">
                      <i class="icon-home"></i>
                    </a>
                  </li>
                  <li class="separator">
                    <i class="icon-arrow-right"></i>
                  </li>
                  <li class="nav-item">
                    <a href="#">Forms</a>
                  </li>
                  <li class="separator">
                    <i class="icon-arrow-right"></i>
                  </li>
                  <li class="nav-item">
                    <a href="#">Basic Form</a>
                  </li>
                </ul>
              </div>
              <div class="row">
                <div class="col-md-12">
                  <div class="card">
                    <div class="card-header">
                      <div class="card-title">Form Elements</div>
                    </div>
                    <div class="card-body">
                      <div class="row">
                        <div class="col-md-6">
                         
                          <div class="form-group">
                            <label for="nameinput">품목명</label>
                            <input
                              type="text"
                              class="form-control"
                              id="nameinput"
                              name="pr_name"
                              placeholder="품목명"
                              
                            />
                          </div>
                          <div class="form-group">
                            <label for="sizeinput">규격</label>
                            <input
                              type="text"
                              class="form-control"
                              id="sizeinput"
                              name="pr_size"
                              placeholder="규격"
                              
                            />
                          </div>
                          <div class="form-group">
                            <label for="typeinput">재질</label>
                            <input
                              type="text"
                              class="form-control"
                              id="typeinput"
                              name="pr_type"
                              placeholder="재질"
                              
                            />
                          </div>
                          
                          <div class="form-group">
                            <label for="typeinput">제작사양</label>
                            <textarea class="form-control" id="typeinput" rows="5" placeholder="제작사양">
                            </textarea>
                          </div>
                          <div class="form-group">
                            <label>Gender</label><br />
                            <div class="d-flex">
                              <div class="form-check">
                                <input
                                  class="form-check-input"
                                  type="radio"
                                  name="flexRadioDefault"
                                  id="flexRadioDefault1"
                                />
                                <label
                                  class="form-check-label"
                                  for="flexRadioDefault1"
                                >
                                  Male
                                </label>
                              </div>
                              <div class="form-check">
                                <input
                                  class="form-check-input"
                                  type="radio"
                                  name="flexRadioDefault"
                                  id="flexRadioDefault2"
                                  checked
                                />
                                <label
                                  class="form-check-label"
                                  for="flexRadioDefault2"
                                >
                                  Female
                                </label>
                              </div>
                            </div>
                          </div>
                          
                          <div class="form-group">
                            <label for="exampleFormControlSelect1"
                              >Example select</label
                            >
                            <select
                              class="form-select"
                              id="exampleFormControlSelect1"
                            >
                              <option>1</option>
                              <option>2</option>
                              <option>3</option>
                              <option>4</option>
                              <option>5</option>
                            </select>
                          </div>
                          
                          <div class="form-group">
                            <label for="exampleFormControlFile1"
                              >Example file input</label
                            >
                            <input
                              type="file"
                              class="form-control-file"
                              id="exampleFormControlFile1"
                            />
                          </div>
                          
                          <div class="form-check">
                            <input
                              class="form-check-input"
                              type="checkbox"
                              value=""
                              id="flexCheckDefault"
                            />
                            <label
                              class="form-check-label"
                              for="flexCheckDefault"
                            >
                              Agree with terms and conditions
                            </label>
                          </div>
                        </div>
                        
                          
                      
                      </div>
                    </div>
                    <div class="card-action">
                      <button class="btn btn-success">Submit</button>
                      <button class="btn btn-danger">Cancel</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
      </div>

      <%@include file="/WEB-INF/views/include/footer.jsp" %>
    </div>

    <%@include file="/WEB-INF/views/include/script.jsp" %>
  </body>
</html>
