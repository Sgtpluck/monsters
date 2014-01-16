
(function(){
  document.addEventListener( "DOMContentLoaded", function( e ){

    // grabbing what will be the variables
    var pageviewEl = document.querySelector( '#pageview'),
        totalVisitsEl = document.querySelector( '#total_visits'),
        uniqEl = document.querySelector( '#uniq'),
        oneTimeEl = document.querySelector( '#one_time'),
        returnVisEl = document.querySelector( '#return'),
        mobileEl = document.querySelector( '#mobile'),
        pageviews = parseInt( pageviewEl.innerHTML, 10 ),
        totalVisits = parseInt( totalVisitsEl.innerHTML, 10 ),
        uniq = parseInt( uniqEl.innerHTML, 10 ),
        oneTime = parseInt( oneTimeEl.innerHTML, 10 ),
        returnVis = parseInt( returnVisEl.innerHTML, 10 ),
        mobile = parseInt( mobileEl.innerHTML, 10 );


    // setting the canvas and context
    var canvasRect = document.querySelector( "#canvasRect" ),
    context = canvasRect.getContext( '2d' );
    // setting the drawBarRect function
    var drawBarRect = function( height, color, xCoord){
    //being drawing
    context.beginPath();
    //draw the rectangle
    var rectWidth = 50;
    var rectHeight = height;
    var x = xCoord;
    var y = canvasRect.height - rectHeight;

    context.rect( x, y, rectWidth, rectHeight );
    //set fill color
    context.fillStyle = color;
    // fill in rectangle
    context.fill();
  };

  //   var canvasCirc = document.querySelector( "#canvasCirc" ),
  //   context = canvasCirc.getContext( '2d' );
  // //creating a drawCircle function
  //  var drawCircle = function( radianStart, radianEnd, color )
  //   context.beginPath();
  //   context.moveTo( originX, originY );
  //   context.arc( originX, originY, radius, 0, radianStart, radianEnd );
  //   context.closePath();
  //   context.fillStyle = color;
  //   context.fill(); 

  drawBarRect( pageviews, 'blue', 10);
  drawBarRect( totalVisits, 'red', 40)

});

})();