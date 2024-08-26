 <!--
 
 
 
 
 왼쪽 사이드 네비 바
 
 -->
 
 <!-- Sidebar -->
 <div class="sidebar" data-background-color="custom">
    <div class="sidebar-logo">
      <!-- Logo Header -->
      <div class="logo-header" data-background-color="custom" >
        <a href="/" class="logo">
          <img
            src="${path }/resources/assets/img/kaiadmin/logo.png"
            alt="navbar brand"
            class="navbar-brand"
            height="20"
          />
          <span class="logoText">
            MMS
          </span>
        </a>
        <div class="nav-toggle">
          <button class="btn btn-toggle toggle-sidebar">
            <i class="gg-menu-right"></i>
          </button>
          <button class="btn btn-toggle sidenav-toggler">
            <i class="gg-menu-left"></i>
          </button>
        </div>
        <button class="topbar-toggler more">
          <i class="gg-more-vertical-alt"></i>
        </button>
      </div>
      <!-- End Logo Header -->
    </div>
    <div class="sidebar-wrapper scrollbar scrollbar-inner">
      <div class="sidebar-content">
        <ul class="nav nav-secondary">
          <li class="nav-item active">
            <a
              data-bs-toggle="collapse"
              href="#dashboard"
              class="collapsed"
              aria-expanded="false"
            >
              <i class="fas fa-home"></i>
              <p>MAIN</p>
            
            </a>
          
          </li>
          <li class="nav-section">
            <span class="sidebar-mini-icon">
              <i class="fa fa-ellipsis-h"></i>
            </span>
            <h4 class="text-section">Components</h4>
          </li>

        
          <li class="nav-item">
            <a data-bs-toggle="collapse" href="#forms">
              <i class="fas fa-pen-square"></i>
              <p>Forms</p>
              <span class="caret"></span>
            </a>
            <div class="collapse" id="forms">
              <ul class="nav nav-collapse">
                <li>
                  <a href="form">
                    <span class="sub-item">Basic Form</span>
                  </a>
                </li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a data-bs-toggle="collapse" href="#tables">
              <i class="fas fa-table"></i>
              <p>Tables</p>
              <span class="caret"></span>
            </a>
            <div class="collapse" id="tables">
              <ul class="nav nav-collapse">
               
                <li>
                  <a href="dataTables">
                    <span class="sub-item">Datatables</span>
                  </a>
                </li>
              </ul>
            </div>
          </li>
       
          <li class="nav-item">
            <a data-bs-toggle="collapse" href="#charts">
              <i class="far fa-chart-bar"></i>
              <p>Charts</p>
              <span class="caret"></span>
            </a>
            <div class="collapse" id="charts">
              <ul class="nav nav-collapse">
                <li>
                  <a href="chart">
                    <span class="sub-item">Chart Js</span>
                  </a>
                </li>
                
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a data-bs-toggle="collapse" href="#calendar">
              <i class="far fa-calendar"></i>
              <p>Calendar</p>
              <span class="caret"></span>
            </a>
            <div class="collapse" id="Calendar">
              <ul class="nav nav-collapse">
                <li>
                  <a href="calendar">
                    <span class="sub-item">Calendar</span>
                  </a>
                </li>
                
              </ul>
            </div>
          </li>
          
        </ul>
      </div>
    </div>
  </div>
  <!-- End Sidebar -->