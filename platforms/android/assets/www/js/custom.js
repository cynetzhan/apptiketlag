var menuState = false;
var viewCurrent, viewPrev, viewNext;
var backKey = 0;
    $('document').ready(function() {
        //  !--link listener--!  //
        $('a#exit').click(function() {
            navigator.app.exitApp();
          });
        //  !-- end of link listener --! //
        
		// kendali tombol bilah menu
        $('button.dropdown-toggle').on('click', function(e){
          if(!menuState){
            $(this).parent().toggleClass('open');
            $('.sidemenu').animate({left:'0'},500); 
			menuState=true;
			console.log("menuState is "+menuState); //untuk keperluan debugging
          } else {
            $('.sidemenu').animate({left:'-100vw'},500,function() {
              $('button.dropdown-toggle').parent().toggleClass('open');
            });
            menuState=false;
            console.log("menuState is "+menuState); //untuk keperluan debugging
          }
          });
		  
		  // kendali tombol refresh
          $('button.refresh').click(function(vw) {
            viewRefresh(vw);
          });
        });

//  !--kumpulan fungsi kendali link--!  //


// !--navigation control function--!  //
function viewRoute(vw){  // fungsi routing ke fungsi kendali link
  switch(vw){
    case 'gigs':
      viewGIGS();
      break;
    case 'gitl':
      viewGITL();
      break;
    case 'gibk':
      viewGIBK();
      break;
    case 'gikp':
      viewGIKP();
      break
    case 'gidm':
      viewGIDM();
      break;
    case 'gidr':
      viewGIDR();
      break;
    case 'gibp':
      viewGIBP();
      break;
    case 'gibb':
      viewGIBB();
      break;
    case 'gitk':
      viewGITK();
      break;
    case 'home':
      viewHome();
      break;
    case 'AvGIGH':
      viewAvGIGH();
      break;
    default:
      console.log('There is no such menu');
      break;
  }
  console.log("refreshing: "+vw);
}

function menuOpen(){
  $(this).parent().toggleClass('open');
  $('.sidemenu').animate({left:'0'},500);
  menuState=true;
}

function menuClose(){
  if(menuState){
    $('.sidemenu').animate({left:'-100vw'},500,function() {
      $('button.dropdown-toggle').parent().toggleClass('open');
    });
    menuState=false;
  }
  
}

function viewLoading(){
  //$('div#contentView').html("<span class='glyphicon glyphicon-refresh loading-ico'></span><br>Sedang Memuat...");
}

function viewTimeout(){
  $('div#contentView').html("<h3>Tidak dapat memuat. Periksa sambungan internet anda.</h3>")
}

function viewRefresh(){
  viewRoute(viewCurrent);
}

function prevHist(){
  viewRoute(viewPrev);
}

function onBackKeyDown(){
  console.log("BackKeyPressed");
  if(menuState){
      menuClose();
  } else {
    prevHist();
  }
}
//  !--end of navigation control function--!  //

