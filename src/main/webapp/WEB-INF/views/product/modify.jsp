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
                        <div class="col-md-6 col-lg-4">
                          <div class="form-group">
                            <label for="email2">Email Address</label>
                            <input
                              type="email"
                              class="form-control"
                              id="email2"
                              placeholder="Enter Email"
                            />
                           
                          </div>
                          <div class="form-group">
                            <label for="password">Password</label>
                            <input
                              type="password"
                              class="form-control"
                              id="password"
                              placeholder="Password"
                            />
                          </div>
                          <div class="form-group form-inline">
                            <label
                              for="inlineinput"
                              class="col-md-3 col-form-label"
                              >Inline Input</label
                            >
                            <div class="col-md-9 p-0">
                              <input
                                type="text"
                                class="form-control input-full"
                                id="inlineinput"
                                placeholder="Enter Input"
                              />
                            </div>
                          </div>
                        
                          <div class="form-group">
                            <label for="disableinput">Disable Input</label>
                            <input
                              type="text"
                              class="form-control"
                              id="disableinput"
                              placeholder="Enter Input"
                              disabled
                            />
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
                          <div class="form-group">
                            <label for="comment">Comment</label>
                            <textarea class="form-control" id="comment" rows="5">
                            </textarea>
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
